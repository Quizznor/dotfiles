 
/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
 
    import QtQuick 2.5
    import QtQuick.Window 2.2

    import org.kde.plasma.components 3.0 as PlasmaComponents3
    import org.kde.plasma.core 2.0 as PlasmaCore
    
   AnimatedImage { 
            id: root
            source: "images/Smooth_Splash.gif"
            property int stage
    
        onStageChanged: {
            if (stage == 1) {
                introAnimation.running = true;
            }
        }
    
        Item {
            id: content
            anchors.fill: parent
            opacity: 0
            TextMetrics {
                id: units
                text: "M"
                property int gridUnit: boundingRect.height
                property int largeSpacing: units.gridUnit
                property int smallSpacing: Math.max(2, gridUnit/4)
            }

            

            Row {
                spacing: units.smallSpacing*2
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    margins: units.gridUnit
                }
                Text {
                    color: "#eff0f1"
                    // Work around Qt bug where NativeRendering breaks for non-integer scale factors
                    // https://bugreports.qt.io/browse/QTBUG-67007
                    renderType: Screen.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering
                    anchors.verticalCenter: parent.verticalCenter
                    text: i18ndc("plasma_lookandfeel_org.kde.lookandfeel", "Sample", "Plasma made by KDE")
                }
                Image {
                    source: "images/kde.svgz"
                    sourceSize.height: units.gridUnit * 1.5
                    sourceSize.width: units.gridUnit * 1.5

                Rectangle {
                        radius: 0
                        anchors.horizontalCenterOffset: -68
                        color: "#077285"
                        anchors {
                            bottom: parent.bottom
                            bottomMargin: -10
                            horizontalCenter: parent.horizontalCenter
                        }
                        height: 3
                        width: 163
                        Rectangle {
                            id: topRectRectangle
                            radius: 1
                            anchors {
                                left: parent.left
                                top: parent.top
                                bottom: parent.bottom
                            }
                            width: (parent.width / 6) * (stage - 0.00)
                            color: "#0ddbff"
                            Behavior on width {
                                PropertyAnimation {
                                    duration: 200
                                    easing.type: Easing.InOutQuad
                                }
                            }
                        }
                    }
               }
           }
       }
   
       OpacityAnimator {
           id: introAnimation
           running: false
           target: content
           from: 0
           to: 1
           duration: 500
           easing.type: Easing.InOutQuad
       }
   } 
