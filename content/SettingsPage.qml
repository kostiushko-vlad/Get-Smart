import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import "../"

BasePage {
    id: settingsPage
    anchors.fill: parent
    Item {
       width: parent.width
       anchors.top:parent.top
       anchors.bottom: okButton.bottom
       anchors.bottomMargin: 25
       StackView {
           id: settingsStack
           anchors.centerIn: parent
           width: settingsPage.width * 0.7
           height: settingsPage.height * 0.8
           initialItem: SettingsForm {
           }
       }
    }
    Button {
        id: okButton
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.7
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        text: "OK"
        Material.background: Material.Blue
        Material.foreground: "white"
        onClicked: {
           settingsStack.pop()
           settingsStack.width = settingsPage.width * 0.7
           settingsStack.height = settingsPage.height * 0.8
           okButton.visible = false
        }
    }
}
