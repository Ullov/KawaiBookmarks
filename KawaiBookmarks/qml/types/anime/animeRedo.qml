import QtQuick 2.0
import QtQuick.Controls 2.2
import "qrc:/qml/QmlIncludes/" as QmlIncludes

Rectangle {
    anchors.fill: parent
    Rectangle {
        id: targetRectangle
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 5
        height: 50
        radius: 5
        border.color: "Black"
        TextField {
            id: targetTextField
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            placeholderText: "Enter anime index (ID)"
        }
        QmlIncludes.KawaiButton {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: targetTextField.right
            anchors.leftMargin: 5
            labelText: "Refresh"
            MouseArea {
                anchors.fill: parent
                onClicked: jHandler.getAllItems("anime")
            }
        }
    }

    Rectangle {
        id: leftHalfScreenRectangle
        anchors.margins: 5
        anchors.top: targetRectangle.bottom
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: (parent.width / 2) - 10
        border.color: "Black"

        TextField {
            id: titleNameEn
            anchors.right: parent.right
            anchors.left: parent.left
            placeholderText: "Title name (En)"
            height: 30
        }
        TextField {
            id: titleNameJp
            anchors.top: titleNameEn.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "Title name (Jp)"
            height: 30
        }
        TextField {
            id: titleNameRu
            anchors.top: titleNameJp.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "Title name (Ru)"
            height: 30
        }
        TextField {
            id: type
            anchors.top: titleNameRu.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "Type (OVA, Tv, Special etc.)"
            height: 30
        }
        TextField {
            id: numberOfTheEpisodes
            anchors.top: type.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "Number of the epicodes"
            height: 30
        }
        TextField {
            id: status
            anchors.top: numberOfTheEpisodes.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "Finished, ongoing or not aired yet"
            height: 30
        }
        TextField {
            id: airedStart
            anchors.top: status.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "When airing started (yyyy.mm.dd)"
            height: 30
        }
        TextField {
            id: airedEnd
            anchors.top: airedStart.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "When airing ended (yyyy.mm.dd)"
            height: 30
        }
        TextField {
            id: studio
            anchors.top: airedEnd.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "Studio(s) (separator semicolon)"
            height: 30
        }
        TextField {
            id: aSource
            anchors.top: studio.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "Source"
            height: 30
        }
        TextField {
            id: genre
            anchors.top: aSource.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "Genre(s) (separator semicolon)"
            height: 30
        }
        TextField {
            id: duration
            anchors.top: genre.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "Duration (mm)"
            height: 30
        }
        TextField {
            id: rating
            anchors.top: duration.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "R, RX, R-17 etc."
            height: 30
        }
        TextField {
            id: whenStartWatch
            anchors.top: rating.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "When start watch"
            height: 30
        }
        TextField {
            id: whenEndWatch
            anchors.top: whenStartWatch.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 5
            placeholderText: "When end watch"
            height: 30
        }
        Rectangle {
            id: viewedRectangle
            anchors.top: whenEndWatch.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 5
            height: 40
            border.color: "Black"
            Label {
                id: viewedLabel
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 12
                anchors.leftMargin: 3
                text: "Viewed"
            }
            CheckBox {
                id: viewed
                anchors.left: viewedLabel.right
            }
        }
        QmlIncludes.KawaiButton {
            id: enterButton
            anchors.top: viewedRectangle.bottom
            anchors.topMargin: 5
            labelText: "Save it all"
            MouseArea {
                anchors.fill: parent
                onClicked: jHandler.redoOrAddItem("anime", testFormArray(), targetTextField.text)
            }
        }
    }
    Rectangle {
        id: rightHalfScreenRectangle
        anchors.left: leftHalfScreenRectangle.right
        anchors.top: targetRectangle.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 5
        border.color: "Black"
        Label {
            id: descriptionLabel
            text: "Description"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 5
            height: 30
        }

        Rectangle {
            id: descriptionInnerRectangle
            anchors.top: descriptionLabel.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 5
            color: "#d1d1d1"
            TextArea {
                id: description
                anchors.fill: parent
                placeholderText: "Enter description..."
                wrapMode: TextArea.WordWrap
            }
        }
    }

    function formArray()
    {
        var arr = {
            titleNameEn:titleNameEn.text,
            titleNameJp:titleNameJp.text,
            titleNameRu:titleNameRu.text,
            type:type.text,
            numberOfTheEpisodes:numberOfTheEpisodes.text,
            status:status.text,
            airedStart:airedStart.text,
            airedEnd:airedEnd.text,
            studio:studio.text,
            source:aSource.text,
            genre:genre.text,
            duration:duration.text,
            rating:rating.text,
            whenStartWatch:whenStartWatch.text,
            whenEndWatch:whenEndWatch.text,
            viewed:viewed.checked,
            description:description.text
        };
        return arr
    }
    function testFormArray()
    {
        var arr = {
            titleName:
            {
                en:titleNameEn.text,
                jp:titleNameJp.text,
                ru:titleNameRu.text
            },
            type:type.text,
            numberOfTheEpisodes:numberOfTheEpisodes.text,
            status:status.text,
            aired:
            {
                start:airedStart.text,
                end:airedEnd.text
            },
            studio:studio.text,
            source:aSource.text,
            genre:genre.text,
            duration:duration.text,
            rating:rating.text,
            whenStartWatch:whenStartWatch.text,
            whenEndWatch:whenEndWatch.text,
            viewed:viewed.checked,
            description:description.text
        }
        return arr;
    }

    Connections {
        target: jHandler
        onAllItems: {
            if (itemType == "anime")
            {
                var index = targetTextField.text
                var jObj = items["items"][index]
                titleNameEn.text = jObj["titleName"]["en"]
                titleNameJp.text = jObj["titleName"]["jp"]
                titleNameRu.text = jObj["titleName"]["ru"]
                type.text = jObj["type"]
                numberOfTheEpisodes.text = jObj["numberOfTheEpisodes"]
                status.text = jObj["status"]
                airedStart.text = jObj["aired"]["start"]
                airedEnd.text = jObj["aired"]["end"]
                studio.text = jObj["studio"]
                aSource.text = jObj["source"]
                genre.text = jObj["genre"]
                duration.text = jObj["duration"]
                rating.text = jObj["rating"]
                whenStartWatch.text = jObj["whenStartWatch"]
                whenEndWatch.text = jObj["whenEndWatch"]
                viewed.checked = jObj["viewed"]
                description.text = jObj["description"]
            }
        }
    }
}
