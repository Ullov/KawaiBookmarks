#include "jsonhandler.h"


JsonHandler::JsonHandler()
{
    QFileInfo checkFile(configPath);
    if (checkFile.exists() && checkFile.isFile())
    {
        QFile file(configPath);
        file.open(QIODevice::ReadOnly | QIODevice::Text);
        filesPath = file.readAll();
    }
    else
    {
        filesPath = QStandardPaths::writableLocation(QStandardPaths::ConfigLocation) + '/';
        QFile file(configPath);
        file.open(QIODevice::WriteOnly | QIODevice::Text);
        file.write(filesPath.toStdString().c_str(), filesPath.size());
    }
}

void JsonHandler::setParam(QStringList hierarchyPath, QString param)
{
    /*int hier = hierarchyPath.size() - 1;
    QString lastFieldInHier = hierarchyPath[hierarchyPath.size() - 1];
    std::vector<QJsonObject> maybi;
    maybi.push_back(config);
    for (int i = 0; i < hier; i++)
    {
        maybi.push_back(maybi[i][hierarchyPath[i]].toObject());
    }
    maybi[maybi.size() - 1][lastFieldInHier] = param;
    for (int i = hier; i > 0; i--)
    {
        maybi[i - 1][hierarchyPath[i - 1]] = maybi[i];
        maybi.pop_back();
    }
    config = maybi[0];
    writeOnDrive();*/
}

void JsonHandler::writeOnDrive(QString path, QString fileName)
{
    QDir dir(path);
    if (!dir.exists())
    {
        dir.mkpath(path);
    }

    QFile file(path + fileName);
    if (file.open(QIODevice::WriteOnly | QIODevice::Text))
    {
        QJsonDocument jDoc(currentObject);
        long long bytesActually = file.write(jDoc.toJson(), jDoc.toJson().size());
        file.close();
    }
    else
    {
        QString fileNotOpened;
    }
}

QString JsonHandler::getParam(QStringList hierarchyPath)
{
    /*int hier = hierarchyPath.size() - 1;
    QString lastFieldInHier = hierarchyPath[hier];
    std::vector<QJsonObject> tmp;
    tmp.push_back(config);
    for (int i = 0; i < hier; i++)
    {
        tmp.push_back(tmp[i][hierarchyPath[i]].toObject());
    }
    QString target;
    if (tmp[tmp.size() - 1][lastFieldInHier].isDouble())
    {
        target = tmp[tmp.size() - 1][lastFieldInHier].toVariant().toString();
    }
    else
    {
        target = tmp[tmp.size() - 1][lastFieldInHier].toString();
    }
    return target;*/
}

void JsonHandler::setObject(QString objectName)
{
    currentObjectType = objectName;
    QString fileName;
    if (objectName == "quiotesFromNet")
    {
        fileName = "quiotesFromNet.json";
    }
    else if (objectName == "anime")
    {
        fileName = "anime.json";
    }
 
    QFileInfo checkFile(filesPath + "json\\" + fileName);
    if (checkFile.exists() && checkFile.isFile())
    {
        QFile file(filesPath + "json\\" + fileName);
        file.open(QIODevice::ReadOnly | QIODevice::Text);
        QString data = file.readAll();
        currentObject = QJsonDocument::fromJson(data.toUtf8()).object();
    }
    else
    {
        QJsonObject tmp;
        tmp["itemsHere"] = 0;
        tmp["version"] = "1";
        currentObject["info"] = tmp;
    }
}

void JsonHandler::redoOrAddItem(QString itemType, QVariantMap item, int itemIndex)
{
    setObject(itemType);
    QJsonObject tmp = QJsonObject::fromVariantMap(item);
    tmp["dateAndTime"] = getCurrentDate();
    QString savePath;
    QString fileName;
    if (itemType == "quiotesFromNet")
    {
        savePath = filesPath + "json/";
        fileName = "quiotesFromNet.json";
    }
    else if (itemType == "anime")
    {
        savePath = filesPath + "json/";
        fileName = "anime.json";
    }

    if (itemIndex == -1)
    {
        QJsonObject infoObject = currentObject.value("info").toObject();
        infoObject["itemsHere"] = infoObject["itemsHere"].toVariant().toInt() + 1;
        currentObject["info"] = infoObject;
        QJsonArray tmpArr = currentObject.value("items").toArray();
        tmpArr.push_back(tmp);
        currentObject["items"] = tmpArr;
    }
    else
    {
        QJsonArray tmpArr = currentObject.value("items").toArray();
        tmpArr[itemIndex] = tmp;
        currentObject["items"] = tmpArr;
    }
    writeOnDrive(savePath, fileName);

    emit itemAdded(currentObjectType);
}

void JsonHandler::getSavePath()
{
    emit savePathSignal(filesPath);
}

void JsonHandler::setSavePath(QString path)
{
    filesPath = path + '/';
    QFile file(configPath);
    file.open(QIODevice::WriteOnly | QIODevice::Text);
    file.write(filesPath.toStdString().c_str(), filesPath.size());

    emit savePathSignal(filesPath);
}

void JsonHandler::getAllItems(QString itemType)
{
    setObject(itemType);
    QJsonArray items = currentObject.value("items").toArray();

    emit allItems(currentObject, itemType);
}

QString JsonHandler::getCurrentDate()
{
    return QDateTime::currentDateTime().toString("dddd dd MMMM yyyy, hh:mm:ss:zzz (t)");
}
