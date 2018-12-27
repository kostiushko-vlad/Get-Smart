import QtQuick 2.0
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0
import "content"

ApplicationWindow {
    id: window
    property bool isPortrait: Screen.primaryOrientation === Qt.PortraitOrientation
    visible: true
    width: 360
    height: 640
    title: qsTr("Get Smart")
    function dp(pixel){
        return  Screen.pixelDensity * pixel
    }
    header: ToolBar {
        Material.foreground: "white"
        Material.primary: "#FAFAFA"
        visible: !startUpView.visible

        RowLayout {
            spacing: 0
            height: parent.height
            width: implicitWidth

            ToolButton {
                Layout.alignment: Qt.AlignLeft
                contentItem: Image {
                    id: img
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: sideMenu.depth > 1 ? "images/back.png" : "images/drawer.png"
                }
                onClicked: {
                    if (sideMenu.depth > 1) {
                        stackView.pop()
                        listView.currentIndex = -1
                    } else {
                        sideMenu.open()
                    }
                }
            }

            Label {
                id: titleLabel
                Material.foreground: "black"
                text: "Home"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.alignment: Qt.AlignLeft
                Layout.leftMargin: 5
            }

            ComboBox {
                id: categoryLabel
                visible: Helpers.categoryLabelVisible
                flat: true
                font.pixelSize: 14
                textRole: "name"
                Layout.topMargin: 5
                Layout.leftMargin: 5
                Layout.alignment: Qt.AlignLeft
                Material.foreground: "#979797"
                onCurrentIndexChanged: {
                    console.log("Current index "+currentIndex)
                    if(currentIndex > -1){
                        Helpers.currentFeed = Helpers.feedsModel.get(currentIndex).feed
                    }
                }
                Connections {
                    target: Helpers
                    onFeedsModelUpdated:{
                        categoryLabel.model = Helpers.feedsModel
                        categoryLabel.currentIndex = 0
                    }
                }
            }
        }
    }  
    StackView {
        id:startUpView
        anchors.fill: parent
        initialItem: CreateAccountPage {
            id:startPage

        }
    }

    SideMenu {
        id: sideMenu
        enabled: !startPage.visible
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        onPushPage: {
            mainStackView.push(model.source)
            titleLabel.text = model.title
        }
    }
    StackView {
        id:mainStackView
        visible: false
        anchors.fill: parent       
    }
}
