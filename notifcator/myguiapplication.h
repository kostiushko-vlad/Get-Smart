#ifndef MYGUIAPPLICATION_H
#define MYGUIAPPLICATION_H
#include <QGuiApplication>
#include <QObject>

class MyGuiApplication : public QGuiApplication
{
    Q_OBJECT
public:
    explicit MyGuiApplication(int &argc, char **argv, int = ApplicationFlags);;
    bool notify(QObject *receiver, QEvent *event);
signals:
    void back();

public slots:
};

#endif // MYGUIAPPLICATION_H
