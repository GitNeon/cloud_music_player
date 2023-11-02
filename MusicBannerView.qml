import QtQuick
import QtQuick.Layouts

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
    }

    MusicRoundImage {
        id: centerImage
        width: parent.width * 0.6
        height: parent.height
        z: 2
        anchors.centerIn: parent
        imgUrl: getCenterImgSrc()
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
    }

    function getLeftImgSrc() {
        const pos = (current - 1 + bannerList.length) % bannerList.length
        console.log("left: ", pos)
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
