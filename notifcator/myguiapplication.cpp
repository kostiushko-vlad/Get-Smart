#include "myguiapplication.h"
#include <QDebug>

MyGuiApplication::MyGuiApplication(int &argc, char **argv, int flags):QGuiApplication (argc,argv,flags)
{

}

bool MyGuiApplication::notify(QObject *receiver, QEvent *event)
{
    // to intercept android's back button
    #ifdef Q_OS_ANDROID
        if(event->type() == QEvent::Close) {
            qDebug()<<"Event type "<<event->type();
            emit back();
            return false;
        }
        else {
            return QGuiApplication::notify(receiver,event);
        }
    #else
            return QGuiApplication::notify(receiver,event);
    #endif
}
