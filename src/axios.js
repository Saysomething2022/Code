import axios from 'axios'
import { ElMessage } from 'element-plus'
import {UserStore} from "@/store";

if (process.env.NODE_ENV == "production") {
  axios.defaults.baseURL = "http://forgetive.org:32486"
} else {
  axios.defaults.baseURL = "http://localhost:9090"
}

// 前置拦截
axios.interceptors.request.use(config => {
    console.log(config)
  return config
})

axios.interceptors.response.use(response => {
    let res = response;
    console.log(res.data)
    console.log(UserStore().userinfo)
    if (res.data.code === 0) {
      return response
    } else {
        if (res.data.code === 105){
            ElMessage.warning(response.data.message+":"+response.data.data)
            return Promise.reject(response.data.message)
        }
        ElMessage.warning(response.data.message)
      return Promise.reject(response.data.message)
    }
  },
  error => {
    console.log(error.response)
    if(error.response.data) {
      error.message = error.response.data.message
    }
      if (error.response.data.status === 500 ){
          ElMessage({
              type:"error",
              duration:1300,
              message:error.message
          })
          sessionStorage.removeItem("userinfo")
          sessionStorage.removeItem("token")
          console.log(Window)
          window.location.href="http://localhost:8080"
          return Promise.reject(error)
      }
    console.log("请求错误！！")
    ElMessage({
        type:"error",
        duration:1300,
        message:error.message
    })
    return Promise.reject(error)
  }
)
