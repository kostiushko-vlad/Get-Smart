QT += quick quickcontrols2 qml svg xml xmlpatterns network webview
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    notifcator/notificator.cpp \
    notifcator/notificator_android.cpp \
    notifcator/myguiapplication.cpp \
    notifcator/mainwindow.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
#LIBS += -L$$PWD/ -llibcryptoMDd
#PRE_TARGETDEPS += $$PWD/libcryptoMDd.lib
#PRE_TARGETDEPS += $$PWD/libsslMDd.lib
#LIBS += -L$$PWD/ -llibsslMDd
DISTFILES += \
    qmldir \
    android/AndroidManifest.xml \
    android/src/com/getsmart/at/FDMApplication.java \
    android/src/com/getsmart/at/NativeActivity.java \
    android/src/org/pwf/notificator/NotificatorBinding.java \
    android/src/com/getsmart/at/AlarmReceiver.java \
    android/build.gradle \
    android/src/com/getsmart/at/NotificationIntentService.java \
    android/src/com/getsmart/at/NotificationActivity.java

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/android/libcrypto.so \
        $$PWD/android/libssl.so


}
android {
    QT += androidextras
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
OTHER_FILES += \
    android/AndroidManifest.xml \
    android/res/drawable-hdpi/icon.png \
    android/res/drawable-mdpi/icon.png \
    android/res/drawable-xhdpi/icon.png \
    android/res/drawable-xxhdpi/icon.png \
    android/res/drawable-hdpi/idea.png \
    android/res/drawable-mdpi/idea.png \
    android/res/drawable-xhdpi/idea.png \
    android/res/drawable-xxhdpi/idea.png

}

HEADERS += \
    notifcator/notificator.h \
    notifcator/myguiapplication.h \
    notifcator/mainwindow.h
