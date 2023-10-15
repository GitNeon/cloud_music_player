import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts

Window {
    width: 1200
    height: 800
    visible: true
    title: qsTr("Cloud Music Player")

    ColumnLayout {
      anchors.fill: parent
      spacing: 0
      TopBar {}
      Content {}
      BottomBar {}
    }

}
