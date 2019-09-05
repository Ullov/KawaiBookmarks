import QtQuick 2.0
import QtQuick.Controls 2.2
import "qrc:/qml/QmlIncludes/" as QmlIncludes

Rectangle {
    anchors.fill: parent
    QmlIncludes.KawaiButton {
        id: refreshButton
        anchors.top: parent.top
        anchors.right: parent.right
        labelText: "Refresh"
        MouseArea {
            anchors.fill: parent
            onClicked: jHandler.getAllItems("anime")
        }
    }
    TextField {
        id: indexTextField
        anchors.right: refreshButton.left
        anchors.margins: 5
        anchors.verticalCenter: refreshButton.verticalCenter
        placeholderText: "Enter anime indx (ID)..."
        height: 30
    }
    QmlIncludes.KawaiHorisontalLine {
        id: line
        anchors.top: refreshButton.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.right: parent.right
    }

    ScrollView {
        id: leftColumnScroll
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 5
        width: 300
        clip: true
        Flickable {
            contentHeight: titleInfo.height + descriptionRectangle.height + 30
            Rectangle {
                id: titleInfo
                anchors.left: parent.left
                anchors.margins: 5
                height: 500
                width: leftColumnScroll.width - 20
                radius: 5
                border.color: "Black"
                TextArea {
                    id: titleInfoTextArea
                    anchors.fill: parent
                    anchors.margins: 5
                    wrapMode: TextArea.WordWrap
                    readOnly: true
                    selectByMouse: true
                    text: "\
Name (en):\n
Name(jp):\n
Name(ru):\n
Type:\n
Episodes:\n
Status:\n
Airing start:\n
Airing end:\n
Studio(s):\n
Source:\n
Genre(s):\n
Duration:\n
Rating:\n
Start watch:\n
End watch:\n
Viewed:"
                }
            }
            Rectangle {
                id: descriptionRectangle
                anchors.top: titleInfo.bottom
                anchors.left: parent.left
                anchors.margins: 5
                width: leftColumnScroll.width - 20
                height: 350
                radius: 5
                border.color: "Black"
                TextArea {
                    id: descriptionTextArea
                    anchors.fill: parent
                    anchors.margins: 5
                    wrapMode: TextArea.WordWrap
                    readOnly: true
                    selectByMouse: true
                }
            }
        }
    }


    Connections {
        target: jHandler
        onAllItems: {
            if (itemType == "anime")
            {
                var number = parseInt(indexTextField.text)
                var jObj = items["items"][number]
                titleInfoTextArea.text = "\
Name (en): " + jObj["titleName"]["en"] + "\n
Name(jp): " + jObj["titleName"]["jp"] + "\n
Name(ru): " + jObj["titleName"]["ru"] + "\n
Type: " + jObj["type"] + "\n
Episodes: " + jObj["numberOfTheEpisodes"] + "\n
Status: " + jObj["status"] + "\n
Airing start: " + jObj["aired"]["start"] + "\n
Airing end: " + jObj["aired"]["end"] + "\n
Studio(s): " + jObj["studio"] + "\n
Source: " + jObj["source"] + "\n
Genre(s): " + jObj["genre"] + "\n
Duration: " + jObj["duration"] + "\n
Rating: " + jObj["rating"] + "\n
Start watch: " + jObj["whenStartWatch"] + "\n
End watch: " + jObj["whenEndWatch"] + "\n
Viewed: " + jObj["viewed"] + "\n
Add date: " + jObj["dateAndTime"]

                descriptionTextArea.text = jObj["description"]
            }
        }
    }
}
