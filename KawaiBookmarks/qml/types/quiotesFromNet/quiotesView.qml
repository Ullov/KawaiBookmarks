import QtQuick 2.0
import "qrc:/qml/QmlIncludes/" as QmlIncludes
import QtQuick.Controls 2.2

Rectangle {
    anchors.fill: parent
    Connections {
        target: jHandler
        onAllItems: {
            if (itemType == "quiotesFromNet")
            {
                addingElements(items)
            }
        }
    }

    QmlIncludes.KawaiButton {
        id: refreshButton
        anchors.right: parent.right
        labelText: "Refresh"
        MouseArea {
            anchors.fill: parent
            onClicked: jHandler.getAllItems("quiotesFromNet")
        }
    }

    property string innerColorValue: "#da7474"
    property int fontSize: 14
    Component {
        id: delegateItem
        Rectangle {
            id: rectangleItem
            height: 350
            width: parent.width - 15
            color: "#d1d1d1"
            Rectangle {
                id: indexRectangle
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.margins: 5
                width: 50
                color: innerColorValue
                radius: 5
                Label {
                    anchors.margins: 5
                    anchors.fill: parent
                    text: "#" + number
                }
            }

            Rectangle {
                id: pageLinkRectangle
                anchors.left: indexRectangle.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 5
                height: 25
                color: innerColorValue
                radius: 5
                clip: true
                TextEdit {
                    anchors.margins: 5
                    anchors.fill: parent
                    text: pageLink
                    readOnly: true
                    selectByMouse: true
                    font.pixelSize: fontSize
                }
            }

            Rectangle {
                id: quioteTextRectangle
                anchors.margins: 5
                anchors.top: pageLinkRectangle.bottom
                anchors.left: indexRectangle.right
                anchors.right: parent.right
                anchors.bottom: dateRectangle.top
                clip: true
                color: innerColorValue
                radius: 5
                Flickable {
                    anchors.fill: parent
                    ScrollBar.vertical: ScrollBar {}
                    contentHeight: quioteTextEdit.height + 10
                    TextEdit {
                        id: quioteTextEdit
                        anchors.margins: 5
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.right: parent.right
                        clip: true
                        text: quioteText
                        wrapMode: Text.WordWrap
                        readOnly: true
                        selectByMouse: true
                        font.pixelSize: fontSize
                    }
                }
            }

            Rectangle {
                id: dateRectangle
                anchors.margins: 5
                anchors.left: indexRectangle.right
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                height: 25
                color: innerColorValue
                radius: 5
                Label {
                    anchors.margins: 5
                    anchors.fill: parent
                    text: dateAndTime
                    font.pixelSize: fontSize
                }
            }
        }
    }

    ListModel {
        id: modelItem
    }

    ListView {
        id: listViewItem
        model: modelItem
        delegate: delegateItem
        anchors.top: refreshButton.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5
        spacing: 10
        clip: true
        ScrollBar.vertical: ScrollBar {
            id: scrollBarItem
            policy: ScrollBar.AlwaysOn
        }
        Keys.onUpPressed: scrollBarItem.decrease()
        Keys.onDownPressed: scrollBarItem.increase()
    }

    function addingElements(elements) {
        modelItem.clear()
        var jArr = elements["items"]
        for (var i = 0; jArr[i]; i++) {
            modelItem.append({number: i, imageLink: jArr[i]["imageLink"], quioteText: jArr[i]["quioteText"], dateAndTime: jArr[i]["dateAndTime"], pageLink: jArr[i]["pageLink"]})
        }
    }
}
