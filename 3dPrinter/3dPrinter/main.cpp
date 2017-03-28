#include "MainWindow.h"

#include <QApplication>
#include <QGLFormat>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QGLFormat format;
    format.setSampleBuffers(true);
    format.setSamples(4);
    QGLFormat::setDefaultFormat(format);

    MainWindow window;
    window.show();

    return app.exec();
}
