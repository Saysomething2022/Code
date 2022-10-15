<template>
  <div class="common-layout">
    <el-container>
      <el-header class="header1">
        <Header/>
      </el-header>
      <el-main>
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
          <el-form-item label="文章标题" prop="title">
            <el-input v-model="ruleForm.title"></el-input>
          </el-form-item>
          <el-form-item label="文章内容" prop="content" style="text-align: left">
            <md-editor-v3 v-model="ruleForm.content" @onHtmlChanged="saveHtml" @onUploadImg="onUploadImg"/>
          </el-form-item>
          <el-form-item>
            <span>文章类型：</span>
            <el-select v-model="ruleForm.typeId" filterable placeholder="Select">
              <el-option
                  v-for="type in typeList"
                  :key="type.id"
                  :label="type.type"
                  :value="type.id"
              >
              </el-option>
            </el-select>
            <span style="margin-left: 15px">文章大类：</span>
            <el-select v-model="ruleForm.category" filterable placeholder="Select">
              <el-option label="文章" value="article"></el-option>
              <el-option label="问答" value="answer"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
            <el-button @click="resetForm('ruleForm')">重置</el-button>
          </el-form-item>
        </el-form>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import Header from "@/components/Header";
export default {
  name: "AddArticle",
  components: {Header},
  data(){
    return{
      ruleForm: {
        authorId:'',
        title: '',
        content: '',
        typeId:'',
        category:''
      },
      typeList:[],
      rules: {
        title: [
          { required: true, message: '请输入文章标题', trigger: 'blur' },
          { min: 10, max: 100, message: '长度在 10 到 100 个字符', trigger: 'blur' }
        ],
        content: [
          { required: true, message: '请输入内容', trigger: 'blur' },
        ],
      }
    }
  },
  methods: {
    saveHtml(h){
      console.log(h)
    },

    onUploadImg(files,callback) {
      var url = []
      const form = new FormData();
      form.append('file', files[0]);
      this.axios.post("user/uploadAvatar",form,{
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      }).then(res => {
        url.push(res.data.data)
        callback(url)
      })
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          var userinfo = JSON.parse(sessionStorage.getItem("userinfo"))

          this.ruleForm.authorId =userinfo.id
          this.axios.post("/article/post",this.ruleForm,{
            headers:{
              "Authorization": sessionStorage.getItem("token")
            },
          }).then(response => {
            this.$message.success("发布成功！")
            this.$router.push("/article")
          })
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  },
  beforeCreate() {
    this.axios.get("/article/typeList").then(response => {
      this.typeList = response.data.data
    })
  },
  created() {
    if (this.$route.params.id != null){
      this.axios.get("/article/articleDetail",{
        params:{
          articleId:this.$route.params.id
        }
      }).then(response =>{
          this.ruleForm = response.data.data
      })
    }
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
  line-height: 500px;
  margin-left: 160px;
  margin-right: 15px;
}
.common-layout .el-footer {
  background-color: #b3c0d1;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 60px;
}
.common-layout .el-footer {
  line-height: 60px;
  background-color: #ffffff;
}
</style>
