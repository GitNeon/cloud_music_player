import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls 2.5
import QtQuick.Window

ToolBar {
    width: parent.width
    Layout.fillWidth: true
    background: Rectangle {
        color: "#00AAAA"
    }

    RowLayout {
        anchors.fill: parent

        ToolButton {
            icon.source: "/images/about.png"
            onClicked: function () {
                aboutPopup.visible = true
            }
            ToolTip {
                visible: parent.hovered
                text: "关于本软件"
                background: Rectangle {
                    color: "lightgray"
                }
            }
        }

        ToolButton {
            id: smallWindow
            icon.source: "/images/small-window.png"
            onClicked: function () {
                setPlayerSize(330, 650)
                smallWindow.visible = false
                normalWindow.visible = true
            }
            ToolTip {
                visible: parent.hovered
                text: "小窗播放"
                background: Rectangle {
                    color: "lightgray"
                }
            }
        }

        ToolButton {
            id: normalWindow
            icon.source: "/images/exit-small-window.png"
            onClicked: function () {
                setPlayerSize(1200, 800)
                smallWindow.visible = true
                normalWindow.visible = false
            }
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
            id: fullScreenBtn
            icon.source: "/images/full-screen.png"
            ToolTip {
                visible: parent.hovered
                text: "全屏"
                background: Rectangle {
                    color: "lightgray"
                }
            }
            onClicked: function () {
                window.visibility = Window.Maximized
                fullScreenBtn.visible = false
                smallScreenBtn.visible = true
            }
        }

        ToolButton {
            id: smallScreenBtn
            icon.source: "/images/small-screen.png"
            visible: false
            ToolTip {
                visible: parent.hovered
                text: "退出全屏"
                background: Rectangle {
                    color: "lightgray"
                }
            }
            onClicked: function () {
                window.visibility = Window.AutomaticVisibility
                setPlayerSize(1200, 800)
                fullScreenBtn.visible = true
                smallScreenBtn.visible = false
            }
        }

        ToolButton {
            icon.source: "/images/power.png"
            onClicked: function () {
                Qt.quit()
            }
        }
    }

    Popup {
        id: aboutPopup
        width: 300
        height: 200
        padding: 0
        x: (window.width - aboutPopup.width) / 2
        y: (window.height - aboutPopup.height) / 2
        modal: true
        visible: false

        background: Rectangle {
            color: '#f3f4f5'
            radius: 3
        }

        contentItem: ColumnLayout {
            spacing: 0
            anchors.fill: parent

            Rectangle {
                color: "transparent"
                Layout.fillWidth: true
                height: aboutImage.height

                Image {
                    id: aboutImage
                    source: "/images/music.png"
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                color: "transparent"
                Layout.fillWidth: true
                height: 40

                Text {
                    text: qsTr("Cloud Music Demo Player音乐播放器")
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 16
                    width: parent.width
                }

                Text {
                    y: 20
                    text: qsTr("作者：Fanx")
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 16
                    width: parent.width
                }
            }
        }
    }

    function setPlayerSize(width, height) {
        window.width = width
        window.height = height
        window.x = (Screen.desktopAvailableWidth - window.width) / 2
        window.y = (Screen.desktopAvailableHeight - window.height) / 2
        smallWindow.visible = false
        normalWindow.visible = true
    }
}
