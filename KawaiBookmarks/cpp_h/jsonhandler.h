#ifndef JSONHANDLER_H
#define JSONHANDLER_H

#include <QObject>
#include <QJsonObject>
#include <QStandardPaths>
#include <QFile>
#include <QJsonDocument>
#include <QFileInfo>
#include <QVariant>
#include <QJsonArray>
#include <QDir>
#include <QMap>
#include <QDateTime>

class JsonHandler : public QObject
{
    Q_OBJECT
public:
    JsonHandler();

private:
    void writeOnDrive(QString path, QString fileName);
    void setParam(QStringList hierarchyPath, QString param);
    QString getParam(QStringList hierarchyPath);
    void setObject(QString objctType);

private:
    QString filesPath;
    QString configPath = QStandardPaths::writableLocation(QStandardPaths::ConfigLocation) + "/config.txt";
    QJsonObject currentObject;
    QString currentObjectType;
    QString getCurrentDate();

public slots:
    void redoOrAddItem(QString itemType, QVariantMap item, int itemIndex);
    void getSavePath();
    void setSavePath(QString path);
    void getAllItems(QString itemType);

signals:
    void itemAdded(QString itemType);
    void savePathSignal(QString savePath);
    void allItems(QJsonObject items, QString itemType);
};

#endif // JSONHANDLER_H
