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
  //移动端的时候加入移动端适配代码，界面中追加一下代码
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="report" content="{&quot;pid&quot;:&quot;blog&quot;,&quot;spm&quot;:&quot;1001.2101&quot;">
<meta name="applicable-device" content="mobile">
<meta http-equiv="Cache-Control" content="no-transform">
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
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
