import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15

Rectangle {
    Layout.fillWidth: true
    height: 60
    color: "#806e99a8"

    RowLayout {
        anchors.fill: parent
        Layout.alignment: Qt.AlignVCenter

        // 实现内边距
        Rectangle {
            width: 100
            color: "transparent"
        }

        MusicIconButton {
            id: prevButton
            iconSource: "/images/previous.png"
            toolTip: "上一首"
        }

        MusicIconButton {
            id: stopButton
            iconSource: "/images/stop.png"
            toolTip: "停止播放"
        }

        MusicIconButton {
            id: nextButton
            iconSource: "/images/next.png"
            toolTip: "下一首"
        }

        Item {
            Layout.preferredWidth: parent.width / 2
            Layout.fillWidth: true
            Layout.fillHeight: true

            Layout.topMargin: 20

            // 用来看看Item的占位布局
            //            Rectangle {
            //                width: parent.width
            //                height: parent.height
            //                color: "lightblue"
            //            }
            Text {
                text: "歌曲名称-歌手"
                anchors.left: musicSlider.left
                anchors.bottom: musicSlider.top
                Layout.bottomMargin: 15
            }

            Text {
                text: "00:00/5:21"
                anchors.right: musicSlider.right
                anchors.bottom: musicSlider.top
                Layout.bottomMargin: 15
            }

            Slider {
                id: musicSlider
                width: parent.width
                Layout.fillWidth: true
                height: 25
                background: Rectangle {
                    x: musicSlider.leftPadding
                    y: musicSlider.topPadding + musicSlider.availableHeight / 2 - height / 2
                    radius: 2
                    color: "#e9f4ff"
                    height: 4

                    Rectangle {
                        width: parent.width * musicSlider.visualPosition
                        height: parent.height
                        color: "#73a7ab"
                    }
                }
                handle: Rectangle {
                    x: musicSlider.leftPadding + (musicSlider.availableWidth - width)
                       * musicSlider.visualPosition
                    y: musicSlider.topPadding + (musicSlider.availableHeight - height) / 2
                    radius: 20
                    border.color: "#73a7ab"
                    border.width: 0.5
                    implicitWidth: 10
                    implicitHeight: 10
                    color: musicSlider.pressed ? '#f0f0f0' : "#f6f6f6"
                }
            }
        }

        MusicIconButton {
            iconSource: "/images/favorite.png"
        }

        MusicIconButton {
            iconSource: "/images/repeat.png"
        }

        // 实现内边距
        Rectangle {
            width: 100
            color: "transparent"
        }
    }
}
