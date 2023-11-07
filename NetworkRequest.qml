import QtQuick

import HttpUtil 1.0

Item {
    id: _this
    property var dataList: []
    required property var requestUrl
    required property var key

    signal customDataListChanged(var data)

    HttpUtil {
        id: _http
    }

    function getDataList() {
        function doResponse(reply) {
            var result = JSON.parse(reply)
            dataList = result[key]
            //            console.log("inner", JSON.stringify(dataList))
            _this.customDataListChanged(dataList)
            _http.onReplySignal.disconnect(doResponse)
        }
        _http.onReplySignal.connect(doResponse)
        _http.httpRequest("GET", requestUrl)
    }
}
