import QtQuick 2.0
import QtQuick.Controls 2.2
import "qrc:/qml/QmlIncludes/" as QmlIncludes

Rectangle {
    id: rootElement
    anchors.fill: parent

    function formArray()
    {
        var arr = {imageLink:imageLinkField.text, pageLink:pageLinkField.text, quioteText:quioteField.text};
        return arr
    }

    Rectangle {
        id: inputPageLink
        width: parent.width
        height: 50
        color: "#949494"
        anchors.top: rootElement.top
        anchors.topMargin: 5
        radius: 5
        Label {
            id: labelPageLink
            text: "Page link"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.topMargin: 5
            font.pixelSize: 14
        }
        TextField {
            id: pageLinkField
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: labelPageLink.bottom
            anchors.rightMargin: parent.width / 20
            anchors.leftMargin: 10
            anchors.bottomMargin: 3
        }
    }

    Rectangle {
        id: inputImageLink
        width: parent.width
        height: 50
        color: "#949494"
        anchors.top: inputPageLink.bottom
        anchors.topMargin: 5
        radius: 5
        Label {
            id: labelImageLink
            text: "Image(s) link"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.topMargin: 5
            font.pixelSize: 14
        }
        TextField {
            id: imageLinkField
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: labelImageLink.bottom
            anchors.rightMargin: parent.width / 20
            anchors.leftMargin: 10
            anchors.bottomMargin: 3
        }
    }

    Rectangle {
        id: inputQuiote
        width: parent.width
        height: 200
        color: "#949494"
        anchors.top: inputImageLink.bottom
        anchors.topMargin: 5
        radius: 5
        Label {
            id: labelQuiote
            text: "Page link"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.topMargin: 5
            font.pixelSize: 14
        }
        Rectangle {
            color: "White"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: labelQuiote.bottom
            anchors.rightMargin: parent.width / 20
            anchors.leftMargin: 10
            anchors.bottomMargin: 3
            Flickable {
                anchors.fill: parent
                ScrollBar.vertical: ScrollBar {}
                TextArea.flickable: TextArea {
                    id: quioteField
                    placeholderText: qsTr("Enter some text...")
                    wrapMode: TextArea.Wrap
                }
            }
        }
    }

    QmlIncludes.KawaiButton {
        id: quioteEnterButton
        anchors.top: inputQuiote.bottom
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.leftMargin: 5
        labelText: "Save note"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                jHandler.redoOrAddItem("quiotesFromNet", formArray(), -1)
                quioteStatusRectangle.color = "Red"
            }
        }
    }

    Rectangle {
        id: quioteStatusRectangle
        anchors.left: quioteEnterButton.right
        anchors.leftMargin: 20
        anchors.top: inputQuiote.bottom
        anchors.topMargin: 12
        height: 30
        width: 30
        color: "Green"
    }

    Connections {
        target: jHandler
        onItemAdded: quioteStatusRectangle.color = "Green"
    }
}
