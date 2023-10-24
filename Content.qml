import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Frame {
    Layout.preferredWidth: 200
    Layout.fillHeight: true
    padding: 0

    property var featureList: [{
            "icon": 'recommend-white',
            "title": "推荐内容",
            "componetName": "RecommendPageView"
        }, {
            "icon": 'cloud-white',
            "title": "搜索音乐",
            "componetName": "SearchPageView"
        }, {
            "icon": 'local-white',
            "title": "本地音乐",
            "componetName": "LocalPageView"
        }, {
            "icon": 'history-white',
            "title": "播放历史",
            "componetName": "HistoryPageView"
        }, {
            "icon": 'favorite-big-white',
            "title": "我喜欢的",
            "componetName": "FavoritePageView"
        }, {
            "icon": 'favorite-big-white',
            "title": "专辑歌单",
            "componetName": "PlayListPageView"
        }]

    ListModel {
        id: listModel
    }

    Component {
        id: listItemDelegate
        Rectangle {
            width: listView.width
            height: 40
            color: 'lightpink'

            RowLayout {
                anchors.fill: parent
                spacing: 1

                Item {
                    Layout.fillWidth: true
                    Image {
                        width: 24
                        height: 24
                        source: "/images/" + icon
                        anchors.verticalCenter: parent.verticalCenter
                        x: 35
                    }
                    Text {
                        id: txt1
                        text: title
                        anchors.centerIn: parent
                        font.pixelSize: 14
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: 1 // 边框的高度
                color: "#00AAAA" // 边框颜色
                anchors.bottom: parent.bottom
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: '#f3f4f5'

        ListView {
            id: listView
            anchors.fill: parent
            model: listModel
            delegate: listItemDelegate
        }
    }

    Component.onCompleted: function () {
        listModel.append(featureList)
    }
}
