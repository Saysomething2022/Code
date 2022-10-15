<template>
<div>
  <el-button-group style="margin-left: 650px">
    <el-button @click="readed">一键已读</el-button>
    <el-button @click="deleteBatch">全部清楚</el-button>
  </el-button-group>
  <el-scrollbar height="400px">
    <div v-for="notice in noticeList" :key="notice.id">
      <Notice :notice="notice"/>
    </div>
  </el-scrollbar>
</div>
  <el-empty v-if="noticeList.length == 0" description="没有内容"></el-empty>
</template>

<script>
import Notice from "@/components/Notice";
export default {
  name: "NoticeList",
  components: {Notice},
  data(){
    return{
      noticeList:[]
    }
  },
  methods:{
    readed(){
      this.axios.get("/message/updateStatusBatch",{
        params:{
          uid:this.$userStore.userinfo.id
        }
      }).then(res => {
        this.noticeList = res.data.data
        this.$userStore.setMessageNumber(0)
      })
    },
    deleteBatch(){
      this.axios.get("/message/deleteMessageBatch",{
        params:{
          uid:this.$userStore.userinfo.id
        }
      }).then(res => {
        this.noticeList = res.data.data
        this.$userStore.setMessageNumber(0)
      })
    }
  },
  beforeCreate() {
    this.axios.get("/message/selectAllMessage",{
      headers:{
        "Authorization": sessionStorage.getItem("token")
      },
      params:{
        uid:this.$userStore.userinfo.id
      }
    }).then(response => {
      console.log("Noticelist====>")
      console.log(response.data.data)
      this.noticeList = response.data.data
    })
  }
}
</script>

<style scoped>

</style>
