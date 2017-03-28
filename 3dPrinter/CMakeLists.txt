set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5Concurrent REQUIRED)
find_package(Qt5Core REQUIRED)
find_package(Qt5OpenGL REQUIRED)
find_package(Qt5Widgets REQUIRED)

file(GLOB_RECURSE HEADERS ${CMAKE_CURRENT_SOURCE_DIR} *.h)
file(GLOB_RECURSE SOURCES ${CMAKE_CURRENT_SOURCE_DIR} *.cpp)

qt5_wrap_cpp(MOC_FILES MainWindow.h)
qt5_wrap_ui(UIC_FILES MainWindow.ui)
qt5_add_resources(RCC_FILES WorldViewer.qrc)

add_executable(ExampleWorldViewer WIN32 ${HEADERS} ${SOURCES} ${MOC_FILES} ${UIC_FILES} ${RCC_FILES})

target_link_libraries(ExampleWorldViewer ${ROBSIM_NAME})
target_link_libraries(ExampleWorldViewer Qt5::Concurrent Qt5::OpenGL Qt5::Widgets)

install(TARGETS ExampleWorldViewer RUNTIME DESTINATION bin)
