import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ScrollView {
    id: scrollView
    width: window.width - 200
    height: window.height - 90
    clip: true

    // 关闭横向滚动条
    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

    ColumnLayout {
        id: cl
        spacing: 0
        x: window.width > 1200 ? (scrollView.width - cl.implicitWidth) / 2 : 0
        Item {
            id: bannerItem
            Layout.fillWidth: true
            height: 260
            MusicBannerView {
                width: 1000
                height: parent.height
                id: bannerView
                anchors.centerIn: parent
                bannerList: bannerRequest.dataList
            }
        }

        Item {
            Layout.fillWidth: true
            height: t2.height + 2
            Text {
                id: t2
                text: qsTr("热门歌单")
                font.pointSize: 18
            }
        }

        Rectangle {
            width: 1000
            height: 600
            //            color: "pink"
            MusicHotView {
                id: hotView
                anchors.fill: parent
            }
        }

        NetworkRequest {
            id: bannerRequest
            requestUrl: "/banner"
            key: "banners"
            Component.onCompleted: {
                bannerRequest.getDataList()
            }
        }
    }
}
