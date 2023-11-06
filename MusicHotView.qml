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
            model: 20
            Rectangle {
                color: "lightpink"
                width: 192
                height: 192

                //                MusicRoundImage {
                //                    required property int index
                //                    height: 180
                //                    width: 180
                //                }
            }
        }
    }
}
