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
    }

    Component.onCompleted: {

        getBannerList()
    }

    function getBannerList() {
        function doRespone(reply) {
            //            console.log(reply)
            var banners = JSON.parse(reply).banners
            bannerView.bannerList = banners
            http.onReplySignal.disconnect(doRespone)
        }
        http.onReplySignal.connect(doRespone)
        http.httpRequest("GET", "/banner")
    }
}
