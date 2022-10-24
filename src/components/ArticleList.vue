<template>
  <div>
    <el-empty v-if="articleList.length == 0" description="没有内容"></el-empty>
    <ul v-infinite-scroll="load" infinite-scroll-distance="1" :infinite-scroll-disabled="isbottom" infinite-scroll-immediate="false"  class="infinite-list" style="overflow: auto" >
      <li v-for="article in articleList" :key="article.id" class="infinite-list-item">
        <Article
            :articleObj="article"
            @ChangeArticleList="ChangeArticleList"
        />
      </li>
    </ul>
  </div>
</template>

<script>
import Article from "@/components/Article";
import {UserStore} from "@/store/index";
export default {
  name: "articleList",
  components: {Article},
  data(){
    return{
      page:1,
      isbottom:false,
    }
  },
  props:['articleList','ChangeArticleList'],
  methods:{
    load(){
      //模仿后台追加数据
      this.page++;
      const store = UserStore()
      this.$message.info("加载下一页")
      setTimeout(() => {
        this.axios.get("/article",{
          params:{
            page:this.page,
            category:store.category,
            type_id:this.$userStore.typeId
          }
        }).then(response => {
          if (response.data.data.records.length != 0){
            this.$message.success("加载成功！")
            for (let i = 0; i < response.data.data.records.length; i++) {
              this.articleList.push(response.data.data.records[i])
            }
          }else {
            this.isbottom = true
            this.$message.warning("已经到底了")
          }
        })
      },1000)
    }
  }
  ,created() {
  }
}

</script>

<style scoped>
.infinite-list {
  height: 100%;
  padding: 0;
  margin: 0;
  list-style: none;
}
.infinite-list .infinite-list-item {
  /*display: flex;*/
  /*flex-direction: column-reverse;*/
  align-items: center;
  justify-content: center;
  height: 250px;
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
