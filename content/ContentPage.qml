import QtQuick 2.0
import QtWebView 1.1
Item {
    id:contentPage
    property bool isActive: false
    property string newsUrl
    onNewsUrlChanged: console.log("News Url "+newsUrl)
    WebView {
        anchors.fill: parent
        url: contentPage.newsUrl

    }

}
