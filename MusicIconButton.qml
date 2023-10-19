import QtQuick
import QtQuick.Controls

// 封装的通用Button
Button {
    property string iconSource: ""
    property string toolTip: ""
    property bool isCheckable: false
    property bool isChecked: false
    property int iconWidth: 32
    property int iconHeight: 32

    id: _thisBtn

    icon.source: iconSource
    icon.height: iconHeight
    icon.width: iconWidth
    icon.color: _thisBtn.down || (isCheckable
                                  && self.checked) ? "#ffffff" : "#e2f0f8"

    ToolTip.visible: hovered
    ToolTip.text: toolTip

    checked: isChecked
    checkable: isCheckable

    background: Rectangle {
        color: _thisBtn.down || (isCheckable
                                 && isChecked) ? "#497563" : "#20e9f4ff"
        radius: 3
    }
}
