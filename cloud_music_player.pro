# 获取Qt的版本号
QT_VERSION = $$[QT_VERSION]

# 将版本号分割成主版本、次版本和修订版本
QT_VERSION_PARTS = $$split(QT_VERSION, .)
QT_VER_MAJOR = $$member(QT_VERSION_PARTS, 0)
QT_VER_MINOR = $$member(QT_VERSION_PARTS, 1)
QT_VER_PATCH = $$member(QT_VERSION_PARTS, 2)

QT += quick
QT += network


# 检查Qt的版本号是否是6.6
equals(QT_VER_MAJOR, 6):equals(QT_VER_MINOR, 6) {
    message("Qt version is 6.6")
    # 加载core5compat模块
    QT += core5compat
}

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    App.cpp \
    HttpUtil.cpp

RESOURCES += qml.qrc \
    static.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    HttpUtil.h
