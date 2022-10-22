<template>
  <div class="common-layout">
    <el-container>
      <el-header class="header1">
        <Header/>
      </el-header>
      <el-container>
        <el-container class="articlaD">
        <el-main>
          <h1 style="font-size: 40px">{{articleDetail.title}}</h1>
          <el-space :spacer="spacer">
            <el-avatar
                :src="articleDetail.avatar"
            ></el-avatar>
            <span>{{ articleDetail.nickName?articleDetail.nickName:articleDetail.email }}</span>
            <span>发布于 {{ articleDetail.createTime }}</span>
            <router-link :to="{name:'AddArticle',params:{
              id:articleDetail.id
            }}" style="text-decoration: none">
              <span v-if="this.$userStore.userinfo?articleDetail.authorId == this.$userStore.userinfo.id:false">编辑</span>
            </router-link>
              <span v-if="this.$userStore.userinfo?articleDetail.authorId == this.$userStore.userinfo.id:false" style="color: #551a8b;cursor:pointer" @click="deleteArticle(articleDetail.id)">删除</span>
          </el-space>
          <div class="article-main" v-html="articleDetail.content">
          </div>
          <div class="footer">
            <el-button type="default">
              <i :class="good ?'iconfont icon-dianzan':'iconfont icon-good'" @click="check"/><span>点赞</span>
            </el-button>
            <el-button type="default" style="" @click="collection">
              <el-icon v-if="!isCollection"><star/></el-icon>
              <el-icon v-if="isCollection"><star-filled/></el-icon>
              <span style="margin-top: 3px">收藏</span>
            </el-button>
          </div>
        </el-main>
         <el-footer class="footer1">
           <el-input
               v-model="comment"
               :rows="2"
               type="textarea"
               placeholder="输入评论..."
               style="margin-top: 10px"
           />
           <el-button type="primary" style="margin-left: 800px;margin-top: 25px" @click="addComment(articleDetail.id)">提交评论</el-button>
           <el-divider/>
           <Comment :comments="comments" @changeComments="changeComments"></Comment>
           <el-divider/>
         </el-footer>
        </el-container>
          <el-container class="AC" style="margin-top: 15px;margin-right:100px">
              <el-header class="header3">
                <h1>关于作者</h1>
                <el-divider></el-divider>
                <el-space class="space">
                  <router-link to="/persion" class="link">
                    <el-avatar
                        :src="articleDetail.avatar"
                    ></el-avatar>
                    <span style="margin-left: 10px">{{ articleDetail.nickName?articleDetail.nickName:articleDetail.email }}</span>
                  </router-link>
                  <span @click="focus(articleDetail.authorId)">
                  <el-icon v-if="isfocus" :size="30" style="cursor:pointer"><CircleCheckFilled /></el-icon>
                  <el-icon v-if="!isfocus" :size="30" style="cursor:pointer"><CirclePlus/></el-icon>
                  </span>
                </el-space>
              </el-header>
              <el-aside style="height: 485px">
                <h1 style="margin-left: 18px;font-size: 15px">相关推荐</h1>
                <el-divider></el-divider>
                <div v-for="recommend in recommendArticle" :key="recommend.id" style="margin-top: 15px">
                  <router-link :to="{name:'ArticleDetail',params:{articleId:recommend.id}}" style="text-decoration: none;color: #000000;">
                    <span class="content">{{recommend.title}}</span>
                  </router-link>
                  <div style="margin-left: 10px">
                    <el-space>
                      <el-avatar  :size="30" :src="recommend.avatar"/>
                      <span style="margin-left: 5px;">{{ recommend.nickName != null ? recommend.nickName:recommend.email}}</span>
                    </el-space>
                    <span class="time"><el-icon><View /></el-icon> <span >{{recommend.views}}</span></span>
                  </div>
                </div>
              </el-aside>
            </el-container>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import Header from "./Header"
