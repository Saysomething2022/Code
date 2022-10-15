<template>
  <div class="common-layout">
    <el-container>
      <el-header class="header1">
        <Header/>
      </el-header>
      <el-container>
        <el-container>
          <el-main>
            <h1 style="font-size: 40px">{{noticeDetail.title}}</h1>
            <el-space :spacer="spacer">
              <el-avatar
                  :src="noticeDetail.avatar"
              ></el-avatar>
              <span>{{ noticeDetail.nickName?noticeDetail.nickName:noticeDetail.email }}</span>
              <span>发布于 {{ noticeDetail.createTime }}</span>
            </el-space>
            <div class="article-main" v-html="noticeDetail.content">
            </div>
          </el-main>
        </el-container>
        <el-container style="margin-top: 15px;margin-right:100px">
          <el-header class="header3">
            <h1>关于作者</h1>
            <el-divider></el-divider>
            <el-space class="space">
              <router-link to="/persion" class="link">
                <el-avatar
                    :src="noticeDetail.avatar"
                ></el-avatar>
                <span style="margin-left: 10px">{{ noticeDetail.nickName?noticeDetail.nickName:noticeDetail.email }}</span>
              </router-link>
              <span @click="focus(noticeDetail.authorId)">
                  <el-icon v-if="isfocus" :size="30" style="cursor:pointer"><CircleCheckFilled /></el-icon>
                  <el-icon v-if="!isfocus" :size="30" style="cursor:pointer"><CirclePlus/></el-icon>
                  </span>
            </el-space>
          </el-header>
        </el-container>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import Header from "./Header"
import {marked} from 'marked';
import {CirclePlus,CircleCheckFilled,Star,StarFilled} from "@element-plus/icons-vue";
// 代码高亮
import hljs from 'highlight.js';
// 自选代码高亮样式
import 'highlight.js/scss/atom-one-dark.scss';
import {ElDivider} from "element-plus";
import {h} from "vue";
import Comment from './Comment'
export default {
  name: "NoticeDetail",
  components: {
    CirclePlus,
    Header,
    CircleCheckFilled,
    Star,
    StarFilled
  },
  data(){
    return{
      // publicPath:process.env.BASE_URL,
      noticeDetail:{
        id:'',
        title:'',
        content:'',
        status:'',
        creatorId:'',
        createTime:'',
        updateTime:'',
        email:'',
        nickName:'',
        avatar:'',
      },
      isfocus:false,
      isCollection:false,
      spacer:h(ElDivider, { direction: 'vertical' }),
      good:false,
      comment:'',
      comments:[],
    }
  },
  methods: {
    check() {
      this.good = !this.good
    },
    focus(focusedId) {
      console.log("=================")
      if (this.$userStore.userinfo == null) {
        this.$message.warning("请先登录")
        return false
      }
      var focusId = JSON.parse(sessionStorage.getItem("userinfo")).id
      console.log(focusId)
      console.log(focusedId)
      if (focusId === focusedId) {
        this.$message.warning("不能关注自己！")
        return false
      }
      this.isfocus = !this.isfocus
      this.axios.get("/focus_author", {
            headers: {
              "Authorization": sessionStorage.getItem("token")
            },
            params: {
              isfocus: this.isfocus,
              focusId: focusId,
              focusedId: focusedId
            }
          }
      ).then(response => {
        if (this.isfocus) {
          this.$message.success("关注成功")
        } else {
          this.$message.warning("取消关注")
        }
      })

    },
  },
  beforeCreate() {
    console.log(this.$route.params.noticeId)
    var noticeId = this.$route.params.noticeId
    //查询文章详情
    this.axios.get('/notice/selectNoticeDetail', {
      params: {
        id: noticeId
      }
    }).then(response => {
      console.log(response)
      // 用于记录标题数，根据业务代替
      let count = 0;
      // 记录标题内容
      const headstemp = [];
      // marked设置
      const rendererMD = new marked.Renderer();
      // 调整标题内容
      rendererMD.heading = (text, level) => {
        headstemp.push({text, level});
        count++;
        return `<h${level} id="heading-${count}"><span class="h-text">${text}</span></h${level}>`;
      };
      marked.setOptions({
        highlight(code) {
          return hljs.highlightAuto(code).value
        },
        renderer: rendererMD
      });
      this.noticeDetail = response.data.data
      console.log("文章参数")
      console.log(this.noticeDetail)
      const html = marked(this.noticeDetail.content);
      this.noticeDetail.content = html

      //查询是否关注该作者或收藏该文章
      this.axios.get("/focus_author/isFocusOrCollection", {
        params: {
          focusId: this.$userStore.userinfo != null ? this.$userStore.userinfo.id : "",
          authorId: this.noticeDetail.creatorId
        }
      }).then(response => {
        console.log("是否关注的信息====》" + response.data.data)
        this.isfocus = response.data.data.isFocus
        this.isCollection = response.data.data.isCollection
      })
    })

  },
  created() {
  }
}
</script>

<style scoped>
.common-layout .header1{
  margin-top: -60px;
  background-color: #ffffff;
  border-bottom: 1px solid #e9eef3;
  margin-left: -50px;
}
.common-layout .el-main {
  position: relative;
  background-color: #ffffff;
  color: var(--el-text-color-primary);
  margin-left: 160px;
  margin-right: 15px;
  margin-top: 10px;
  text-align: left;
  width: 940px;
  display: inline-block;
  height: 100%;

}
::-webkit-scrollbar {
  display: none; /* Chrome Safari */}
.common-layout .el-aside {
  background-color: #ffffff;
  color: var(--el-text-color-primary);
  margin-top: 10px;
  height: 300px;
  text-align: left;
}

.header3{
  background-color: #ffffff;
  width: 300px;
  height: 150px;
  text-align: left;
}
.link{
  text-decoration: none;
  color: #000000;
  display: flex;
  align-items: center;
}
.footer{
  position: absolute;
  margin-left: 750px;
  margin-bottom: 0px;
}
.footer1{
  background-color: #ffffff;
  width: 940px;
  margin-top: 15px;
  margin-left: 160px;
  display: inline-block;
  height: auto;
}
</style>
