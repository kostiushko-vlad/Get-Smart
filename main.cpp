#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

#include <QSslConfiguration>
#include <QQmlContext>
#include "notifcator/notificator.h"
#include "notifcator/myguiapplication.h"

int main(int argc, char *argv[])
{
    Notificator::registerQMLTypes();
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    MyGuiApplication app(argc, argv);
    app.setOrganizationName("Get-Smart");
    app.setApplicationName("GetSmart1");

    // Ignore SSL Errors [Comment out before production]
       QSslConfiguration sslConf = QSslConfiguration::defaultConfiguration();
       sslConf.setPeerVerifyMode(QSslSocket::VerifyNone);
       QSslConfiguration::setDefaultConfiguration(sslConf);

    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    QQmlContext *rootContext = engine.rootContext();
    rootContext->setContextProperty("GUI", &app);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
