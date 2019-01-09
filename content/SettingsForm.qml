import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import "../"
ColumnLayout {
    width: implicitWidth
    height: implicitHeight
    Button {
        id: accountButton
        text: "Change account"
        Layout.minimumWidth: settingsPage.width * 0.7
        Material.background: Material.Blue
        Material.foreground: "white"
        onClicked: {
            settingsStack.push("qrc:/content/CreateAccountForm.qml")
            okButton.visible = true
        }
    }
    Button {
        id: categoriesButton
        text: "Set categories"
        Layout.minimumWidth: settingsPage.width * 0.7
        Material.background: Material.Blue
        Material.foreground: "white"
        onClicked: {
            settingsStack.push("qrc:/content/CategorySelectionForm.qml")
            okButton.visible = true
            settingsStack.currentItem.width = settingsPage.width * 0.9
            settingsStack.width = settingsPage.width * 0.9
        }
    }
    Button {
        id: timeButton
        text: "Set learning time"
        Layout.minimumWidth: settingsPage.width * 0.7
        Material.background: Material.Blue
        Material.foreground: "white"
        onClicked: {
            settingsStack.push("qrc:/content/TimeSelectionForm.qml")
            okButton.visible = true
            settingsStack.currentItem.anchors.horizontalCenter = settingsStack.horizontalCenter
        }
    }
}
