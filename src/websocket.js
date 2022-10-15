import {ElNotification} from "element-plus";
import {UserStore} from "@/store";
var websocket = null
var websocketServer = {
    connection(uid){
        //建立websocket链接
        if ('WebSocket' in window) {
            console.log("准备建立socket链接")
            websocket = new WebSocket('ws://localhost:9090/websocketServer/' + uid)
            this.initWebSocket()
        } else {
            console.log("失败l")
            alert('当前浏览器 Not support websocket')
        }
    },
    initWebSocket () {
        // 连接错误
        websocket.onerror = this.setErrorMessage

        // 连接成功
        websocket.onopen = this.setOnopenMessage

        // 收到消息的回调
        websocket.onmessage = this.setOnmessageMessage

        // 连接关闭的回调
        websocket.onclose = this.setOncloseMessage

        // 监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        window.onbeforeunload = this.onbeforeunload
    },
    setErrorMessage () {
        console.log("websocket的地址"+websocket)
        console.log('WebSocket连接发生错误   状态码：' + websocket.readyState)
    },
    setOnopenMessage () {
        console.log("websocket的地址"+websocket)
        console.log('WebSocket连接成功    状态码：' + websocket.readyState)
        UserStore().isconnection = true
    },
    setOnmessageMessage (event) {
        // 根据服务器推送的消息做自己的业务处理
        console.log('服务端返回：' + event.data)
        ElNotification({
            title: 'Success',
            message: event.data,
            type: 'success',
            duration:2000
        })
        UserStore().ismessage = true
    },
    setOncloseMessage () {
        console.log('WebSocket连接关闭    状态码：' + websocket.readyState)
        this.closeWebSocket()
        UserStore().isconnection = false
    },
    onbeforeunload () {
        this.closeWebSocket()
    },
    closeWebSocket () {
        if (websocket != null) {
            console.log("websocket" + websocket)
            console.log("关闭websocket连接")
            websocket.close()
            UserStore().isconnection = false
        }
    }
}
export default websocketServer