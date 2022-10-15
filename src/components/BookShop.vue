<template>
    <div class="common-layout">
      <el-container>
        <el-header class="header1">
          <Header></Header>
        </el-header>
        <el-main>Main</el-main>
      </el-container>
    </div>
</template>

<script>
import Header from "@/components/Header"
export default {
  name: "BookShop",
  components:{
    Header
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
  background-color: #ffffff;
  color: var(--el-text-color-primary);
  line-height: 50px;
  margin-left: 160px;
  margin-right: 15px;
  margin-top: 20px;
  text-align: left;
  height: 700px;
  width: 1000px;
}
.common-layout > .el-container {
  /*margin-top: -40px;*/
  margin-bottom: 20px;
}
</style>