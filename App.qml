import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import HttpUtil 1.0

Window {
    id: window
    width: 1200
    minimumWidth: 1200
    height: 800
    minimumHeight: 800
    visible: true
    title: qsTr("Cloud Music Player")

    HttpUtil {
        id: http
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        TopBar {}
        Content {}
        BottomBar {}
    }
}
