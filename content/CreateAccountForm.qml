import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import "../"
ColumnLayout {
    id:content 
    TextField {
        width: content.width
        text: Helpers.userFirstName
        Layout.fillWidth: true
        placeholderText: "Name"
        onEditingFinished: Helpers.userFirstName = text
    }
    TextField {
        id: push
        width: content.width
        text: Helpers.userSecondName
        Layout.fillWidth: true
        placeholderText: "Nachname"
        onEditingFinished: Helpers.userSecondName = text
    }
    TextField {
        id:mailText
        text: Helpers.userEmail
        selectByMouse: true
        width: content.width
        Layout.fillWidth: true
        placeholderText: "Email"
        validator: RegExpValidator { regExp:/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ }
        onEditingFinished: Helpers.userEmail = text
    }
    Rectangle {
        Layout.fillHeight: true
    }
}
