<template>
  <div>
    <el-empty v-if="articleList.length == 0" description="没有内容"></el-empty>
    <ul class="infinite-list" style="overflow: auto" >
      <li v-for="article in articleList" :key="article.id" class="infinite-list-item">
        <Article
            :articleObj="article"
        />
      </li>
    </ul>
  </div>
</template>

<script>
import Article from "@/components/Article"
export default {
  name: "MyCollectionList",
  data(){
    return{
      articleList:[]
    }
  },
  components:{
    Article
  },
  beforeCreate() {
    console.log("初始化我的收藏列表")
    this.axios.get("/person/myCollection",{
      headers:{
        "Authorization": sessionStorage.getItem("token")
      },
      params:{
        uid:this.$userStore.userinfo.id
      }
    }).then(response => {
      console.log(response)
      this.articleList = response.data.data
    })

  }
}
</script>

<style scoped>
.infinite-list {
  height: 600px;
  padding: 0;
  margin: 0;
  list-style: none;

}
.infinite-list .infinite-list-item {
  /*display: flex;*/
  /*flex-direction: column-reverse;*/
  align-items: center;
  justify-content: center;
  height: auto;
  background-color: #fff;
  color: var(--el-color-primary);
}
.infinite-list-item :hover{

}

/**修改全局的滚动条*/
/**滚动条的宽度*/
::-webkit-scrollbar {
  width: 8px;

}
::-webkit-scrollbar-thumb {
  background-color: #eaecf1;
  border-radius: 3px;
}
</style>
