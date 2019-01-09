import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import "../"

GridView {
    id: gridView
    height: cellHeight * rssFeeds.count / 3
    model: RssFeeds {
        id: rssFeeds
    }
    cellWidth: gridView.width / 3
    cellHeight: 120
    delegate: CategoryDelegate {
        width: gridView.cellWidth - 8
        height: gridView.cellHeight - 8
        title: model.name
        imageUrl: model.image
        selected: Helpers.selectedCategories.indexOf(parseInt(model.key)) > -1
        onSelectedChanged: {
            if (selected) {
                Helpers.selectedCategories.push(parseInt(model.key))
            } else {
                var key = Helpers.selectedCategories.indexOf(model.key)
                Helpers.selectedCategories.splice(key, 1)
            }
            Helpers.updateCategories()
            console.log("Selected Categories changed " + Helpers.selectedCategories)
        }
    }
}
