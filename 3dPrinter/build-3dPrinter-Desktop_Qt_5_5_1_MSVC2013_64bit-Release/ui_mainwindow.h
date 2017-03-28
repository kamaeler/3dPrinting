/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.5.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QFrame>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPlainTextEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSlider>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QSplitter>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>
#include "RobSim/Qt/OgreWidget.h"

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QVBoxLayout *verticalLayout;
    QSplitter *sidebarSplitter;
    QFrame *frame_2;
    QVBoxLayout *verticalLayout_8;
    QSplitter *messagesSplitter;
    QWidget *layoutWidget;
    QVBoxLayout *verticalLayout_6;
    RobSim::OgreWidget *viewer;
    QFrame *playback;
    QHBoxLayout *controls;
    QSlider *pathSlider;
    QPushButton *play;
    QPlainTextEdit *messages;
    QFrame *frame;
    QVBoxLayout *verticalLayout_2;
    QPushButton *loadWorld;
    QGroupBox *groupBox;
    QVBoxLayout *verticalLayout_3;
    QFormLayout *formLayout_2;
    QLabel *label;
    QComboBox *robot;
    QLabel *label_2;
    QComboBox *joint;
    QLabel *label_3;
    QLabel *valueLabel;
    QLabel *label_4;
    QComboBox *configuration;
    QHBoxLayout *horizontalLayout;
    QLabel *minLabel;
    QSlider *value;
    QLabel *maxLabel;
    QGroupBox *groupBox_2;
    QVBoxLayout *verticalLayout_4;
    QCheckBox *viewVisualisation;
    QCheckBox *viewCollision;
    QCheckBox *viewAabb;
    QGroupBox *groupBox_3;
    QVBoxLayout *verticalLayout_5;
    QCheckBox *collision;
    QGroupBox *groupBox_4;
    QVBoxLayout *verticalLayout_7;
    QPushButton *setStart;
    QPushButton *setGoal;
    QPushButton *plan;
    QSpacerItem *verticalSpacer;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(1280, 720);
        MainWindow->setStyleSheet(QLatin1String("QSplitter::handle {\n"
"	background: #999;\n"
"}\n"
"\n"
"#playback {\n"
"	border-top: 1px solid #999;\n"
"	background: #FFF;\n"
"	padding: 5;\n"
"}\n"
"\n"
"#messages {\n"
"	border: none;\n"
"}"));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QStringLiteral("centralwidget"));
        verticalLayout = new QVBoxLayout(centralwidget);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        sidebarSplitter = new QSplitter(centralwidget);
        sidebarSplitter->setObjectName(QStringLiteral("sidebarSplitter"));
        sidebarSplitter->setOrientation(Qt::Horizontal);
        sidebarSplitter->setHandleWidth(1);
        frame_2 = new QFrame(sidebarSplitter);
        frame_2->setObjectName(QStringLiteral("frame_2"));
        verticalLayout_8 = new QVBoxLayout(frame_2);
        verticalLayout_8->setSpacing(0);
        verticalLayout_8->setObjectName(QStringLiteral("verticalLayout_8"));
        verticalLayout_8->setContentsMargins(0, 0, 0, 0);
        messagesSplitter = new QSplitter(frame_2);
        messagesSplitter->setObjectName(QStringLiteral("messagesSplitter"));
        messagesSplitter->setOrientation(Qt::Vertical);
        messagesSplitter->setHandleWidth(1);
        layoutWidget = new QWidget(messagesSplitter);
        layoutWidget->setObjectName(QStringLiteral("layoutWidget"));
        verticalLayout_6 = new QVBoxLayout(layoutWidget);
        verticalLayout_6->setSpacing(0);
        verticalLayout_6->setObjectName(QStringLiteral("verticalLayout_6"));
        verticalLayout_6->setContentsMargins(0, 0, 0, 0);
        viewer = new RobSim::OgreWidget(layoutWidget);
        viewer->setObjectName(QStringLiteral("viewer"));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::MinimumExpanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(viewer->sizePolicy().hasHeightForWidth());
        viewer->setSizePolicy(sizePolicy);

        verticalLayout_6->addWidget(viewer);

        playback = new QFrame(layoutWidget);
        playback->setObjectName(QStringLiteral("playback"));
        controls = new QHBoxLayout(playback);
        controls->setObjectName(QStringLiteral("controls"));
        pathSlider = new QSlider(playback);
        pathSlider->setObjectName(QStringLiteral("pathSlider"));
        pathSlider->setEnabled(false);
        pathSlider->setMaximum(1000);
        pathSlider->setOrientation(Qt::Horizontal);

        controls->addWidget(pathSlider);

        play = new QPushButton(playback);
        play->setObjectName(QStringLiteral("play"));
        play->setEnabled(false);
        QIcon icon;
        icon.addFile(QStringLiteral(":/icons/play.png"), QSize(), QIcon::Normal, QIcon::Off);
        play->setIcon(icon);
        play->setIconSize(QSize(32, 32));

        controls->addWidget(play);


        verticalLayout_6->addWidget(playback);

        messagesSplitter->addWidget(layoutWidget);
        messages = new QPlainTextEdit(messagesSplitter);
        messages->setObjectName(QStringLiteral("messages"));
        messagesSplitter->addWidget(messages);

        verticalLayout_8->addWidget(messagesSplitter);

        sidebarSplitter->addWidget(frame_2);
        frame = new QFrame(sidebarSplitter);
        frame->setObjectName(QStringLiteral("frame"));
        frame->setMinimumSize(QSize(250, 0));
        frame->setFrameShape(QFrame::StyledPanel);
        frame->setFrameShadow(QFrame::Raised);
        verticalLayout_2 = new QVBoxLayout(frame);
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        loadWorld = new QPushButton(frame);
        loadWorld->setObjectName(QStringLiteral("loadWorld"));

        verticalLayout_2->addWidget(loadWorld);

        groupBox = new QGroupBox(frame);
        groupBox->setObjectName(QStringLiteral("groupBox"));
        verticalLayout_3 = new QVBoxLayout(groupBox);
        verticalLayout_3->setObjectName(QStringLiteral("verticalLayout_3"));
        formLayout_2 = new QFormLayout();
        formLayout_2->setObjectName(QStringLiteral("formLayout_2"));
        formLayout_2->setFieldGrowthPolicy(QFormLayout::AllNonFixedFieldsGrow);
        label = new QLabel(groupBox);
        label->setObjectName(QStringLiteral("label"));

        formLayout_2->setWidget(0, QFormLayout::LabelRole, label);

        robot = new QComboBox(groupBox);
        robot->setObjectName(QStringLiteral("robot"));
        robot->setEnabled(false);

        formLayout_2->setWidget(0, QFormLayout::FieldRole, robot);

        label_2 = new QLabel(groupBox);
        label_2->setObjectName(QStringLiteral("label_2"));

        formLayout_2->setWidget(2, QFormLayout::LabelRole, label_2);

        joint = new QComboBox(groupBox);
        joint->setObjectName(QStringLiteral("joint"));
        joint->setEnabled(false);

        formLayout_2->setWidget(2, QFormLayout::FieldRole, joint);

        label_3 = new QLabel(groupBox);
        label_3->setObjectName(QStringLiteral("label_3"));

        formLayout_2->setWidget(3, QFormLayout::LabelRole, label_3);

        valueLabel = new QLabel(groupBox);
        valueLabel->setObjectName(QStringLiteral("valueLabel"));

        formLayout_2->setWidget(3, QFormLayout::FieldRole, valueLabel);

        label_4 = new QLabel(groupBox);
        label_4->setObjectName(QStringLiteral("label_4"));

        formLayout_2->setWidget(1, QFormLayout::LabelRole, label_4);

        configuration = new QComboBox(groupBox);
        configuration->setObjectName(QStringLiteral("configuration"));
        configuration->setEnabled(false);

        formLayout_2->setWidget(1, QFormLayout::FieldRole, configuration);


        verticalLayout_3->addLayout(formLayout_2);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        minLabel = new QLabel(groupBox);
        minLabel->setObjectName(QStringLiteral("minLabel"));

        horizontalLayout->addWidget(minLabel);

        value = new QSlider(groupBox);
        value->setObjectName(QStringLiteral("value"));
        value->setEnabled(false);
        value->setMaximum(1000);
        value->setOrientation(Qt::Horizontal);

        horizontalLayout->addWidget(value);

        maxLabel = new QLabel(groupBox);
        maxLabel->setObjectName(QStringLiteral("maxLabel"));

        horizontalLayout->addWidget(maxLabel);


        verticalLayout_3->addLayout(horizontalLayout);


        verticalLayout_2->addWidget(groupBox);

        groupBox_2 = new QGroupBox(frame);
        groupBox_2->setObjectName(QStringLiteral("groupBox_2"));
        verticalLayout_4 = new QVBoxLayout(groupBox_2);
        verticalLayout_4->setObjectName(QStringLiteral("verticalLayout_4"));
        viewVisualisation = new QCheckBox(groupBox_2);
        viewVisualisation->setObjectName(QStringLiteral("viewVisualisation"));
        viewVisualisation->setChecked(true);

        verticalLayout_4->addWidget(viewVisualisation);

        viewCollision = new QCheckBox(groupBox_2);
        viewCollision->setObjectName(QStringLiteral("viewCollision"));
        viewCollision->setEnabled(true);
        viewCollision->setChecked(false);

        verticalLayout_4->addWidget(viewCollision);

        viewAabb = new QCheckBox(groupBox_2);
        viewAabb->setObjectName(QStringLiteral("viewAabb"));

        verticalLayout_4->addWidget(viewAabb);


        verticalLayout_2->addWidget(groupBox_2);

        groupBox_3 = new QGroupBox(frame);
        groupBox_3->setObjectName(QStringLiteral("groupBox_3"));
        verticalLayout_5 = new QVBoxLayout(groupBox_3);
        verticalLayout_5->setObjectName(QStringLiteral("verticalLayout_5"));
        collision = new QCheckBox(groupBox_3);
        collision->setObjectName(QStringLiteral("collision"));
        collision->setEnabled(false);
        collision->setCheckable(true);

        verticalLayout_5->addWidget(collision);


        verticalLayout_2->addWidget(groupBox_3);

        groupBox_4 = new QGroupBox(frame);
        groupBox_4->setObjectName(QStringLiteral("groupBox_4"));
        verticalLayout_7 = new QVBoxLayout(groupBox_4);
        verticalLayout_7->setObjectName(QStringLiteral("verticalLayout_7"));
        setStart = new QPushButton(groupBox_4);
        setStart->setObjectName(QStringLiteral("setStart"));

        verticalLayout_7->addWidget(setStart);

        setGoal = new QPushButton(groupBox_4);
        setGoal->setObjectName(QStringLiteral("setGoal"));

        verticalLayout_7->addWidget(setGoal);

        plan = new QPushButton(groupBox_4);
        plan->setObjectName(QStringLiteral("plan"));

        verticalLayout_7->addWidget(plan);


        verticalLayout_2->addWidget(groupBox_4);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_2->addItem(verticalSpacer);

        sidebarSplitter->addWidget(frame);

        verticalLayout->addWidget(sidebarSplitter);

        MainWindow->setCentralWidget(centralwidget);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "RobSim World Viewer", 0));
        play->setText(QString());
        loadWorld->setText(QApplication::translate("MainWindow", "Load World...", 0));
        groupBox->setTitle(QApplication::translate("MainWindow", "Robot", 0));
        label->setText(QApplication::translate("MainWindow", "Robot", 0));
        label_2->setText(QApplication::translate("MainWindow", "Joint", 0));
        label_3->setText(QApplication::translate("MainWindow", "Value", 0));
        valueLabel->setText(QApplication::translate("MainWindow", "0", 0));
        label_4->setText(QApplication::translate("MainWindow", "Configuration", 0));
        minLabel->setText(QApplication::translate("MainWindow", "0", 0));
        maxLabel->setText(QApplication::translate("MainWindow", "0", 0));
        groupBox_2->setTitle(QApplication::translate("MainWindow", "View", 0));
        viewVisualisation->setText(QApplication::translate("MainWindow", "View visualisation?", 0));
        viewCollision->setText(QApplication::translate("MainWindow", "View collision?", 0));
        viewAabb->setText(QApplication::translate("MainWindow", "View bounding boxes?", 0));
        groupBox_3->setTitle(QApplication::translate("MainWindow", "State", 0));
        collision->setText(QApplication::translate("MainWindow", "In collision?", 0));
        groupBox_4->setTitle(QApplication::translate("MainWindow", "Planning", 0));
        setStart->setText(QApplication::translate("MainWindow", "Set Start", 0));
        setGoal->setText(QApplication::translate("MainWindow", "Set Goal", 0));
        plan->setText(QApplication::translate("MainWindow", "Plan", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