import {marked} from 'marked';
import {CirclePlus,CircleCheckFilled,Star,StarFilled,View} from "@element-plus/icons-vue";
// 代码高亮
import hljs from 'highlight.js';
// 自选代码高亮样式
import 'highlight.js/scss/atom-one-dark.scss';
import {ElDivider} from "element-plus";
import {h} from "vue";
import Comment from './Comment'
export default {
  name: "ArticleDetail",
  components: {
    CirclePlus,
    Header,
    CircleCheckFilled,
    Star,
    Comment,
    StarFilled,
    View
  },
  data(){
    return{
      // publicPath:process.env.BASE_URL,
      articleDetail:{
        id:'',
        title:'',
        content:'',
        category:'',
        status:'',
        typeId:'',
        authorId:'',
        collections:'',
        views:'',
        approves:'',
        comments:'',
        createTime:'',
        updateTime:'',
        email:'',
        nickName:'',
        avatar:'',
        type:''
      },
      recommendArticle:[],
      isfocus:false,
      isCollection:false,
      spacer:h(ElDivider, { direction: 'vertical' }),
      good:false,
      comment:'',
      comments:[],
    }
  },
  methods:{
    addComment(articleId){
      var userinfo = this.$userStore.userinfo
      if (userinfo == null){
        this.$message.warning("请先登录")
        return false
      }
      this.axios.post("/article/addParComment", {
            articleId:articleId,
            userId:userinfo.id,
            userEmail:userinfo.email,
            userAvatar:userinfo.avatar,
            nickName:userinfo.nickName,
            content:this.comment,
        },
 {
        headers:{
          "Authorization": sessionStorage.getItem("token")
        }
      }).then(response => {
        console.log(response)
        this.$message.success("评论成功")
        this.axios.get("/article/selectComment",{
          params:{
            id:articleId
          }
        }).then(response => {
          console.log(response.data.data)
          this.comments = response.data.data
        })
        this.comment = ''
      })
    },
    changeComments(comments){
      this.comments = comments
    },
    deleteArticle(id){
      this.axios.get('/article/deleteArticle',{
        headers:{
          "Authorization": sessionStorage.getItem("token")
        },
        params:{
          articleId:id
        }
      }).then(response => {
        console.log(response.data.message)
        this.$message.success("删除成功")
        this.$router.push("/article")
      })
    },
    check(){
      this.good = !this.good
    },
    focus(focusedId){
      console.log("=================")
      if(this.$userStore.userinfo == null){
        this.$message.warning("请先登录")
        return false
      }
      var focusId = JSON.parse(sessionStorage.getItem("userinfo")).id
      console.log(focusId)
      console.log(focusedId)
      if (focusId === focusedId){
        this.$message.warning("不能关注自己！")
        return false
      }
      this.isfocus = !this.isfocus
      this.axios.get("/focus_author",{
        headers:{
          "Authorization": sessionStorage.getItem("token")
        },
        params:{
          isfocus:this.isfocus,
          focusId:focusId,
          focusedId:focusedId
        }
      }
      ).then(response => {
        if (this.isfocus){
          this.$message.success("关注成功")
        }else {
          this.$message.warning("取消关注")
        }
      })

    },
    collection(){
      this.isCollection = !this.isCollection
      if (this.$userStore.userinfo == null){
        this.$message.warning("请先登录!")
        return false
      }
      this.axios.post("/article/addCollection",{
            userId:this.$userStore.userinfo.id,
            articleId:this.articleDetail.id,
            isCollection:this.isCollection?1:0
      },
{
        headers:{
          "Authorization": sessionStorage.getItem("token")
        }
      }).then(response => {
        if (this.isCollection){
          this.$message.success("收藏成功!")
        }else {
          this.$message.warning("取消收藏!")
        }

      })
    }
  },
  beforeCreate() {
    var articleId = this.$route.params.articleId
    //查询文章详情
    this.axios.get('/article/articleDetail', {
      params: {
        articleId: articleId
      }
    }).then(response => {
      console.log(response)
      // 用于记录标题数，根据业务代替
      let count = 0;
      // 记录标题内容
      const headstemp = [];
      // marked设置
      const rendererMD = new marked.Renderer();

      // // 设置图片内容，统一显示一张缓存图，用于懒加载~
      // rendererMD.image = (href, _, text) =>
      //     `<img data-src="${href}" src="" alt="${text}">`;
      // 调整标题内容
      rendererMD.heading = (text, level) => {
        headstemp.push({ text, level });
        count++;
        return `<h${level} id="heading-${count}"><span class="h-text">${text}</span></h${level}>`;
      };
      marked.setOptions({
        highlight(code) {
          return hljs.highlightAuto(code).value
        },
        renderer: rendererMD
      });
      this.articleDetail = response.data.data
      const html = marked(this.articleDetail.content);
      this.articleDetail.content = html

      //查询是否关注该作者或收藏该文章
      this.axios.get("/focus_author/isFocusOrCollection",{
        params:{
          articleId:this.articleDetail.id,
          focusId:this.$userStore.userinfo != null?this.$userStore.userinfo.id:"",
          authorId:this.articleDetail.authorId
        }
      }).then(response => {
        console.log("是否关注的信息====》"+response.data.data)
        this.isfocus = response.data.data.isFocus
        this.isCollection = response.data.data.isCollection
      })
      //查询推荐文章
      this.axios.get("/article/selectArticleByType",{
        params:{
          typeId:this.articleDetail.typeId
        }
      }).then(res => {
        this.recommendArticle = res.data.data
      })

      //查询评论
      this.axios.get("/article/selectComment",{
        params:{
          id:articleId
        }
      }).then(response => {
        console.log(response.data.data)
        this.comments = response.data.data
      })

      console.log(articleId)
      //记录浏览数
      this.axios.get("/article/addviews",{
        params:{
          articleId:articleId
        }
      }).then(response => {
        console.log(response)
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
  margin-left: 70%;
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
.content{
  display:block;
  font-size: 18px;
  width: 100px;
  font-weight:bold;
  line-height: 34.67px;
  margin-left: 10px;
  text-overflow:ellipsis;
  overflow:hidden;
  width: 11em;
  white-space:nowrap;
}
.time{
  float: right;
  margin-right: 10px;
  font-size: 18px;
  line-height: 34.67px;
}
.content:hover{
  color: #409EFF;
}
@media screen and (max-width: 1080px) {
  .AC {
    display: none;
  }
  .articlaD {
    height: 100%;
  }
  .common-layout .el-main, .footer1 {
    width: 90%;
    margin-left: 5%;
    margin-right: 5%;
    padding: 4%;
  }
}
</style>
