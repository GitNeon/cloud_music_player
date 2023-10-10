import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls 2.5

ToolBar {
    width: parent.width
    background: Rectangle {
        color: "lightgray"
    }

    RowLayout {
        anchors.fill: parent

        ToolButton {
            icon.source: "/images/about.png"
            onClicked: function () {}
            ToolTip {
                visible: parent.hovered
                text: "关于本软件"
                background: Rectangle {
                    color: "lightgray"
                }
            }
        }

        ToolButton {
            icon.source: "/images/small-window.png"
            onClicked: function () {}
            ToolTip {
                visible: parent.hovered
                text: "小窗播放"
                background: Rectangle {
                    color: "lightgray"
                }
            }
        }

        ToolButton {
            icon.source: "/images/exit-small-window.png"
            onClicked: function () {}
            ToolTip {
                visible: parent.hovered
                text: "退出小窗播放"
                background: Rectangle {
                    color: "lightgray"
                }
            }
            visible: false
        }

        Item {
            Layout.fillWidth: true
            Text {
                anchors.centerIn: parent
                text: qsTr("我的云音乐")
                font.pointSize: 12
            }
        }

        ToolButton {
            icon.source: "/images/power.png"
            onClicked: function () {}
        }
    }
}
