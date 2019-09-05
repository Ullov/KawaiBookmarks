import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    anchors.fill: parent
    TabView {
        anchors.fill: parent
        id: quioteTabs
        Component.onCompleted: {
            addTab("Add quiote", Qt.createComponent("qrc:/qml/types/quiotesFromNet/quiotesMain.qml"))
            addTab("View quiote", Qt.createComponent("qrc:/qml/types/quiotesFromNet/quiotesView.qml"))
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

        function loadTab(siteFile, title){
            var cTab = currentIndex
            var t = addTab(title, Qt.createComponent(siteFile))
            currentIndex = cTab
        }
    }
}
