import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.XmlListModel 2.0
import Notificator 1.0
import "../"
BasePage {
    id:homePage
    Rectangle {
        anchors.fill: parent
        color:"white"
    }
    onIsActiveChanged:{
        console.log("Categoyr ComboBOx visible " + isActive)
        Helpers.categoryLabelVisible = isActive
    }
    XmlListModel {
        id: feedItemsListModel
        onSourceChanged: console.log("Source changed "+source)

        source: "http://" + Helpers.currentFeed
        query: "/rss/channel/item[child::media:content]"
        namespaceDeclarations: "declare namespace media = 'http://search.yahoo.com/mrss/';"

        XmlRole { name: "title"; query: "title/string()" }
        // Remove any links from the description
        XmlRole { name: "description"; query: "fn:replace(description/string(), '\&lt;a href=.*\/a\&gt;', '')" }
        XmlRole { name: "image"; query: "media:content/@url/string()" }
        XmlRole { name: "link"; query: "link/string()" }
        XmlRole { name: "pubDate"; query: "pubDate/string()" }
        function getRandomInt(max) {
          return Math.floor(Math.random() * Math.floor(max));
        }
        onStatusChanged: {
            busyIndicator.visible = feedItemsListModel.status != XmlListModel.Ready
//            if(feedItemsListModel.status == XmlListModel.Ready){
//                console.log("Is new article "+Notificator.findNewArticle())
//                if(Notificator.findNewArticle()){
//                        var randINdex = getRandomInt(feedItemsListModel.count -1)
//                         console.log("Rand index "+randINdex)
//                        webViewPage.newsUrl = feedItemsListModel.get(randINdex).link
//                        Notificator.setFindNewArticle(false);

//                }
//            }
        }
        Component.onCompleted: {
            Helpers.feedItemsModel = feedItemsListModel
        }
    }
//    Connections {
//        target: Helpers.feedItemsModel
//        onCountChanged: {
//            console.log("!!!Count chagned "+Helpers.feedItemsModel.count)
//            list.model = null
//            list.model = Helpers.feedItemsModel
//        }
//        onStatusChanged: {
//            busyIndicator.visible = Helpers.feedItemsModel.status != XmlListModel.Ready
//        }
//    }

    BusyIndicator {
        id:busyIndicator
        width: 100
        height: 100
        anchors.centerIn: parent
        running: true
    }
    ListView {
        id: list
        visible: !busyIndicator.visible
        anchors.fill: parent
        anchors.topMargin: 15
        anchors.leftMargin: 10
        anchors.rightMargin: 15
        spacing: 8
        clip: true
        model: feedItemsListModel
        delegate: NewsDelegate {
            width: parent.width
            height: 80
            title: model.title
            image: model.image
            description: model.description
            link: model.link

        }
    }

}
