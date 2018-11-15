import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
Drawer {
    id: drawer
    signal pushPage(var model)
    property alias depth: stackView.depth
    interactive: depth === 1
    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane
            anchors.fill: parent
            background: Rectangle {
                anchors.fill: parent
                color: "#606060"
            }
            ListView {
                id: listView
                anchors.fill: parent
                anchors.bottom: parent.bottom
                focus: true
                currentIndex: -1

                footer: ItemDelegate {
                    width: parent.width
                    text: "About"
                    icon.source: "qrc:/images/info.svg"
                    display: AbstractButton.TextBesideIcon
                    highlighted: ListView.isCurrentItem
                    Material.foreground: "#dedede"
                    onClicked: {

                    }
                }
                delegate: ItemDelegate {
                    width: parent.width
                    text: model.title
                    icon.source: model.image
                    display: AbstractButton.TextBesideIcon
                    highlighted: ListView.isCurrentItem
                    Material.foreground: "#dedede"
                    onClicked: {
                        listView.currentIndex = index
                        drawer.pushPage(model)
                        drawer.close()
                    }
                }
                model: ListModel {
                    ListElement { title: "Home"; image:"qrc:/images/home.svg"; source: "qrc:/content/HomePage.qml" }
                    ListElement { title: "History"; image:"qrc:/images/history.svg"; source: "qrc:/content/HistoryPage.qml" }
                    ListElement { title: "Saved For Later"; image:"qrc:/images/favorites.svg"; source: "qrc:/content/FavoritePage.qml" }

                }

                ScrollIndicator.vertical: ScrollIndicator { }
            }
        }
    }
}
