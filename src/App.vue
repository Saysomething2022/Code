<template>
<router-view :key="$route.fullPath"/>
</template>
<script>

export default {
  name: 'App',
  components: {
  },
  mounted: ()=>{
  if(this._isMobile()){
  //移动端的时候加入移动端适配代码
  
  }
  },
  methods:{
  _isMobile(){//判断是否是移动端
  let flag = navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)
  // localStorage.setItem('isiphone',flag)
  localStorage.setItem('ismobile',flag?1:0)
  return flag;
},
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
