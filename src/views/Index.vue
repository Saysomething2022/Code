<template>
    <div class="common-layout" v-if="refash">
      <el-container>
        <el-header class="header1">
          <Header @ChangeArticleList="ChangeArticleList"></Header>
        </el-header>
        <el-container>
          <el-main style="width: 1000px;margin-top: 15px">
            <Nav :ChangeArticleList="ChangeArticleList"></Nav>
            <ArticleList :articleList="articleList" @ChangeArticleList="ChangeArticleList"></ArticleList>
          </el-main>
          <el-container style="margin-top: 15px;margin-right:100px">
            <el-header class="header3" v-if="$userStore.userinfo != null">
              <h2>我的成就</h2>
              <el-divider></el-divider>
              <div style="display: flex;margin-left: -60px">
                <p class="p">
                <span><b>{{$userStore.achievement != null ? $userStore.achievement.articleCount : 0}}</b></span>
                <span style="margin-top: 20px;">文章</span>
                </p>
                <p class="p">
                  <span><b>{{$userStore.achievement != null ? $userStore.achievement.answerCount : 0}}</b></span>
                  <span style="margin-top: 20px;">提问</span>
                </p>
                <p class="p">
                  <span><b>{{$userStore.achievement != null ? $userStore.achievement.approves : 0}}</b></span>
                  <span style="margin-top: 20px;">获赞</span>
                </p>
              </div>

            </el-header>
            <el-aside>
              <h2 style="margin-left: 10px">公告</h2>
              <el-divider>
              </el-divider>
              <div v-for="notice in noticeList" :key="notice.id">
                <router-link :to="{name:'NoticeDetail',params:{noticeId:notice.id}}" style="text-decoration: none;color: #000000;">
                  <span class="content">{{notice.title}}</span>
                  <span class="time">{{ notice.updateTime.substring(0,10) }}</span>
                </router-link>

              </div>
            </el-aside>
          </el-container>
        </el-container>
      </el-container>
    </div>
</template>

<script>
import Header from "@/components/Header";
import Nav from "@/components/Nav";
import ArticleList from "@/components/ArticleList";
import {UserStore} from "@/store/index";
import {ElLoading} from "element-plus";
import {loading} from "@element-plus/icons-vue";
export default {
  name:'Index',
  components: {ArticleList, Header,Nav},
  data(){
    return{
      articleList:[],
      noticeList:[],
      refash:true
    }
  },
  setup() {
    // 调用函数 获得Store
    const store = UserStore();
    return {
      store
    }
  },
  methods:{
    ChangeArticleList(articleList){
      this.articleList = articleList
    }
  },
  watch:{
    articleList(){
      this.refash= false
      this.$nextTick(()=>{

        this.refash = true
      })
    }
  },
  beforeCreate() {
    const Loading = ElLoading.service({
      lock:true,
      text:'拼命加载中',
      spinner:loading,
      background: 'rgba(0, 0, 0, 0.7)'
    });
    //初始化列表
    this.axios.get("/article").then(response => {
      this.articleList = response.data.data.records
    })
    //查询最新公告
    this.axios.get("/notice/selectNotices").then(res => {
      this.noticeList = res.data.data
      Loading.close()
    })

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
.common-layout .el-footer {
  background-color: #b3c0d1;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 60px;
}
.common-layout .el-footer {
  line-height: 60px;
  background-color: #ffffff;
}

.common-layout .el-aside {
  background-color: #ffffff;
  color: var(--el-text-color-primary);
  margin-top: 10px;
  height: 300px;
  text-align: left;
}

.common-layout .el-main {
  background-color: #ffffff;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 500px;
  margin-left: 160px;
  margin-right: 15px;
}

.common-layout > .el-container {
  /*margin-top: -40px;*/
  margin-bottom: 20px;
}
.header3{
  background-color: #ffffff;
  width: 300px;
  text-align: left;
  height: 200px;
}
.p{
  display: flex;
  flex-direction: column;
  margin-left: 60px;
  text-align: center;
}
.content{
  font-size: 18px;
  font-weight:bold;
  line-height: 34.67px;
  margin-left: 10px;
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

</style>
