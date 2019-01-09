import QtQuick 2.0
import "../"
TimePicker {
    id: timePicker
    height: 200
    width: 200
    onAcceptTime: {
        Helpers.timePositionIndex = positionViewIndex
        Helpers.time = timePicker.time
    }
    Component.onCompleted:  {
        //console.log("Time "+JSON.stringify(Helpers.time) + " "+Helpers.timePositionIndex)
        timePicker.setTime(Helpers.time)

    }
}
