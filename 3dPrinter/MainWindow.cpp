#include "MainWindow.h"
#include "WorldViewerException.h"

#include <OgreMaterial.h>
#include <OgreMaterialManager.h>
#include <OgreViewport.h>

#include <QDebug>
#include <QException>
#include <QFileDialog>
#include <QMessageBox>
#include <QtConcurrent>

#include <RobSim/Collision/CollisionSystem.h>
#include <RobSim/Planning/PathSmoother.h>
#include <RobSim/Planning/PlanningSpace.h>
#include <RobSim/Planning/Prm.h>
#include <RobSim/Robot/Joint.h>
#include <RobSim/Robot/JointPath.h>
#include <RobSim/Robot/JointSet.h>
#include <RobSim/Robot/Robot.h>
#include <RobSim/Visual/VisualComponent.h>
#include <RobSim/Visual/VisualSystem.h>
#include <RobSim/World.h>

#include <cassert>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    m_ui(new Ui::MainWindow),
    m_collision(new RobSim::DefaultCollisionWorld)
{
    m_ui->setupUi(this);

    m_ui->sidebarSplitter->setStretchFactor(0, 1);
    m_ui->sidebarSplitter->setStretchFactor(1, 0);

    m_ui->messagesSplitter->setStretchFactor(0, 1);
    m_ui->messagesSplitter->setStretchFactor(1, 0);

    m_ui->viewer->createDefaultLights();
    m_ui->viewer->getViewport()->setBackgroundColour(Ogre::ColourValue(0.75f, 0.75f, 0.75f));

    m_manager = m_ui->viewer->getManager();

    m_collisionDrawer.reset(new RobSim::DebugDrawer(m_manager));
    m_collision->get()->setDebugDrawer(m_collisionDrawer.data());
    m_ui->viewer->getRoot()->addFrameListener(m_collisionDrawer.data());

    connect(m_ui->loadWorld, SIGNAL(clicked()), this, SLOT(loadWorld()));

    connect(m_ui->robot, SIGNAL(activated(int)), this, SLOT(chooseRobot(int)));
    connect(m_ui->joint, SIGNAL(activated(int)), this, SLOT(chooseJoint(int)));
    connect(m_ui->configuration, SIGNAL(activated(QString)), this, SLOT(chooseConfiguration(QString)));

    connect(m_ui->value, &QSlider::valueChanged, this, &MainWindow::changeJoint);
    connect(m_ui->pathSlider, &QSlider::valueChanged, this, &MainWindow::changePathPosition);
    connect(m_ui->play, &QPushButton::clicked, this, &MainWindow::playOrPause);

    m_pathAnimation = new QPropertyAnimation(m_ui->pathSlider, "value", this);
    m_pathAnimation->setStartValue(m_ui->pathSlider->minimum());
    m_pathAnimation->setEndValue(m_ui->pathSlider->maximum());
    m_pathAnimation->setDuration(5000);
    m_pathAnimation->setLoopCount(-1);

    connect(m_ui->viewVisualisation, &QCheckBox::stateChanged, this, &MainWindow::toggleVisualisation);
    connect(m_ui->viewCollision, &QCheckBox::stateChanged, this, &MainWindow::toggleCollision);
    connect(m_ui->viewAabb, &QCheckBox::stateChanged, this, &MainWindow::toggleAabb);

    connect(m_ui->setStart, &QPushButton::clicked, this, &MainWindow::setStart);
    connect(m_ui->setGoal, &QPushButton::clicked, this, &MainWindow::setGoal);
    connect(m_ui->plan, &QPushButton::clicked, this, &MainWindow::planPath);

    connect(m_ui->viewer, &RobSim::OgreWidget::rendering, [this]()
    {
        if (m_simulation.isNull() || !m_simulation->getSystem<RobSim::CollisionSystem>())
        {
            return;
        }

        m_ui->collision->setChecked(m_simulation->getSystem<RobSim::CollisionSystem>()->isColliding());
        m_collision->get()->debugDrawWorld();
    });

    m_buffer.open(CallbackSink([this](const std::string &str)
    {
        m_ui->messages->moveCursor(QTextCursor::End);
        m_ui->messages->insertPlainText(str.c_str());
    }));
    m_cout = std::cout.rdbuf(&m_buffer);
}

MainWindow::~MainWindow()
{
    std::cout.rdbuf(m_cout);
}

void MainWindow::loadWorld()
{
    auto file = QFileDialog::getOpenFileName(this, "Select World File", "", "Lua scripts (*.lua)");

    if (!file.isEmpty())
    {
        loadWorld(file);
    }
}

void MainWindow::loadWorld(const QString &path)
{
    auto watcher = new QFutureWatcher<void>(this);

    m_simulation.reset(new RobSim::Simulation);
    m_simulation->setBullet(m_collision->get());
    m_simulation->setOgre(m_manager);

    m_ui->loadWorld->setEnabled(false);
    m_ui->loadWorld->setText("Loading...");

    connect(watcher, &QFutureWatcher<void>::finished, [this, watcher]()
    {
        try
        {
            watcher->waitForFinished();

            m_simulation->initialise();
            m_ui->viewer->update();
            m_ui->viewer->zoomExtents();

            setupSimulation();
        }
        catch (const QException& e)
        {
            QMessageBox::critical(this, "Error Loading World", e.what());
        }

        m_ui->loadWorld->setEnabled(true);
        m_ui->loadWorld->setText("Load World");
    });

    watcher->setFuture(QtConcurrent::run([this, path]()
    {
        try
        {
            m_simulation->load(path.toStdString());
        }
        catch (const std::exception &e)
        {
            throw WorldViewerException(e.what());
        }
    }));
}

