<template>
<div class="scrollbar-demo-item">
  <router-link style="margin-left: 10px;margin-top:20px" to="/person">
    <el-avatar v-if="notice1.mesType == 0" shape="square" :size="50" :src="notice1.avatar"></el-avatar>
    <el-avatar v-if="notice1.mesType == 1" shape="square" :size="50" src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
  </router-link>
  <div style="margin-left: 6px;margin-top:-17px;position: relative;width: 600px;text-align: left">
    <span>
      <b v-if="notice1.mesType == 0">{{notice1.email}}</b>
      <b v-if="notice1.mesType == 1">管理员</b>
      <b style="color: cornflowerblue">{{ notice1.content }}</b>
    </span>
    <p style="margin-top: -25px;margin-left:-2px;position:absolute;font-size: 13px"><el-icon><watch /></el-icon>{{notice1.createTime}}</p>
  </div>
  <div>
    <el-tag style="cursor: pointer" type="warning" @click="updateStatus(1)" v-if="notice1.status == 0">未读</el-tag>
    <el-tag style="cursor: pointer" type="primary" @click="updateStatus(0)" v-if="notice1.status == 1">已读</el-tag>
  </div>
</div>
</template>

<script>
import watch from "@element-plus/icons-vue/dist/es/watch.mjs";
export default {
  name: "Notice",
  components:{
    watch
  },
  data() {
    return {
        notice1:this.notice
    }
  },
  methods:{
    updateStatus(status){
      this.axios.get("message/updateStatus",{
        params:{
          id:this.notice1.id,
          status:status
        }
      }).then(res => {
        this.notice1.status = res.data.data.status
        this.axios.get("message/selectUnread",{
          params:{
            uid:this.$userStore.userinfo.id
          }
        }).then(res => {
          this.$userStore.setMessageNumber(res.data.data)
        })
      })
    }
  },
  watch:{
    notice(){
      this.notice1 = this.notice
    }
  },
  props:['notice']
}
</script>

<style scoped>
.scrollbar-demo-item {
  height: 70px;
  margin: 10px;
  text-align: center;
  border-radius: 4px;
  justify-content: left;
  display: flex;
  align-items: center;
}
.scrollbar-demo-item:hover{
  background: var(--el-color-primary-light-9);
  color: var(--el-color-primary);
}
</style>
