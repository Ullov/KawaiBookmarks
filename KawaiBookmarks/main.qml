import QtQuick 2.11
import QtQuick.Window 2.11
import "qrc:/qml/QmlIncludes/" as QmlIncludes
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("KawaiBookmarks")
    visibility: "Maximized"

    TabView {
        id: tabs
        anchors.fill: parent
        Component.onCompleted: {
            addTab("Home Tab", homeTab)
        }

        Component {
            id: homeTab
            Rectangle {
                color: "#2849de"
                anchors.fill: parent

                Grid {
                    id: gridWithButtons
                    anchors.centerIn: parent
                    columns: 8
                    spacing: 5

                    QmlIncludes.KawaiLoadTabButton {
                        id: quiotesStartButton
                        labelText: "Quiotes From Net"
                        siteFile: "qrc:/qml/types/quiotesFromNet/quiotesTabs.qml"
                        tabTitle: "Quiotes From Net"
                    }

                    QmlIncludes.KawaiLoadTabButton {
                        id: animeStartButton
                        labelText: "Anime"
                        siteFile: "qrc:/qml/types/anime/animeTabs.qml"
                        tabTitle: "Anime"
                    }
                }

                Rectangle {
                    id: savePathChanger
                    width: parent.width
                    height: 50
                    color: "#949494"
                    anchors.top: gridWithButtons.bottom
                    anchors.bottomMargin: 30
                    radius: 5
                    Label {
                        id: labelSavePathChanger
                        text: "Save path"
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 5
                        font.pixelSize: 14
                    }
                    TextField {
                        id: fieldSavePathChanger
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: statusRectangle.left
                        anchors.top: labelSavePathChanger.bottom
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 3
                    }
                    QmlIncludes.KawaiButton {
                        id: refreshButton
                        anchors.right: changePathButton.left
                        labelText: "Refresh"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                jHandler.getSavePath()
                                statusRectangle.color = "Red"
                            }
                        }
                    }
                    QmlIncludes.KawaiButton {
                        id: changePathButton
                        anchors.right: parent.right
                        labelText: "Change path"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                jHandler.setSavePath(fieldSavePathChanger.text)
                                statusRectangle.color = "Red"
                            }
                        }
                    }
                    Rectangle {
                        id: statusRectangle
                        anchors.right: refreshButton.left
                        height: 30
                        width: 30
                        color: "Green"
                    }

                    Connections {
                        target: jHandler
                        onSavePathSignal: {
                            fieldSavePathChanger.text = savePath
                            statusRectangle.color = "Green"
                        }
                    }
                }
            }
        }

        function loadTab(siteFile, title){
            var cTab = currentIndex
            var t = addTab(title, Qt.createComponent(siteFile))
            currentIndex = cTab
        }

        style: TabViewStyle {
            frameOverlap: 1
            tabsMovable: true
            tab: Rectangle {
                color: styleData.selected ? "#484848" : "#dddddd"
                border.color: "steelblue"
                implicitWidth: Math.max(text.width + 4, 80)
                implicitHeight: 30

                Text {
                    id: text
                    anchors.centerIn: parent
                    text: styleData.title
                    color: styleData.selected ? "white" : "black"
                }
            }
            frame: Rectangle { color: "steelblue" }
        }
    }
}
