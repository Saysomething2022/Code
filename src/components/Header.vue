<template>
  <div>
    <div>
      <el-link :underline="false" style="float: left;width: 400px">
        <img src="../assets/logo.png" class="img1">
      </el-link>
      <el-link :underline="false" :type="$userStore.hover == 0? 'primary':'default'" @click="article" style="margin-left: -1000px;margin-top: 10px">文章</el-link>
      <el-link :underline="false" :type="$userStore.hover == 1? 'primary':'default'" @click="answer" style="margin-left: 10px;margin-top: 10px">QA</el-link>
<!--      <el-link :underline="false" :type="$userStore.hover == 2? 'primary':'default'" @click="book" style="margin-left: 10px;margin-top: 10px">平台合作书籍</el-link>-->
    </div>

    <div class="demo-input-size">
      <el-input
          v-model="input"
          class="w-50 m-2"
          size="large"
          placeholder="请输入关键字"
          @keydown.enter="search"
      >
        <template #suffix>
          <el-icon class="el-input__icon" @click="search"><Search /></el-icon>
        </template>
      </el-input>
    </div>
    <div  class="demo-button-size">
        <el-button  style="background-color: #626aef;color: white;width: 100px;height: 32px"  @click="post">
        <el-icon color="white"><EditPen /></el-icon>写文章
      </el-button>
<!--      <el-button type="primary" >-->
<!--        <el-icon><EditPen /> </el-icon>提问题-->
<!--      </el-button>-->
      <el-link style="margin-left: 20px" v-if="haslogin != null" href="/noticeList">
        <el-badge :is-dot="$userStore.messageNumber != 0"><el-icon ><Bell /></el-icon></el-badge>
      </el-link>
      <el-button type="default" v-if="haslogin == null" @click="tologin">
         登录
      </el-button>
   <el-dropdown trigger="hover" v-if="haslogin != null" style="margin-left: 10px;margin-top: -7px">
    <span class="el-dropdown-link">
      <div>
        <el-avatar :size="45" :src="haslogin.avatar">
        </el-avatar>
      </div>
<!--      <el-icon class="el-icon&#45;&#45;right"><caret-bottom /></el-icon>-->
    </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item class="clearfix" @click="toperson">
              个人中心
            </el-dropdown-item>
            <el-dropdown-item v-if="haslogin.role == 'admin'" @click="toadmin" class="clearfix">
              后台管理
            </el-dropdown-item>
            <el-dropdown-item class="clearfix" @click="logout()">
              退出
            </el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
      <!--      用户登录弹出框-->
      <el-dialog v-model="dialogFormVisible" title="用户登录" @close="close1()">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
          <el-form-item label="邮箱账号" prop="email">
              <el-input v-model="ruleForm.email">
                <template #prefix>
                  <el-icon class="el-input__icon"><message /></el-icon>
                </template>
              </el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="ruleForm.password" show-password>
              <template #prefix>
                <el-icon class="el-input__icon"><lock /></el-icon>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="验证码" prop="code">
            <el-input type="code" v-model="ruleForm.code" style="width: 160px">
              <template #prefix>
                <el-icon class="el-input__icon"><SetUp /></el-icon>
              </template>
            </el-input>
            <el-button :disabled="canClick" @click="CountDown" style="margin-left: 10px">{{ getcode }}</el-button>
            <span style="margin-left: 55px;" @click="toregister">还没有账号？点击去注册</span>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="resetForm('ruleForm')">重置</el-button>
          <el-button type="primary" @click="submitForm('ruleForm')">登录</el-button>
        </div>
      </el-dialog>
      <!--      用户注册弹出框-->
      <el-dialog v-model="dialogFormVisible2" title="用户注册" @close="close1()">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
          <el-form-item label="邮箱账号" prop="email">
            <el-input v-model="ruleForm.email">
              <template #prefix>
                <el-icon class="el-input__icon"><message /></el-icon>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="ruleForm.password" show-password>
              <template #prefix>
                <el-icon class="el-input__icon"><lock /></el-icon>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="repassword">
            <el-input type="repassword" v-model="ruleForm.repassword" show-password>
              <template #prefix>
                <el-icon class="el-input__icon"><lock /></el-icon>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="验证码" prop="code">
            <el-input type="code" v-model="ruleForm.code" style="width: 160px">
              <template #prefix>
                <el-icon class="el-input__icon"><SetUp /></el-icon>
              </template>
            </el-input>
            <el-button :disabled="canClick" @click="CountDown" style="margin-left: 10px">{{ getcode }}</el-button>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="resetForm('ruleForm2')">重置</el-button>
          <el-button type="primary" @click="submitForm2('ruleForm2')">注册</el-button>
        </div>
      </el-dialog>
    </div>
  </div>

