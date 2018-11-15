

/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item {
    id: delegate
    MouseArea {
        anchors.fill: parent
        onClicked: mainStackView.push("qrc:/content/ContentPage.qml",{newsUrl:url})
    }
    // Returns a string representing how long ago an event occurred
    function timeSinceEvent(pubDate) {
        var result = pubDate

        // We need to modify the pubDate read from the RSS feed
        // so the JavaScript Date object can interpret it
        var d = pubDate.replace(',', '').split(' ')
        if (d.length != 6)
            return result

        var date = new Date([d[0], d[2], d[1], d[3], d[4], 'GMT' + d[5]].join(
                                ' '))

        if (!isNaN(date.getDate())) {
            var age = new Date() - date
            var minutes = Math.floor(Number(age) / 60000)
            if (minutes < 1440) {
                if (minutes < 2)
                    result = qsTr("Just now")
                else if (minutes < 60)
                    result = '' + minutes + ' ' + qsTr("minutes ago")
                else if (minutes < 120)
                    result = qsTr("1 hour ago")
                else
                    result = '' + Math.floor(minutes / 60) + ' ' + qsTr(
                                "hours ago")
            } else {
                result = date.toDateString()
            }
        }
        return result
    }

    RowLayout {
        anchors.fill: parent
        spacing: 10
        Rectangle {
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width / 3

            Image {
                id: titleImage
                source: image
                anchors.fill: parent
                visible: false
            }
            Rectangle {
                id: mask
                anchors.fill: parent
                visible: false
                radius: 5
            }
            OpacityMask {
                anchors.fill: titleImage
                source: titleImage
                maskSource: mask
            }

        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Text {
                id: titleText
                Layout.fillWidth: true
                text: title
                wrapMode: Text.WordWrap
                elide: Text.ElideRight
                maximumLineCount: 2
                font.pixelSize: 12
                font.bold: true
            }
            Text {
                id: descriptionText
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: description
                wrapMode: Text.WordWrap
                elide: Text.ElideRight
                font.pixelSize: 11
                textFormat: Text.StyledText
                horizontalAlignment: Qt.AlignLeft
                color: "grey"
            }
        }
    }
}
