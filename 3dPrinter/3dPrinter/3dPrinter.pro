QT += core gui widgets opengl concurrent

TARGET = 3dPrinter
TEMPLATE = app

# Libraries.

INCLUDEPATH += \
    $$(ROBSIM_DIR)/include \
    $$(ASSIMP_DIR)/include \
    $$(BOOST_ROOT) \
    $$(BULLET_DIR)/include/bullet \
    $$(EIGEN3_DIR) \
    $$(OGRE_HOME)/include/OGRE

LIBS += \
    -L$$(ROBSIM_DIR)/lib \
    -L$$(BOOST_LIBRARYDIR)

CONFIG(debug, debug|release) {
    LIBS += -L$$(OGRE_HOME)/lib/debug
    LIBS += -lRobSimd -lOgreMain_d
} else {
    LIBS += -L$$(OGRE_HOME)/lib/release
    LIBS += -lRobSim -lOgreMain
}

QMAKE_CFLAGS_WARN_ON = -wd4251

SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h \
    CallbackSink.h \
    WorldViewerException.h

FORMS    += mainwindow.ui

RESOURCES += \
    WorldViewer.qrc

