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
        spacing: 0
        anchors.fill: parent
        Item {
            Layout.fillWidth: true
            height: t1.height + 2
            //            color: "pink"
            Text {
                id: t1
                text: qsTr("推荐内容")
                font.pointSize: 18
            }
        }

        Item {
            id: bannerItem
            Layout.fillWidth: true
            height: 200
            //            color: "skyblue"
            MusicBannerView {
                width: 1000
                height: parent.height
                id: bannerView
                anchors.centerIn: parent
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
    }

    Component.onCompleted: {
        getBannerList()
    }

    function getBannerList() {
        function doRespone(reply) {
            //            console.log('bannerList:', reply)
            var banners = JSON.parse(reply).banners
            bannerView.bannerList = banners
            http.onReplySignal.disconnect(doRespone)

            // 由于异步原因，这里暂时这么放解决两个请求的问题
            getHotViewList()
        }
        http.onReplySignal.connect(doRespone)
        http.httpRequest("GET", "/banner")
    }

    function getHotViewList() {
        function doRespone2(reply) {
            var resultList = JSON.parse(reply)
            hotView.hotViewList = resultList.playlists
            //            console.log(JSON.stringify(hotView.hotViewList))
            http.onReplySignal.disconnect(doRespone2)
        }
        http.onReplySignal.connect(doRespone2)
        http.httpRequest("GET", "/top/playlist/highquality?limit=15")
    }
}
