import QtQuick 2.0
import "../"
BasePage {

    ListView {
        id: list
        anchors.fill: parent
        anchors.topMargin: 15
        anchors.leftMargin: 10
        anchors.rightMargin: 15
        spacing: 8
        clip: true
        model: Helpers.historyModel
        delegate: NewsDelegate {
            width: parent.width
            height: 80
            title: modelData.title
            image: modelData.image
            description: modelData.description
            link: modelData.link

        }
        Component.onCompleted: console.log("Histpry "+JSON.stringify(Helpers.historyModel))
    }
}
