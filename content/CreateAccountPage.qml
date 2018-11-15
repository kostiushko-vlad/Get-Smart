import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import "../"
Item {
    id:accountPage
    anchors.fill: parent
    signal registered()
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
                text: "Create an account"
                font.pixelSize: 23
            }
        }
        TextField {
            Layout.fillWidth: true
            placeholderText: "Name"
            onEditingFinished: Helpers.userFirstName = text
        }
        TextField {
            Layout.fillWidth: true
            placeholderText: "Nachname"
            onEditingFinished: Helpers.userSecondName = text
        }
        TextField {
            Layout.fillWidth: true
            placeholderText: "Email"
            onEditingFinished: Helpers.userEmail = text
        }
        Button {
            Layout.topMargin: 10
            Layout.fillWidth: true
            text: "Anmelden"
            Material.background: Material.Blue
            Material.foreground: "white"
            onClicked: {
                accountPage.registered()
            }
        }
    }
}
