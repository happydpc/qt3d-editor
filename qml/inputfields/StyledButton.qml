/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt3D Editor of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL-EXCEPT$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.5

Item {
    property alias text: buttonText.text
    width: 100
    height: 32

    signal buttonClicked()

    Rectangle {
        id: control
        anchors.fill: parent
        anchors.margins: 4
        color: {
            if (mouseArea.containsPress)
                mainwindow.iconHighlightColor
            else if (mouseArea.containsMouse) // hover
                mainwindow.listHighlightColor
            else
                "transparent"
        }
        border.color: listHighlightColor
        border.width: 1

        Text {
            id: buttonText
            anchors.centerIn: parent
            color: mainwindow.textColor
            font.family: mainwindow.labelFontFamily
            font.weight: mainwindow.labelFontWeight
            font.pixelSize: mainwindow.labelFontPixelSize
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            activeFocusOnTab: true

            onClicked: {
                buttonClicked()
            }


        }
    }
}
