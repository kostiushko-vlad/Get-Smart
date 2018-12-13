import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import "../"
BasePage {
    id:homePage
    onIsActiveChanged:{
        console.log("Categoyr ComboBOx visible " + isActive)
        Helpers.categoryLabelVisible = isActive
    }
    property string currentFeed: Helpers.currentFeed
    XmlListModel {
        id: feedModel

        source: "http://" + currentFeed
        query: "/rss/channel/item[child::media:content]"
        namespaceDeclarations: "declare namespace media = 'http://search.yahoo.com/mrss/';"

        XmlRole { name: "title"; query: "title/string()" }
        // Remove any links from the description
        XmlRole { name: "description"; query: "fn:replace(description/string(), '\&lt;a href=.*\/a\&gt;', '')" }
        XmlRole { name: "image"; query: "media:content/@url/string()" }
        XmlRole { name: "link"; query: "link/string()" }
        XmlRole { name: "pubDate"; query: "pubDate/string()" }
    }
    ListView {
        id: list
        anchors.fill: parent
        anchors.topMargin: 15
        anchors.leftMargin: 10
        anchors.rightMargin: 15
        spacing: 8
        clip: true
        model: feedModel
        delegate: NewsDelegate {

            width: parent.width
            height: 80
        }
    }

}
