<template>
    <el-space
      fill
      wrap
      class="el-space"
  >
    <el-card class="box-card">
        <div class="card-header">
          <el-space :spacer="spacer">
            <el-avatar
                :src="articleObj1.avatar"
                class="avatarM"
            ></el-avatar>
            <span>{{articleObj1.nickName?articleObj1.nickName:articleObj1.email}}</span>
            <span class="timeM">发布于 {{ articleObj1.createTime }}</span>
            <el-tag v-if="articleObj1.type != null">{{ articleObj1.type }}</el-tag>
          </el-space>
        </div>

        <div class="main">
          <router-link :to="{name:'ArticleDetail',params:{articleId:articleObj1.id}}"  style="font-size: 20px;text-decoration: none;color: #000000;font-weight: bold">
            <span class="title">{{articleObj1.title}}</span>
            <span class="content">
            {{articleObj1.content}}
            </span>
          </router-link>
          <div class="icon">
            <router-link to="/" style="text-decoration: none" >
              <i :class="good ?'iconfont icon-dianzan':'iconfont icon-good'" @click="check(articleObj1.id)"></i> <span>{{articleObj1.approves}}</span>
            </router-link>
            <el-divider direction="vertical"></el-divider>
            <el-icon><View /></el-icon> <span >{{articleObj1.views}}</span>
            <el-divider direction="vertical"></el-divider>
            <el-icon><ChatDotSquare /></el-icon> <span>{{articleObj1.comments}}</span>
          </div>

        </div>
    </el-card>
  </el-space>

</template>

<script>
import { h } from 'vue'
import { ElDivider } from 'element-plus'
import {ChatDotSquare,View} from "@element-plus/icons-vue";
export default {
  name: "Article",
  data(){
    return{
      spacer:h(ElDivider, { direction: 'vertical' }),
      good:false,
      articleObj1:this.articleObj
    }
  },
  props:['articleObj','ChangeArticleList'],
  components:{
    ChatDotSquare,View
  },
  methods:{
    check(id){
      this.axios.get("/article/approve",{
        headers:{
          "Authorization": sessionStorage.getItem("token")
        },
        params:{
          id:id,
          good:!this.good
        }
      }).then(response => {
        console.log(response)
        if (this.good == false){
          this.$message.success('点赞成功')
          this.good = true
          //
          // this.axios.get("/article").then(response => {
          //   console.log(response.data.data)
          //   this.$emit('ChangeArticleList',response.data.data)
          // })
          this.articleObj1.approves = this.articleObj1.approves + 1
        }else {
          this.$message.warning('取消点赞')
          this.articleObj1.approves = this.articleObj1.approves - 1
          this.good = false
        }
      })
    }
  }
}
</script>


<style scoped>
.box-card{
  position: relative;
  line-height: 40px;
  display: flex;
  text-align: left;
  height: 250px;

}
.card-header{
  position: absolute;
  margin-top: -0px;
}
.title:hover{
  color: #409EFF;
}
.text_item{
  /*position: absolute;*/
}
.main{
  display: flex;
  flex-direction: column;
  margin-top: 50px;
}
.el-space{
  width: 100%;
  /*line-height: 40px;*/
}
.content{
  position:absolute;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  font-size: 15px;
  line-height: 30px;
  margin-top: 5px;
  font-weight: normal;
}
.icon{
  margin-top: 50px;
  float: left;
}
@media screen and (max-width: 1080px) {
  .card-header {
    height: 10%;
  }
  .avatarM, .timeM {
    display: none;
  }
}
</style>
