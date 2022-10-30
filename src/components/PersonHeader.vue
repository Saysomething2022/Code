<template>
  <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick(activeName)">
    <el-tab-pane label="文章" name="article"></el-tab-pane>
    <!-- <el-tab-pane label="QA" name="answer"></el-tab-pane> -->
    <el-tab-pane label="通知" name="notice"></el-tab-pane>
    <el-tab-pane label="收藏" name="collection"></el-tab-pane>
<!--    <el-tab-pane label="私信" name="messages">私信</el-tab-pane>-->
  </el-tabs>
</template>

<script>
import router from "@/router";
export default {
  name: "PersonHeader",
  data(){
    return{
      articleList:[],
      activeName:'',
      notices:""
    }
  },
  props:['userinfo'],
  methods:{
    handleClick(tab){
        console.log(tab)
        console.log(router)
      if (tab === 'article'){
          router.push({
            name:"PersonArticle",
            params:{
              category:tab,
            }
        })

      }else if (tab === 'answer'){
        router.push({
          name:"PersonArticle",
          params:{
            category:tab,
          }
        })
      }else if (tab === 'notice'){
        router.push({
          name:"NoticeList",
        })
      }else if (tab == 'collection'){
        router.push({
          name:"MyCollectionList",
        })
      }

    }
  },
  beforeCreate() {
  }
}
</script>

<style scoped>
.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}
</style>
