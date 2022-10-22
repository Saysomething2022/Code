const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave:false,
  // publicPath:process.env.NODE_ENV == 'localhost:8080'
  devServer: {
    host: '192.168.43.69',  // 将浏览地址的本地服务修改为本机ip地址，用来到手机上测试
  }
})
