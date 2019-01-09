import QtQuick 2.0
import QtQuick.Layouts 1.3

BasePage {
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        Image {
            id: icon
            source: "qrc:/images/icon.svg"
            Layout.alignment: Qt.AlignHCenter
            sourceSize: Qt.size(80,80)
            Layout.maximumWidth: 80
            Layout.maximumHeight: 80
        }

        Text {
            text: "What ist Get Smart? "
        }

        Text {
            Layout.maximumWidth: parent.width
            wrapMode: Text.WordWrap

            text: "Get smart is an application that allows you to learn about new topics or to enrich your knowledge on topics that are already familiar to you.
By getting push notifications at a pre-set time you are able to nourish your knowledge at a convenient time that fits into your daily routine.
"
        }
        Text {
            text: "Getting started"
        }
        Text {
            Layout.maximumWidth: parent.width
            wrapMode: Text.WordWrap
            text: "To ensure an easy start you have to enter your name and email address. Secondly you have to pick the the topics you are interested in and finally chose the time at which you want to receive push notifications.
 Changes can be made at every time in the side menu panel under settings. Furthermore you can find other options there like ..... (weiss nicht was du drinnen gelassen hast. History? Favorites? )"
        }

    }
}
