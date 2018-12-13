import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import "../"

BasePage {
    id: categorySelectionPage
    ColumnLayout {
        anchors.centerIn: parent
        width: implicitWidth
        height: implicitHeight
        Rectangle {
            width: label.width + 30
            height: label.height + 30
            color: "transparent"
            Layout.alignment: Qt.AlignHCenter
            Label {
                id:label
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Select categories"
                font.pixelSize: 23
                color: Helpers.mainColor
            }
        }
        GridView {
            id: gridView
            Layout.alignment: Qt.AlignHCenter
            width: categorySelectionPage.width - 20
            height: cellHeight * rssFeeds.count / 3
            anchors.margins: 5
            model: RssFeeds {
                id:rssFeeds
            }
            cellWidth: gridView.width / 3
            cellHeight: 120
            delegate: CategoryDelegate {
                width: gridView.cellWidth - 8
                height: gridView.cellHeight - 8
                title: model.name
                imageUrl: model.image
                onSelectedChanged: {
                    if (selected) {
                        Helpers.selectedCategories.push(model.key)
                    } else {
                        var key = Helpers.selectedCategories.indexOf(model.key)
                        Helpers.selectedCategories.splice(key, 1)
                    }
                    Helpers.updateCategories()
                    nextButton.enabled = Helpers.selectedCategories.length > 0
                    console.log("Selected Categories changed " + Helpers.selectedCategories)
                }
            }
        }
        Button {
            id: nextButton
            enabled: false
            Layout.topMargin: 10
            Layout.fillWidth: true
            text: "Accept"
            Material.background: Material.Blue
            Material.foreground: "white"
            onClicked: {
                startUpView.visible = false
                mainStackView.visible = true
                mainStackView.push("qrc:/content/HomePage.qml")

            }
        }
    }
}
