import router from "@/router";
import {ElMessage} from "element-plus";
import websocketServer from "@/websocket";
import {UserStore} from "@/store";
// 路由判断登录 根据路由配置文件的参数
router.beforeEach((to, from, next) => {
    const userStore = UserStore()
    console.log(userStore.isconnection+"====="+userStore.userinfo)
    if (!userStore.isconnection && userStore.userinfo != null){
        websocketServer.connection(userStore.userinfo.id)
    }
    if (to.matched.some(record => record.meta.requireAuth)) { // 判断该路由是否需要登录权限
        const token = sessionStorage.getItem("token")
        console.log("------------" + token)
        if (token) { // 判断当前的token是否存在 ； 登录存入的token
            next()
        } else {
            ElMessage.warning("还未登录，请先登录")
            next({
                path:'/article'
            })
        }
    } else {
        next()
    }
})