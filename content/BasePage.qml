import QtQuick 2.0
import QtQuick.Controls 2.4
Item {
    StackView.onDeactivated: isActive = false
    StackView.onActivated: isActive = true
    property bool isActive: false
    onIsActiveChanged: console.log("IsACtive "+isActive)
}
