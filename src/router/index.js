
import {createRouter, createWebHistory} from 'vue-router'
import Index from "@/views/Index";
import AdminIndex from "@/views/admin/AdminIndex";
import AddArticle from "@/components/AddArticle"
import ArticleDetail from "@/components/ArticleDetail"
import Person from "@/components/Person"
import PersonArticle from "@/components/PersonArticle"
import NoticeList from  "@/components/NoticeList"
import MyCollectionList from  "@/components/MyCollectionList"
import Personal from "@/components/admin/Personal"
import PersonChange from "@/components/PersonChange"
import ArticleManger from "@/components/admin/ArticleManger"
import ArticleType from "@/components/admin/ArticleType"
import Api from "@/components/admin/Api"
import Notice from "@/components/admin/Notice"
import UserManger from "@/components/admin/UserManger"
import SystemLog from "@/components/admin/SystemLog"
import Message from "@/components/admin/Message"
import NoticeDetail from "@/components/NoticeDetail"
const routes = [
  {
    path: '/',
    redirect: 'article'
  },
  {
    path: '/article',
    name:"Index",
    component: Index
  },
  {
    path: '/article/post',
    name: "AddArticle",
    meta:{requireAuth:true},
    component: AddArticle
  },
  {
    path: '/articleDetail/:articleId',
    name: "ArticleDetail",
    component: ArticleDetail
  },
  {
    path: '/noticeDetail/:noticeId',
    name: 'NoticeDetail',
    component: NoticeDetail
  },
  {
    path: '/person',
    name: 'Person',
    meta:{requireAuth:true},
    component: Person,
    children:[
            {
              path: "/personArticle",
              name:"PersonArticle",
              component: PersonArticle
            },
            {
              path: "/noticeList",
              name:"NoticeList",
              component: NoticeList
            },
            {
              path: "/MyCollectionList",
              name: "MyCollectionList",
              component: MyCollectionList
            },
          ],
    redirect: "/personArticle"
  },
  {
    path: "/admin",
    name: "AdminIndex",
    component: AdminIndex,
    children: [
      {
        path: "/personal",
        name: "Personal",
        component: Personal
      },
      {
        path: "/ArticleManger",
        name:"ArticleManger",
        component: ArticleManger
      },
      {
        path: "/articleType",
        name: "ArticleType",
        component: ArticleType
      },
      {
        path: "/Api",
        name: "Api",
        component: Api
      },
      {
        path: "/Notice",
        name: "Notice",
        component: Notice
      },
      {
        path: "/userManger",
        name: "UserManger",
        component: UserManger
      },
      {
        path:"/systemLog",
        name: "SystemLog",
        component: SystemLog
      },
      {
        path: "/message",
        name: "Message",
        component: Message
      }
    ],
    redirect: "/personal"
  },
  {
    path: "/personChange",
    name: "PersonChange",
    component: PersonChange
  }

]


// 创建路由对象
const router = createRouter({
  history: createWebHistory(),
  routes
})


export default router
