#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "cpp_h/jsonhandler.h"
#include <QTextCodec>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QTextCodec *codec = QTextCodec::codecForName("UTF-8");
    QTextCodec::setCodecForLocale(codec);

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    JsonHandler *jHandler = new JsonHandler();
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("jHandler", jHandler);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
