<template>
  <el-container>
    <iframe src="http://localhost:8888/swagger-ui/index.html#/" class="api"></iframe>
  </el-container>

</template>

<script>
export default {
  name: "Api"
}
</script>

<style scoped>
.api{
  width: 100%;
  height: 100%;
  overflow:hidden;
  frameborder:no;
  border:0;
  marginwidth:0;
  marginheight:0;
  scrolling:no;
}
</style>
