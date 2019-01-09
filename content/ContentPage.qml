import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.1
import QtWebView 1.1

Popup {
    id: contentPage
    width: parent.width
    height: parent.height
    modal: true
    visible: true

    property string newsUrl
    property string newsTitle
    onNewsUrlChanged: {
        webViewPage.open()
    }

//    Keys.onReleased: {
//        console.log("Back button pressed")
//        if (event.key === Qt.Key_Back) {
//            event.accepted = true
//           contentPage.visible = false
//            focus = false
//        }
//    }
    Rectangle {
        anchors.fill: parent
        color: "white"
    }
    WebView {
        anchors.fill: parent
        url: contentPage.newsUrl
    }
//        Keys.onReleased: {
//            if (event.key === Qt.Key_Back) {
//                if (webViewPage.visible) {
//                    webViewPage.visible = false
//                    //                //close.accepted = false
//                }

//                console.log("Back button of phone pressed")
//                event.accepted = false

//            }
//        }

}
