/****************************************************************************
** Meta object code from reading C++ file 'mainwindow.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../3dPrinter/mainwindow.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainwindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_MainWindow_t {
    QByteArrayData data[20];
    char stringdata0[210];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MainWindow_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MainWindow_t qt_meta_stringdata_MainWindow = {
    {
QT_MOC_LITERAL(0, 0, 10), // "MainWindow"
QT_MOC_LITERAL(1, 11, 9), // "loadWorld"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 4), // "path"
QT_MOC_LITERAL(4, 27, 11), // "chooseRobot"
QT_MOC_LITERAL(5, 39, 5), // "index"
QT_MOC_LITERAL(6, 45, 11), // "chooseJoint"
QT_MOC_LITERAL(7, 57, 19), // "chooseConfiguration"
QT_MOC_LITERAL(8, 77, 4), // "name"
QT_MOC_LITERAL(9, 82, 11), // "changeJoint"
QT_MOC_LITERAL(10, 94, 5), // "value"
QT_MOC_LITERAL(11, 100, 18), // "changePathPosition"
QT_MOC_LITERAL(12, 119, 11), // "playOrPause"
QT_MOC_LITERAL(13, 131, 19), // "toggleVisualisation"
QT_MOC_LITERAL(14, 151, 5), // "state"
QT_MOC_LITERAL(15, 157, 15), // "toggleCollision"
QT_MOC_LITERAL(16, 173, 10), // "toggleAabb"
QT_MOC_LITERAL(17, 184, 8), // "setStart"
QT_MOC_LITERAL(18, 193, 7), // "setGoal"
QT_MOC_LITERAL(19, 201, 8) // "planPath"

    },
    "MainWindow\0loadWorld\0\0path\0chooseRobot\0"
    "index\0chooseJoint\0chooseConfiguration\0"
    "name\0changeJoint\0value\0changePathPosition\0"
    "playOrPause\0toggleVisualisation\0state\0"
    "toggleCollision\0toggleAabb\0setStart\0"
    "setGoal\0planPath"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MainWindow[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      14,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   84,    2, 0x08 /* Private */,
       1,    1,   85,    2, 0x08 /* Private */,
       4,    1,   88,    2, 0x08 /* Private */,
       6,    1,   91,    2, 0x08 /* Private */,
       7,    1,   94,    2, 0x08 /* Private */,
       9,    1,   97,    2, 0x08 /* Private */,
      11,    1,  100,    2, 0x08 /* Private */,
      12,    0,  103,    2, 0x08 /* Private */,
      13,    1,  104,    2, 0x08 /* Private */,
      15,    1,  107,    2, 0x08 /* Private */,
      16,    1,  110,    2, 0x08 /* Private */,
      17,    0,  113,    2, 0x08 /* Private */,
      18,    0,  114,    2, 0x08 /* Private */,
      19,    0,  115,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::Int,    5,
    QMetaType::Void, QMetaType::Int,    5,
    QMetaType::Void, QMetaType::QString,    8,
    QMetaType::Void, QMetaType::Int,   10,
    QMetaType::Void, QMetaType::Int,   10,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   14,
    QMetaType::Void, QMetaType::Int,   14,
    QMetaType::Void, QMetaType::Int,   14,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void MainWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MainWindow *_t = static_cast<MainWindow *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->loadWorld(); break;
        case 1: _t->loadWorld((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->chooseRobot((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->chooseJoint((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->chooseConfiguration((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->changeJoint((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->changePathPosition((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: _t->playOrPause(); break;
        case 8: _t->toggleVisualisation((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 9: _t->toggleCollision((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 10: _t->toggleAabb((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 11: _t->setStart(); break;
        case 12: _t->setGoal(); break;
        case 13: _t->planPath(); break;
        default: ;
        }
    }
}

const QMetaObject MainWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_MainWindow.data,
      qt_meta_data_MainWindow,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *MainWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_MainWindow.stringdata0))
        return static_cast<void*>(const_cast< MainWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 14)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 14;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 14)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 14;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
