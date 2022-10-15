// main.ts
import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import App from './App.vue'
import router from "@/router";
import "./assets/icon/iconfont.css";
import axios from "axios";
import VueAxios from "vue-axios";
import './axios'
import {createPinia} from 'pinia'
import MdEditor from 'md-editor-v3';
import 'md-editor-v3/lib/style.css';
import './permission'
import {UserStore} from "@/store";
const app = createApp(App)
app.use(ElementPlus)
app.use(router)
app.use(VueAxios,axios)
app.use(createPinia())
const usreStore = UserStore()
app.config.globalProperties.$userStore=usreStore;
app.use(MdEditor)
app.mount('#app')
console.log(app)