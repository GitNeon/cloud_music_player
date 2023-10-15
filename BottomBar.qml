import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    Layout.fillWidth: true
    height: 60
    color: '#00AAAA'

    RowLayout {
        anchors.fill: parent
        Layout.alignment: Qt.AlignVCenter

        // 实现内边距
        Rectangle {
            width: 100
            color: "transparent"
        }

        Button {
            icon.source: "/images/previous.png"
            icon.width: 32
            icon.height: 32
        }

        Button {
            icon.source: "/images/stop.png"
            icon.width: 32
            icon.height: 32
        }

        Button {
            icon.source: "/images/next.png"
            icon.width: 32
            icon.height: 32
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
                anchors.left: musicSlider.left + 5
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
                    color: "#ffffff"
                    height: 4

                    Rectangle {
                        width: parent.width * musicSlider.visualPosition
                        height: parent.height
                        color: "#21be2b"
                    }
                }
                handle: Rectangle {
                    x: musicSlider.leftPadding + (musicSlider.availableWidth - width)
                       * musicSlider.visualPosition
                    y: musicSlider.topPadding + (musicSlider.availableHeight - height) / 2
                    radius: 20
                    border.color: '#bdbebf'
                    implicitWidth: 10
                    implicitHeight: 10
                    color: musicSlider.pressed ? '#f0f0f0' : "#f6f6f6"
                }
            }
        }

        Button {
            icon.source: "/images/favorite.png"
            icon.width: 32
            icon.height: 32
        }

        Button {
            icon.source: "/images/repeat.png"
            icon.width: 32
            icon.height: 32
        }

        // 实现内边距
        Rectangle {
            width: 100
            color: "transparent"
        }
    }
}
