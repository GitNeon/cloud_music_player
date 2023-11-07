import QtQuick 2.15
import QtQuick.Layouts

Item {
    property var hotViewList: []

    ListModel {
        id: listModel
    }

    Grid {
        columns: 5
        rows: 3
        spacing: 10

        Repeater {
            model: listModel
            Rectangle {
                required property int index
                color: "transparent"
                width: 192
                height: 192
                MusicRoundImage {
                    id: _rd
                    height: 160
                    width: 190
                    imgUrl: listModel.get(index).coverImgUrl
                }
                Text {
                    text: listModel.get(index).name
                    font.pixelSize: 14
                    y: _rd.height + 5
                    elide: Text.ElideRight
                    clip: true
                    width: parent.width
                }
            }
        }
    }

    NetworkRequest {
        id: hotViewRequest
        requestUrl: "/top/playlist/highquality?limit=15"
        key: "playlists"
        Component.onCompleted: {
            hotViewRequest.getDataList()
        }
        onCustomDataListChanged: function (data) {
            listModel.append(data)
        }
    }
}
