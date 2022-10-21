<template>
    <div>
      <el-dialog v-model="dialogFormVisible" title="用户信息修改" draggable @close="beforeClose">
        <el-form :model="form">
          <el-form-item label="头像" :label-width="formLabelWidth">
            <el-upload
                v-if="process.env.NODE_ENV == 'production'"
                class="avatar-uploader"
                action="https://bbs-backend.forgetive.org/user/uploadAvatar"
                :show-file-list="false"
                multiple
                :on-success="handleAvatarSuccess"
                :before-upload="beforeAvatarUpload">
              <img v-if="form.avatar" :src="form.avatar" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
            <el-upload
                v-else
                class="avatar-uploader"
                action="http://localhost:8888/user/uploadAvatar"
                :show-file-list="false"
                multiple
                :on-success="handleAvatarSuccess"
                :before-upload="beforeAvatarUpload">
              <img v-if="form.avatar" :src="form.avatar" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </el-form-item>
          <el-form-item label="邮箱地址" :label-width="formLabelWidth">
            <el-input v-model="form.email" autocomplete="off" disabled/>
          </el-form-item>
          <el-form-item label="昵称" :label-width="formLabelWidth">
            <el-input v-model="form.nickName" autocomplete="off" value/>
          </el-form-item>
          <el-form-item label="个性签名" :label-width="formLabelWidth">
            <el-input v-model="form.describe" autocomplete="off" value/>
          </el-form-item>
        </el-form>
        <template #footer>
      <span class="dialog-footer">
        <el-button @click="beforeClose">
          取消
        </el-button>
        <el-button type="primary" @click="change">
          提交
        </el-button>
      </span>
        </template>
      </el-dialog>
    </div>
</template>

<script>
export default {
  name: "PersonChange",
  data(){
    return{
      form: {
        id:'',
        email: '',
        nickName: '',
        avatar: '',
        password: '',
        describe:''
      },
      formLabelWidth: '120px'
    }
  },
  methods:{
    handleAvatarSuccess(res, file) {
        console.log(res)
      this.form.avatar = res.data
    },
    beforeAvatarUpload(file) {
      console.log("==============")
      console.log(file.name)
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },
    change(){
      this.axios.post("/user/changePerson",this.form,{
        headers:{
          "Authorization": sessionStorage.getItem("token")
        }
      }).then(response => {
        console.log(response)
        this.$message.success("修改成功！")
        sessionStorage.removeItem("token")
        sessionStorage.removeItem("userinfo")
        if (process.env.NODE_ENV == "production") {
          location.href = "https://bbs.forgetive.org"
        } else {
          location.href = "http://localhost:8080"
        }
      })
      this.$emit("change",false)
    },
    beforeClose(){
      console.log("===========")
      this.$emit("change",false)
    }
  },
  components:{
  },
  props:['dialogFormVisible'],
  created() {
    this.form = this.$userStore.userinfo
    console.log(this.form.email)
  }
}
</script>

<style scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
