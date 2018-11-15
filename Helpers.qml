pragma Singleton
import QtQuick 2.0
import Qt.labs.settings 1.0
Item {
    id:helpers
    property string userFirstName
    property string userSecondName
    property string userEmail
    Settings {
        id:settings
        property alias userFirstName: helpers.userFirstName
        property alias userSecondName: helpers.userSecondName
        property alias userEmail: helpers.userEmail

    }

}
