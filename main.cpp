#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

#include <QSslConfiguration>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    // Ignore SSL Errors [Comment out before production]
       QSslConfiguration sslConf = QSslConfiguration::defaultConfiguration();
       sslConf.setPeerVerifyMode(QSslSocket::VerifyNone);
       QSslConfiguration::setDefaultConfiguration(sslConf);

    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