void MainWindow::setupSimulation()
{
    m_robots = m_simulation->getWorld()->get<RobSim::Robot>();

    m_ui->robot->clear();
    m_ui->robot->setEnabled(true);

    m_ui->joint->clear();
    m_ui->joint->setEnabled(false);
    m_ui->value->setEnabled(false);

    toggleVisualisation(m_ui->viewVisualisation->checkState());
    toggleCollision(m_ui->viewCollision->checkState());

    for (auto robot : m_robots)
    {
        m_ui->robot->addItem(robot->getName().c_str());

        // Jump all robots to home initially.
        if (robot->getHome())
        {
            robot->getHome()->apply();
        }
    }

    if (!m_robots.empty())
    {
        chooseRobot(0);
    }
}

void MainWindow::chooseRobot(int index)
{
    assert(index < m_robots.size());

    m_ui->joint->clear();
    m_ui->joint->setEnabled(true);

    m_robot = m_robots.at(index);

    populateConfigurations(m_ui->configuration);

    for (auto joint : m_robot->getJoints())
    {
        m_ui->joint->addItem(joint->getName().c_str());
    }

    if (m_robot->getJoints().getSize() > 0)
    {
        chooseJoint(0);
    }
}

void MainWindow::populateConfigurations(QComboBox *box)
{
    box->clear();
    box->setEnabled(true);
    box->addItem(QString());

    for (auto &conf : m_robot->getConfigurations())
    {
        box->addItem(conf->getName().c_str());
    }
}

void MainWindow::chooseJoint(int index)
{
    assert(index < m_robot->getJoints().getSize());

    m_joint = m_robot->getJoints()[index];

    auto lim = m_joint->getLimits();
    auto val = m_joint->getValue();

    m_ui->valueLabel->setText(QString::number(val));
    m_ui->minLabel->setText(QString::number(lim.first));
    m_ui->maxLabel->setText(QString::number(lim.second));

    m_ui->value->setValue((val - lim.first) / (lim.second - lim.first) * 1000.0f);
    m_ui->value->setEnabled(true);
}

void MainWindow::chooseConfiguration(const QString &name)
{
    if (!name.isEmpty())
    {
        m_robot->getConfiguration(name.toStdString())->apply();
    }
}

void MainWindow::changeJoint(int slider)
{
    auto lim = m_joint->getLimits();
    auto value = lim.first + (slider / 1000.0f) * (lim.second - lim.first);

    m_ui->valueLabel->setText(QString::number(value));
    m_joint->setValue(value);
}

void MainWindow::changePathPosition(int value)
{
    if (!m_path.isNull())
    {
        m_path->apply(value / 1000.0f);
    }
}

void MainWindow::playOrPause()
{
    switch (m_pathAnimation->state())
    {
        case QPropertyAnimation::Stopped: m_pathAnimation->start(); break;
        case QPropertyAnimation::Paused: m_pathAnimation->resume(); break;
        case QPropertyAnimation::Running: m_pathAnimation->pause(); break;
    }

    m_ui->play->setIcon(QIcon(m_pathAnimation->state() == QPropertyAnimation::Running
                              ? ":/icons/pause.png"
                              : ":/icons/play.png"));
}

void MainWindow::toggleVisualisation(int state)
{
    auto system = m_simulation->getWorld()->getSystemManager().get<RobSim::VisualSystem>();

    if (system)
    {
        system->setVisible(state == Qt::Checked);
    }
}

void MainWindow::toggleCollision(int state)
{
    if (state == Qt::Checked)
    {
        m_collisionDrawer->setDebugMode(m_collisionDrawer->getDebugMode() | btIDebugDraw::DBG_DrawWireframe);
    }
    else
    {
        m_collisionDrawer->setDebugMode(m_collisionDrawer->getDebugMode() & ~btIDebugDraw::DBG_DrawWireframe);
    }
}

void MainWindow::toggleAabb(int state)
{
    if (state == Qt::Checked)
    {
        m_collisionDrawer->setDebugMode(m_collisionDrawer->getDebugMode() | btIDebugDraw::DBG_DrawAabb);
    }
    else
    {
        m_collisionDrawer->setDebugMode(m_collisionDrawer->getDebugMode() & ~btIDebugDraw::DBG_DrawAabb);
    }
}

void MainWindow::setStart()
{
    if (m_robot)
    {
        m_startConfig = m_robot->getJoints().getJointValues();
    }
}

void MainWindow::setGoal()
{
    if (m_robot)
    {
        m_goalConfig = m_robot->getJoints().getJointValues();
    }
}

void MainWindow::planPath()
{
    if (!m_startConfig.size() || !m_goalConfig.size())
    {
        QMessageBox::critical(this,
                              "Invalid Configuration",
                              "Both a start and goal configuration must be selected");
        return;
    }

    RobSim::PlanningSpace pspace(&m_robot->getJoints(), m_simulation->getSystem<RobSim::CollisionSystem>());
    RobSim::Prm prm(&pspace);
    prm.setStart(m_startConfig);
    prm.setGoal(m_goalConfig);

    if (!prm.plan())
    {
        QMessageBox::critical(this, "Planning Failure", "A path could not be planned");
        return;
    }

    RobSim::PathSmoother smoother(static_cast<RobSim::JointPath *>(prm.getPath().get()), &pspace);
    m_path.reset(smoother.smooth().release());

    m_path.reset(prm.getPath().release());
    m_ui->pathSlider->setEnabled(true);
    m_ui->play->setEnabled(true);
}
