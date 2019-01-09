pragma Singleton
import QtQuick 2.0
import Qt.labs.settings 1.0
import QtQuick.XmlListModel 2.0
import "content"
Item {
    id:helpers
    signal updateCategories()
    signal feedsModelUpdated()
    property bool registered: false
    property string mainColor: "#2196F3"
    property string userFirstName:""
    property string userSecondName
    property string userEmail
    property var time
    property var timePositionIndex
    onTimeChanged: console.log("Time chagned "+JSON.stringify(time))
    property var selectedCategories:[]
    property string currentFeed:""
    property var feedItemsModel
    property var feedsModel: filteredListModel
    property var historyModel:[]
    onHistoryModelChanged: console.log("History changed "+JSON.stringify(historyModel))
    property bool categoryLabelVisible: false
    Settings {
        id:settings
        property alias registered: helpers.registered
        property alias userFirstName: helpers.userFirstName
        property alias userSecondName: helpers.userSecondName
        property alias userEmail: helpers.userEmail
        property alias selectedCategories: helpers.selectedCategories
        property alias currentFeed: helpers.currentFeed
        property alias time: helpers.time
        property alias historyModel: helpers.historyModel
    }

    onUpdateCategories: {
        console.log("Helpers onUpdateCategories")
        filteredListModel.updateModel()
    } 
    ListModel {
        id: filteredListModel
        function updateModel(){
            filteredListModel.clear()

            console.log("Helpers.updateModel "+rssFeeds.count)
            for(var i = 0; i < rssFeeds.count; i++){
                for(var j = 0; j < selectedCategories.length; j++){
                var selectedKey = selectedCategories[j]
                var currentKey = rssFeeds.get(i).key
                if(String(currentKey) === String(selectedKey)){
                    console.log("Adding a key " + currentKey)
                    filteredListModel.append(rssFeeds.get(i))
                }
                }
            }

            Helpers.feedsModelUpdated()
        }
    }
    RssFeeds {
        id: rssFeeds

    }
//    XmlListModel {
//        id: feedItemsListModel
//        onSourceChanged: console.log("Source changed "+source)

//        source: "http://" + currentFeed
//        query: "/rss/channel/item[child::media:content]"
//        namespaceDeclarations: "declare namespace media = 'http://search.yahoo.com/mrss/';"

//        XmlRole { name: "title"; query: "title/string()" }
//        // Remove any links from the description
//        XmlRole { name: "description"; query: "fn:replace(description/string(), '\&lt;a href=.*\/a\&gt;', '')" }
//        XmlRole { name: "image"; query: "media:content/@url/string()" }
//        XmlRole { name: "link"; query: "link/string()" }
//        XmlRole { name: "pubDate"; query: "pubDate/string()" }
//    }
}
