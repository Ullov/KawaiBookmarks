import QtQuick 2.0
import "qrc:/qml/QmlIncludes/" as QmlIncludes
import QtQuick.Controls 2.2

Rectangle {
    anchors.fill: parent
    QmlIncludes.KawaiButton {
        id: refreshButton
        anchors.right: parent.right
        labelText: "Refesh"
        MouseArea {
            anchors.fill: parent
            onClicked: jHandler.getAllItems("anime")
        }
    }
    Rectangle {
        id: rootTableRectangle
        anchors.top: refreshButton.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5
        radius: 5
        border.color: "Black"
        Rectangle {
            id: tableHeader
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            border.color: "Black"
            radius: 5
            height: 50
            Rectangle {
                id: indexInHeader
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: percentFromNumber(5, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: "#"
                }
            }
            Rectangle {
                id: enTitleNameInHeader
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: indexInHeader.right
                anchors.bottom: parent.bottom
                width: percentFromNumber(25, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: "Title name (En)"
                }
            }
            Rectangle {
                id: jpTitleNameInHeader
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: enTitleNameInHeader.right
                anchors.bottom: parent.bottom
                width: percentFromNumber(25, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: "Title name (Jp)"
                }
            }
            Rectangle {
                id: ruTitleNameInHeader
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: jpTitleNameInHeader.right
                anchors.bottom: parent.bottom
                width: percentFromNumber(25, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: "Title name (Ru)"
                }
            }
            Rectangle {
                id: episodesInHeader
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: ruTitleNameInHeader.right
                anchors.bottom: parent.bottom
                width: percentFromNumber(3, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: "Episodes"
                }
            }
            Rectangle {
                id: viewedInHeader
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: episodesInHeader.right
                anchors.bottom: parent.bottom
                width: percentFromNumber(4, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: "Viewed"
                }
            }
            Rectangle {
                id: studioInHeader
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: viewedInHeader.right
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: "Studio(s)"
                }
            }
        }
        QmlIncludes.KawaiHorisontalLine {
            id: line
            anchors.top: tableHeader.bottom
            anchors.left: parent.left
            anchors.right: parent.right
        }

        ListView {
            id: listViewItem
            model: modelItem
            delegate: delegateItem
            anchors.top: line.bottom
            anchors.left: rootTableRectangle.left
            anchors.right: rootTableRectangle.right
            anchors.bottom: rootTableRectangle.bottom
            anchors.margins: 5
            clip: true
            ScrollBar.vertical: ScrollBar {
                id: scrollBarItem
                policy: ScrollBar.AlwaysOn
            }
            Keys.onUpPressed: scrollBarItem.decrease()
            Keys.onDownPressed: scrollBarItem.increase()
        }
    }

    Component {
        id: delegateItem
        Rectangle {
            id: baseComponentRectangle
            height: 50
            anchors.left: parent.left
            anchors.right: parent.right
            Rectangle {
                id: indexInComponent
                anchors.leftMargin: 0
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.rightMargin: 5
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: percentFromNumber(5, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: index
                }
            }
            Rectangle {
                id: enTitleNameInComponent
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: indexInComponent.right
                anchors.bottom: parent.bottom
                width: percentFromNumber(25, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: enTitleName
                }
            }
            Rectangle {
                id: jpTitleNameInComponent
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: enTitleNameInComponent.right
                anchors.bottom: parent.bottom
                width: percentFromNumber(25, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: jpTitleName
                    font.pixelSize: 15
                }
            }
            Rectangle {
                id: ruTitleNameInComponent
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: jpTitleNameInComponent.right
                anchors.bottom: parent.bottom
                width: percentFromNumber(25, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: ruTitleName
                }
            }
            Rectangle {
                id: episodesInComponent
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: ruTitleNameInComponent.right
                anchors.bottom: parent.bottom
                width: percentFromNumber(3, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: numberOfTheEpisodes
                }
            }
            Rectangle {
                id: viewedInComponent
                anchors.margins: 5
                anchors.top: parent.top
                anchors.left: episodesInComponent.right
                anchors.bottom: parent.bottom
                width: percentFromNumber(4, tableHeader.width)
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: viewed
                }
            }
            Rectangle {
                id: studioInComponent
                anchors.leftMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.rightMargin: 0
                anchors.top: parent.top
                anchors.left: viewedInComponent.right
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                radius: 5
                border.color: "Black"
                Label {
                    anchors.centerIn: parent
                    text: studio
                }
            }
        }
    }
    ListModel {
        id: modelItem
    }

    Connections {
        target: jHandler
        onAllItems: {
            if (itemType == "anime")
            {
                addingElements(items)
            }
        }
    }
    function percentFromNumber(percent, number)
    {
        return (number / 100) * percent
    }
    function addingElements(elements) {
        modelItem.clear()
        var jArr = elements["items"]
        for (var i = 0; jArr[i]; i++) {
            modelItem.append({
                                 index: i,
                                 enTitleName: jArr[i]["titleName"]["en"],
                                 jpTitleName: jArr[i]["titleName"]["jp"],
                                 ruTitleName: jArr[i]["titleName"]["ru"],
                                 numberOfTheEpisodes: jArr[i]["numberOfTheEpisodes"],
                                 viewed: jArr[i]["viewed"],
                                 studio: jArr[i]["studio"]
                             })
        }
    }
}
