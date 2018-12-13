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

import QtQuick 2.2
import QtGraphicalEffects 1.0
Rectangle {
    id: delegate  
    property bool selected: false
    property real itemSize
    property string title: "title"
    property string imageUrl

    Image {
        id:categoryImage
        anchors.fill: parent
        source: imageUrl
        visible: false
        fillMode: Image.PreserveAspectCrop

    }
    Rectangle {
        id: mask
        anchors.fill: parent
        visible: false
        radius: 4
    }
    OpacityMask {
        anchors.fill: categoryImage
        source: categoryImage
        maskSource: mask
    }
    Rectangle {
        id:higlightRectangle
        radius: 4
        z:1
        anchors.fill: parent
        border.width: selected ? 2 : 0
        border.color: "#81D4FA"
        color: "transparent"
    }
    Text {
        id: titleText
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        font { pixelSize: 12; bold: true }
        text: delegate.title
        color: selected ? "#81D4FA" : "white"
        scale: selected ? 1.15 : 1.0
        Behavior on color { ColorAnimation { duration: 150 } }
        Behavior on scale { PropertyAnimation { duration: 300; easing.type: Easing.InOutBack } }
    }
    Image {
        id:selectedIcon
        anchors.centerIn: parent
        scale: selected ? 1 : 0
        source: "../images/selected.svg"
        width: 40
        height: 40
        Behavior on scale { PropertyAnimation { duration: 300; easing.type: Easing.InOutBack } }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            selected = !selected
        }
    }
}