</template>

<script>
import {Search,EditPen,Bell,Message,Lock,SetUp} from "@element-plus/icons-vue";
import {ElLoading, ElNotification} from 'element-plus'
import {loading} from "@element-plus/icons-vue";
import websocketServer from "../websocket.js"
import {UserStore} from "@/store";
import {storeToRefs} from 'pinia'

export default {
  name: "Header",
  data(){
    var validatorEmail = (rule,value,callback) => {
      console.log("校验邮箱")
      if (value == ''){
        callback(new Error('邮箱不能为空！'))
      }else if (!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value)){
          callback(new Error('邮箱格式不正确请重新输入'))
      }else {
        callback()
      }
    }
    var validatorPassword = (rule,value,callback) => {
      console.log("校验密码合法性")
      if (value == ''){
        callback(new Error('密码不能为空'))
      }else if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/.test(value)){
        callback(new Error('至少8个字符，，至少有1个小写字母和1个数字,不能包含特殊字符（非数字字母）'))
      }else {
        callback()
      }
    }
    var validatorRepassword = (rule,value,callback) => {
        console.log("校验两次密码是否一致")
      if (this.ruleForm.password != value){
        callback(new Error('两次密码不一致！请检查'))
      }else if (this.ruleForm.password == ''){
        callback(new Error('密码不能为空！'))
      }else {
        callback()
      }

    }
    var validatorCode = (rule,value,callback) => {
      console.log("检验验证码是否正确")
      console.log(value,"  ",this.code)
      console.log(value === this.code)
      if (value == ''){
        callback(new Error('验证码不能为空'))
      }else if (value !== this.code){
        console.log("===================")
        callback(new Error('验证码不正确，请检查！'))
      } else {
        callback()
      }
    }
    return{
/*      publicPath:process.env.BASE_URL,*/
      totalTime:60,
      getcode:'点击获取验证码',
      code:'',
      canClick:false,
      input:'',
      haslogin: this.userinfo(),
      dialogFormVisible:false,
      dialogFormVisible2:false,
      formLabelWidth: '120px',
      ruleForm: {
        email: '',
        password:'',
        repassword:'',
        code:'',
        websocket:null
      },
      rules: {
        email: [
          {required:true,validator: validatorEmail, trigger: 'blur' },
        ],
        password: [
          {required:true,validator: validatorPassword, trigger: 'blur'}
        ],
        repassword:[
          {required:true,validator: validatorRepassword, trigger: 'blur'}
        ],
        code:[
          {required:true,validator:validatorCode,trigger:'blur'}
        ]
      }
    }
  },
  props:['ChangeArticleList'],
  methods:{
    userinfo(){
      const userStore = UserStore()
      const { userinfo } = storeToRefs(userStore);
      return userinfo
    },
    search(){
      const Loading = ElLoading.service({
        lock:true,
        text:'拼命加载中',
        spinner:loading,
        background: 'rgba(0, 0, 0, 0.7)'
      })
      this.$router.push("/article")
      this.axios.get('/article',{
        params:{
          title:this.input
        }
      }).then(response => {
        this.$emit("ChangeArticleList",response.data.data.records)
        this.$nextTick(() => {
          console.log("关闭加载")
          setTimeout(() => {
            Loading.close()
          },1000)
        })
      })
    },
    article(){
      this.$userStore.hover = 0
      const Loading = ElLoading.service({
        lock:true,
        text:'拼命加载中',
        spinner:loading,
        background: 'rgba(0, 0, 0, 0.7)'
      })
      this.$userStore.setCategory('article')
      this.$router.push("/article")
      this.axios.get('/article',{
      }).then(response => {
        this.$emit("ChangeArticleList",response.data.data.records)
        this.$nextTick(() => {
          console.log("关闭加载")
          setTimeout(() => {
            Loading.close()
          },1000)
        })
      })
    },
    answer(){
      this.$userStore.hover = 1
      const Loading = ElLoading.service({
        lock:true,
        text:'拼命加载中',
        spinner:loading,
        background: 'rgba(0, 0, 0, 0.7)'
      })
      this.$router.push("/article")
      this.$userStore.setCategory('answer')
      this.axios.get('article',{
        params:{
          category:'answer',
        }
      }).then(response => {
        this.$nextTick(() => {
          console.log("关闭加载")
          setTimeout(() => {
            Loading.close()
          },1000)

        })
        this.$emit("ChangeArticleList",response.data.data.records)
      })
    },
    book(){
      this.$userStore.hover=2
      this.$router.push("/bookshop")

    },
    toadmin(){
      this.$router.push({
        name:"AdminIndex"
      })
    },
    toperson(){
      this.$router.push({
        name:'Person',
        params:{
          userId:this.$userStore.userinfo.id
        }
      })
    },
    tologin(){
      this.dialogFormVisible = true
    },
    toregister(){
        this.dialogFormVisible2 = true
        this.dialogFormVisible = false
    },
    logout(){
      this.axios.get("/user/logout",{
        headers:{
          "Authorization": sessionStorage.getItem("token")
        }
      }).then(response => {
        this.$userStore.setUserInfo(null)
        this.$userStore.setToken(null)
        this.$message.success("退出成功")
        this.$router.push("/article")
      })

    },
    close1(){
      if (this.haslogin == null && this.dialogFormVisible2 == false){
        this.$message.warning("用户取消了登录")
      }
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.axios.post("/user/login",{
            email:this.ruleForm.email,
            password:this.ruleForm.password
          }).then(response => {
                console.log(response)
                this.$message({
                  type:"success",
                  duration: 1500,
                  message:'登录成功，欢迎来到No404开发者论坛'
                })
                //将返回的用户信息和jwt存储在pinia的state中给组件共享
                this.$userStore.setUserInfo(response.data.data)
                this.$userStore.setToken(response.headers['authorization'])
                this.dialogFormVisible = false
                //查询未读消息
                this.axios.get("message/selectUnread",{
                  params:{
                    uid:this.$userStore.userinfo.id
                  }
                }).then(res => {
                  this.$userStore.setMessageNumber(res.data.data)
                  if (res.data.data != 0){
                    ElNotification({
                      title: 'Success',
                      message: '有未读的消息，请查看',
                      type: 'success',
                      duration:2000
                    })
                  }
                })
                //查询用户成就
                this.axios.get("/article/achievement",{
                  headers:{
                    Authorization:this.$userStore.token
                  },
                  params:{
                    authorId:this.$userStore.userinfo.id
                  }
                }).then(response => {
                  console.log(response.data.data)
                  this.$userStore.setAchievement(response.data.data)
                })
                websocketServer.connection(response.data.data.id)
                // location.href = "http://localhost:8080"
              },
              error => {
                console.log(error)
              }
          )
        } else {
          return false;
        }
      });
    },
    submitForm2(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.axios.post("/user/register",{
            email:this.ruleForm.email,
            password:this.ruleForm.password
          }).then(response => {
              console.log(response)
              this.$message({
                type:"success",
                duration: 1500,
                message:'注册成功,跳转登录'
              })
              console.log(response)
              this.$userStore.setUserInfo(response.data.data)
              console.log(response.headers['authorization'])
              this.$userStore.setToken(response.headers['authorization'])
                this.dialogFormVisible2 = false
                websocketServer.connection(response.data.data.id)
          },
          error => {
            console.log(error)
          }
          )
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    CountDown(){

      // if (!this.canClick) return  //改动的是这两行代码
      this.canClick = true
      //发送验证码
      if (this.ruleForm.email == ''){
        this.$message.warning('请先输入邮箱！')
      }else {
        this.axios.post("/mail/getCheckCode",{
          email:this.ruleForm.email,
          password:this.ruleForm.password
        }).then(response => {
          console.log('验证码为===>'+response.data.data)
          this.code = response.data.data
        })
      }
      this.getcode = this.totalTime + 's后重新发送'
      let clock = window.setInterval(() => {
        this.totalTime--
        this.getcode = this.totalTime + 's后重新发送'
        if (this.totalTime < 0) {
          window.clearInterval(clock)
          this.getcode = '重新发送验证码'
          this.totalTime = 60
          this.canClick = false  //这里重新开启
        }
      },1000)
    },
    post(){
      this.$router.push("/article/post")
    }
    },
  components:{
    Search,EditPen,Bell,Message,Lock,SetUp
  },
  beforeCreate() {
    console.log("0第一次登录时候，头像链接"+this.haslogin)
  },
  // beforeUnmount () {
  //   this.onbeforeunload()
  // },
  beforeRouteLeave(){
    console.log("离开路由----》")
    websocketServer.closeWebSocket()
  }

}
</script>

<style scoped>

.img1{
  width: 200px;
  margin-left: 180px;
}

.el-link {
  margin-right: 20px;
  font-size: 20px;
  /*margin-left: 20px;*/
}
.demo-input-size{
  width: 300px;
  margin-left: 840px;
  margin-top: -30px;
  position:relative;
}
.demo-button-size{
  margin-left: 1050px;
  margin-top: -37px;
  position:relative;
}
</style>
