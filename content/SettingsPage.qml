import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import "../"
BasePage {
    id:settingsPage
    anchors.fill: parent
    signal registered()
    ColumnLayout {
        anchors.centerIn: parent
        width: implicitWidth
        height: implicitHeight


        TextField {
            Layout.fillWidth: true
            placeholderText: "Name"
            onEditingFinished: Helpers.userFirstName = text
        }

        Row {
            id: row
            width: 200
            height: 400
            spacing: 20

            ComboBox {
                id: comboBox
                displayText: "Time from"
                 font.pixelSize: 12
                onCurrentTextChanged: Helpers.timeFrom=comboBox.currentText
            }

            ComboBox {
                id: comboBox1
                displayText: "Time to"
                font.pixelSize: 12
                model: ["1:00","2:00"]
                onCurrentTextChanged: {
                    displayText=currentText
                    Helpers.timeTo=comboBox1.currentText
                }
            }

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
