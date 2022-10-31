<template>
  <div>
    <el-menu
        default-active="2"
        class="el-menu-vertical-demo"
        :collapse="isCollapse"
        @open="handleOpen"
        @close="handleClose"

    >
      <el-menu-item index="1">
        <template #title><b style="font-size: 15px">有言以对后台管理</b></template>
      </el-menu-item>
      <router-link to="/personal" class="menu">
        <el-menu-item index="2">
          <el-icon><house /></el-icon>
          <template #title>个人中心</template>
        </el-menu-item>
      </router-link>
      <el-sub-menu index="3">
        <template #title>
          <el-icon><collection /></el-icon>
          <span>帖子管理</span>
        </template>
        <el-menu-item-group>
          <router-link to="/ArticleManger" class="menu">
            <el-menu-item index="1-1"><el-icon><reading /></el-icon>帖子查看</el-menu-item>
          </router-link>
          <router-link to="/ArticleType" class="menu">
            <el-menu-item index="1-2"><el-icon><scale-to-original /></el-icon>类型管理</el-menu-item>
          </router-link>
        </el-menu-item-group>
<!--        <el-sub-menu index="1-4">-->
<!--          <template #title><span>item four</span></template>-->
<!--          <el-menu-item index="1-4-1">item one</el-menu-item>-->
<!--        </el-sub-menu>-->
        </el-sub-menu>
        <router-link to="/Notice" class="menu">
          <el-menu-item index="4">
            <el-icon><postcard /></el-icon>
            <template #title>
              公告管理
            </template>
          </el-menu-item>
        </router-link>
        <router-link to="/userManger" class="menu">
          <el-menu-item index="5">
            <el-icon><User /></el-icon>
            <template #title>用户管理</template>
          </el-menu-item>
        </router-link>

        <router-link to="/message" class="menu">
          <el-menu-item index="6">
            <el-icon><CreditCard /></el-icon>
            <template #title>消息管理</template>
          </el-menu-item>
        </router-link>
        <router-link to="/systemLog" class="menu">
          <el-menu-item index="7">
            <el-icon><Warning /></el-icon>
            <template #title>系统日志</template>
          </el-menu-item>
        </router-link>
         <router-link to="/artical" class="menu">
          <el-menu-item index="8">
            <el-icon><setting /></el-icon>
            <template #title>返回首页</template>
          </el-menu-item>
        </router-link> 

    </el-menu>
  </div>
</template>

<script>
import {Setting,Collection,User,House,CreditCard,Warning,Reading,ScaleToOriginal,Postcard} from "@element-plus/icons-vue";
export default {
  name: "Menu",
  data() {
    return {
      modeM: "vertical"
    };
  },
  props:['isCollapse'],
  components:{
    Setting,
    CreditCard,
    Collection,
    User,
    House,
    Warning,
    Reading,
    ScaleToOriginal,
    Postcard
  },
  methods: {
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    }
  }
}
</script>

<style scoped>
.menu{
  text-decoration: none
}
.el-menu-vertical-demo{
  min-height: 400px;
  border-right-width: 0;
  overflow-x: hidden;
}
@media screen and (max-width: 1080px) {
  .el-menu-vertical-demo {
    modeM: "horizontal";
  }
}
</style>
