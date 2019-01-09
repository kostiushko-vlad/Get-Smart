import QtQuick 2.0
import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import "../"

BasePage {
    id: timePage
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
                id: label
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Time for learning"
                font.pixelSize: 23
                color: Helpers.mainColor
            }
        }
       TimeSelectionForm {

       }
    }
    RowLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        height: implicitHeight
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        Button {
            id: backButton
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
            Layout.fillWidth: true
            text: "Accept"
            Material.background: Material.Blue
            Material.foreground: "white"
            onClicked: {
                startUpView.visible = false
                mainStackView.visible = true

                Helpers.registered = true
            }
        }

    }
}
