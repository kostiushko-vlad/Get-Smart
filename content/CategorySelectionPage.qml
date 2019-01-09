import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import "../"

BasePage {
    id: categorySelectionPage
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
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
        CategorySelectionForm {
            Layout.fillWidth: true
        }
        RowLayout {
            Button {
                id: backButton
                Layout.topMargin: 10
                Layout.fillWidth: true
                text: "Back"
                Material.background: Material.Blue
                Material.foreground: "white"
                onClicked: {
                    startUpView.pop()
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
                    startUpView.push("qrc:/content/TimeSelectionPage.qml")
                }
                Connections {
                    target: Helpers
                    onFeedsModelUpdated:nextButton.enabled = Helpers.selectedCategories.length > 0
                }
            }
        }
    }
}
