<template>
  <div class="common-layout">
    <el-container>
      <el-header class="header1">
        <Header></Header>
      </el-header>
      <el-container>
        <el-header class="header2">
          <el-card :body-style="{ padding: '0px' }" style="width: 1200px;margin-left: -20px">
            <img
                src="img/person.jpg"
                class="image"
            />
          </el-card>
          <div style="position: relative">
            <img class="userAvatar" :src="$userStore.userinfo.avatar" />
              <div style="margin-top: -80px;margin-left: 210px;width: 650px">
                <div style="float:left;">
                  <span class="username"><b>{{$userStore.userinfo.nickName?$userStore.userinfo.nickName:$userStore.userinfo.email}}</b></span>
                </div>
                <div style="margin-left: 200px">
                  <span><b>加入时间</b>：{{$userStore.userinfo.createTime }}</span>
                  <span style="margin-left: 60px"><b>个人简介:</b>{{$userStore.userinfo.describe?$userStore.userinfo.describe:'这个太懒了~'}}</span>
                  <br>
                  <br>
                  <span><b>身份</b>：{{$userStore.userinfo.role}}</span>
                </div>
                <div style="width: auto;margin-left: 820px;margin-top: -50px">
                  <el-button  style="background-color: #626aef;color: white;width: 100px;height: 32px"  @click="toChange">
                    <el-icon color="white"><EditPen /></el-icon>编辑
                  </el-button>
                </div>
                <PersonChange @change="change" :dialogFormVisible="dialogFormVisible"></PersonChange>
              </div>
          </div>

        </el-header>
        <el-container class="main">
          <el-main  style="height: auto">
            <PersonHeader/>
            <router-view/>
          </el-main>
          <el-container style="display:flex;flex-direction: column;">
            <el-aside>
              <h2 style="margin-left: 10px">Ta关注的人（{{myfocus.length}}）</h2>
              <el-divider></el-divider>
              <div>
                <div v-for="myfocu in myfocus" :key="myfocu.id" style="margin-left: 10px;text-align: center;float: left;width: 100px">
                  <div>
                    <el-avatar :size="60" :src="myfocu.avatar">
                    </el-avatar>
                  </div>
                  <div style="margin-top: 20px;width: auto">
                    <span style="font-size: 1px">{{ myfocu.nickName?myfocu.nickName:myfocu.email}}</span>
                  </div>
                </div>
              </div>

            </el-aside>
            <el-aside>
              <h2 style="margin-left: 10px">关注Ta的人（{{myfocused.length}}）</h2>
              <el-divider></el-divider>
              <div>
                <div v-for="myfocu in myfocused" :key="myfocu.id" style="margin-left: 10px;text-align: center;float: left;width: 100px">
                  <div>
                    <el-avatar :size="60" :src="myfocu.avatar">
                    </el-avatar>
                  </div>
                  <div style="margin-top: 20px;width: auto">
                    <span style="font-size: 1px">{{ myfocu.nickName?myfocu.nickName:myfocu.email }}</span>
                  </div>
                </div>
              </div>
            </el-aside>
          </el-container>
        </el-container>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import Header from "@/components/Header"
import PersonHeader from "@/components/PersonHeader";
import websocketServer from "@/websocket";
import {EditPen} from "@element-plus/icons-vue";
import PersonChange from "@/components/PersonChange";
export default {
  name: "Person",
  components:{
    PersonChange,
    PersonHeader,
    Header,
    EditPen
  },
  data(){
    return{
      myfocus:[],
      myfocused:[],
      userinfo:{
      },
      dialogFormVisible:false
      // publicPath:process.env.BASE_URL
    }
  },
  methods:{
    toChange(){
      console.log("弹出")
      this.dialogFormVisible = true
    },
    change(b){
      this.dialogFormVisible = b
    }
  },
  created() {
    this.axios.get("/person/myfocus",{
      headers:{
        "Authorization": sessionStorage.getItem("token")
      },
      params:{
        uid:this.$userStore.userinfo.id
      }
    }).then(response => {
      console.log(response.data.data)
      this.myfocus = response.data.data.MyFocus
      this.myfocused = response.data.data.MyFocused
    })
    this.$userStore.ismessage = false
  },
  beforeRouteLeave(){
    console.log("离开路由----》")
    websocketServer.closeWebSocket()
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
.image{
  width: 100%;
  height: 200px;
  display: block;
}
.username{
font-size: 15px;
}
.userAvatar{
  margin-top: -110px;
  /*float: left;*/
  height: 200px;
  width: 200px;
}
.common-layout .header2{
  background-color: #ffffff;
  border-bottom: 1px solid #e9eef3;
  width: 1200px;
  margin-left: 160px;
  margin-top: 10px;
  height: 300px;
  text-align: left;
}
.main{
  width: 1360px;
  height: auto;
}
.common-layout .el-aside {
  background-color: #ffffff;
  color: var(--el-text-color-primary);
  margin-top: 20px;
  height: auto;
  text-align: left;
  width: 280px;
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
  width: 900px;
}

.common-layout > .el-container {
  /*margin-top: -40px;*/
  margin-bottom: 20px;
}
</style>
