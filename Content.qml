import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: contentRowLayout
    spacing: 0

    // 页面局部组件注册
    Component {
        id: recommendPageView
        RecommendPageView {}
    }

    // 列表数据
    property var featureList: [{
            "icon": 'recommend-white',
            "title": "推荐内容",
            "componentName": "RecommendPageView"
        }, {
            "icon": 'cloud-white',
            "title": "搜索音乐",
            "componentName": "SearchPageView"
        }, {
            "icon": 'local-white',
            "title": "本地音乐",
            "componentName": "LocalPageView"
        }, {
            "icon": 'history-white',
            "title": "播放历史",
            "componentName": "HistoryPageView"
        }, {
            "icon": 'favorite-big-white',
            "title": "我喜欢的",
            "componentName": "FavoritePageView"
        }]

    //    {
    //        "icon": 'favorite-big-white',
    //        "title": "专辑歌单",
    //        "componentName": "PlayListPageView"
    //    }
    Frame {
        Layout.preferredWidth: 200
        Layout.fillHeight: true
        padding: 0

        ListModel {
            id: listModel
        }

        Component {
            id: listItemDelegate
            Rectangle {
                id: itemBg
                width: listView.width
                height: 40
                color: '#AA00AAAA'

                RowLayout {
                    anchors.fill: parent
                    spacing: 1

                    Item {
                        Layout.fillWidth: true
                        Image {
                            width: 20
                            height: 20
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

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: function () {
                        itemBg.color = '#aa73a7ab'
                    }
                    onExited: function () {
                        itemBg.color = '#AA00AAAA'
                    }
                    onClicked: function () {
                        // 获取当前点击项的索引
                        listView.currentIndex = index
                        let currentIndex = listView.currentIndex
                        // 通过索引获取当前点击项的数据
                        let currentItem = listView.model.get(currentIndex)
                        contentLoader.source = currentItem.componentName + ".qml"
                    }
                }
            }
        }

        ColumnLayout {
            anchors.fill: parent

            ListView {
                id: listView
                anchors.fill: parent
                model: listModel
                delegate: listItemDelegate
                highlightFollowsCurrentItem: true
                highlight: Rectangle {
                    color: "#aa73a7ab"
                }
            }
        }

        Component.onCompleted: function () {
            listModel.append(featureList)
            console.log('Frame组件准备完成')
        }
    }

    Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true
        color: "pink"
        Loader {
            id: contentLoader
        }
    }

    Component.onCompleted: function () {
        console.log("内容区RowLayout加载完成")
        contentLoader.sourceComponent = recommendPageView
    }
}
