import QtQuick 2.15
import Qt5Compat.GraphicalEffects

// 带有圆角的图片
Item {
    property string imgUrl: "/images/player"
    property int borderRadius: 5

    Image {
        id: image
        source: imgUrl
        anchors.centerIn: parent
        smooth: true
        antialiasing: true
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectCrop
        visible: false
    }

    Rectangle {
        id: mask
        color: "white"
        anchors.fill: parent
        radius: borderRadius
        visible: false
        smooth: true
        antialiasing: true
    }

    OpacityMask {
        anchors.fill: image
        source: image
        maskSource: mask
        visible: true
        antialiasing: true
    }
}
