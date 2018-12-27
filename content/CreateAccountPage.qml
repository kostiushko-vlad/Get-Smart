import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import "../"
BasePage {
    id:accountPage
    anchors.fill: parent

    ColumnLayout {
        id:content
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
                text: "Create an account"
                font.pixelSize: 23
                color: Helpers.mainColor
            }
        }
        TextField {
            width: content.width
            Layout.fillWidth: true
            placeholderText: "Name"
            onEditingFinished: Helpers.userFirstName = text            
        }
        TextField {
            id: push
            width: content.width
            Layout.fillWidth: true
            placeholderText: "Nachname"
            onEditingFinished: Helpers.userSecondName = text
        }
        TextField {
            id:mailText
            selectByMouse: true
            width: content.width
            Layout.fillWidth: true
            placeholderText: "Email"
            validator: RegExpValidator { regExp:/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ }
            onEditingFinished: Helpers.userEmail = text
        }
        Button {
            enabled: mailText.acceptableInput
            width: content.width
            Layout.topMargin: 10
            Layout.fillWidth: true
            text: "Accept"
            Material.background: Material.Blue
            Material.foreground: "white"
            onClicked: {
                 startUpView.push("qrc:/content/CategorySelectionPage.qml")
            }
        }
    }
}
