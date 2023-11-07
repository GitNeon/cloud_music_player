import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    property int current: 0
    property var bannerList: []

    MusicRoundImage {
        id: leftImage
        width: parent.width * 0.6
        height: parent.height * 0.8
        anchors {
            left: parent.left
            bottom: parent.bottom
            bottomMargin: 20
        }

        imgUrl: getLeftImgSrc()

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: function () {
                console.log('left', current)
                if (current === 0) {
                    current = bannerList.length - 1
                    return
                }
                current = current - 1
            }
        }
    }

    MusicRoundImage {
        id: centerImage
        width: parent.width * 0.6
        height: parent.height * 0.9
        z: 2
        anchors.centerIn: parent
        imgUrl: getCenterImgSrc()
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
        }
    }

    MusicRoundImage {
        id: rightImage
        width: parent.width * 0.6
        height: parent.height * 0.8
        anchors {
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 20
        }
        imgUrl: getRightImgSrc()

        MouseArea {
            anchors.fill: parent
            onClicked: function () {
                console.log('right', current)
                if (current === bannerList.length - 1) {
                    current = 0
                    return
                }
                current = current + 1
            }
        }
    }

    PageIndicator {
        id: bannerPageControl
        currentIndex: current
        count: bannerList.length
        x: parent.width / 2 - bannerPageControl.width / 2
        z: 2
        anchors {
            bottom: parent.bottom
        }
        delegate: Rectangle {
            required property int index
            color: "gray"
            height: 6
            width: 6
            radius: 3
            opacity: index === bannerPageControl.currentIndex ? 0.95 : pressed ? 0.7 : 0.45
            Behavior on opacity {
                OpacityAnimator {
                    duration: 200
                }
            }
        }
    }

    Timer {
        interval: 3000
        running: true
        repeat: true
        onTriggered: function () {
            if (current === bannerList.length - 1) {
                current = 0
                return
            }
            current += 1
        }
    }

    function getLeftImgSrc() {
        const pos = (current - 1 + bannerList.length) % bannerList.length
        return bannerList.length ? bannerList[pos].imageUrl : ""
    }

    function getCenterImgSrc() {
        return bannerList.length ? bannerList[current].imageUrl : ""
    }

    function getRightImgSrc() {
        const pos = (current + 1 + bannerList.length) % bannerList.length
        return bannerList.length ? bannerList[pos].imageUrl : ""
    }
}
