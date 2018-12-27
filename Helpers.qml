pragma Singleton
import QtQuick 2.0
import Qt.labs.settings 1.0
import "content"
Item {
    id:helpers
    signal updateCategories()
    signal feedsModelUpdated()
    property string mainColor: "#2196F3"
    property string userFirstName
    property string userSecondName
    property string userEmail
    property var time
    property var selectedCategories:[]
    property string currentFeed:""
    property var feedsModel: filteredListModel
    property bool categoryLabelVisible: false
    Settings {
        id:settings
        property alias userFirstName: helpers.userFirstName
        property alias userSecondName: helpers.userSecondName
        property alias userEmail: helpers.userEmail
//        property alias selectedCategories: helpers.selectedCategories
        property alias currentFeed: helpers.currentFeed
        property alias time: helpers.time
    }

    onUpdateCategories: {
        console.log("Helpers onUpdateCategories")
        filteredListModel.updateModel()
    }
    ListModel {
        id: filteredListModel
        function updateModel(){
            filteredListModel.clear()
            console.log("Helpers.updateModel")
            for(var i = 0; i < rssFeeds.count; i++){
                var currentKey = selectedCategories.indexOf(rssFeeds.get(i).key)
                if(currentKey != -1){
                    console.log("Adding a key " + currentKey)
                    filteredListModel.append(rssFeeds.get(i))
                }
            }
            Helpers.feedsModelUpdated()
        }
    }
    RssFeeds {
        id: rssFeeds

    }
}
