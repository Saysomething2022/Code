<template>
    <div class="common-layout">
      <el-container>
        <el-aside>
          <Menu :isCollapse="isCollapse"/>
        </el-aside>
        <el-container>
          <el-header>
            <el-icon :size="30" @click="ChangeCollapse" style="cursor:pointer;"><fold /></el-icon>
          </el-header>
          <el-main>
            <router-view/>
          </el-main>
        </el-container>
      </el-container>
    </div>
</template>

<script>
import Menu from "@/components/admin/Menu";
import {Fold} from "@element-plus/icons-vue"
export default {
  name: "AdminIndex",
  data(){
    return{
      isCollapse:false
    }
  },
  methods:{
    ChangeCollapse(){
      this.isCollapse = !this.isCollapse
    }
  },
  components: {
    Menu,Fold
  }
}
</script>

<style scoped>
.common-layout{
  margin-top: -60px;
}
.el-header, .el-footer {
  background-color: #B3C0D1;
  color: #333;
  text-align: left;
  display: flex;
  align-items: center;
}
.el-aside {
  background-color: #ffffff;
  color: #333;
  text-align: left;
  height: 700px;
  width: auto;
  max-width: 180px;
}

.el-main {
  background-color: #E9EEF3;
  color: #333;
  text-align: center;
  /*line-height: 160px;*/
  height: 700px;
}

body > .el-container {
  margin-bottom: 40px;
}
.el-container{
  height: 700px;
}

</style>
