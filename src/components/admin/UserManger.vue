<template>
  <el-container>
    <el-header>
      <div>
        <el-breadcrumb separator="/">
          <el-breadcrumb-item :to="{ path: '/' }">用户管理</el-breadcrumb-item>
          <el-breadcrumb-item>用户管理</el-breadcrumb-item>
        </el-breadcrumb>
      </div>
    </el-header>
    <el-header>
      <div class="left-panel">
        <el-button type="danger" :disabled="selection.length==0" @click="batch_del"><el-icon><delete-filled /></el-icon></el-button>
      </div>
      <div class="right-panel">
        <div style="float: left">
          <el-input v-model="search.keyword" placeholder="搜索用户..." clearable></el-input>
        </div>
        <div style="float: left;margin-left: 10px">
          <el-button type="primary"><el-icon><Search/></el-icon></el-button>
        </div>
      </div>
    </el-header>
    <el-main class="nopadding">
      <el-table ref="table" :data="userList" height="400" @selection-change="selectChange">
        <el-table-column type="selection" width="50"></el-table-column>
        <el-table-column label="编号" fixed prop="id" width="170" show-overflow-tooltip></el-table-column>
        <el-table-column label="邮箱" prop="email" width="170"></el-table-column>
        <el-table-column label="头像" prop="avatar" width="150">
          <template v-slot="scope">
            <el-avatar :src="scope.row.avatar"></el-avatar>
          </template>
        </el-table-column>
        <el-table-column label="昵称" prop="nickName" width="150"></el-table-column>
        <el-table-column label="个性签名" prop="describe" width="150"></el-table-column>
        <el-table-column label="身份" prop="role" width="150"
                         :filters="[{ text: '用户', value: 'user' },{text:'管理员',value: 'admin'}]"
                         :filter-method="filterRoleTag">
          <template v-slot="scope">
            <el-tag v-if="scope.row.role === 'user'" type="info">用户</el-tag>
            <el-tag v-if="scope.row.role === 'admin'">管理员</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="状态" prop="status" width="150"
                         :filters="[{ text: '正常', value: 0 },{text:'禁用',value: 1}]"
                         :filter-method="filterTag"
        >
          <template v-slot="scope">
            <el-tag v-if="scope.row.status === 0" type="success">正常</el-tag>
            <el-tag v-if="scope.row.status === 1" type="danger">禁用</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="创建时间" prop="createTime" width="150"></el-table-column>
        <el-table-column label="更新时间" prop="updateTime" width="150"></el-table-column>
        <el-table-column label="操作" fixed="right" align="center" width="250">
          <template #default="scope">
            <el-button type="text" size="small" @click="table_view(scope.row, scope.$index)">查看</el-button>
            <el-button type="text" v-if="scope.row.role === 'user'" size="small" @click="table_role(scope.row, 2)">设为管理员</el-button>
            <el-button type="text" v-if="scope.row.role === 'admin'" size="small" @click="table_role(scope.row, 1)">取消管理员</el-button>
            <el-popconfirm title="确定删除吗？" @confirm="table_del(scope.row, scope.$index)">
              <template #reference>
                <el-button type="text" size="small">删除</el-button>
              </template>
            </el-popconfirm>
            <el-button v-if="scope.row.status == 0" type="danger" size="small" @click="table_disable(scope.row,1)">禁用</el-button>
            <el-button v-if="scope.row.status == 1" type="danger" size="small" @click="table_disable(scope.row,0)">解除禁用</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-main>
  </el-container>
  <el-dialog
      v-model="dialogVisible"
      width="70%"
      :before-close="handleClose"
      ref="noticeDialog"
      destroy-on-close
  >
    <template #title>
      <h3 style="margin-left: -880px" v-if="saveMode == 'show'">查看用户</h3>
    </template>
    <el-form :model="userForm" :rules="rules" disabled ref="userForm" label-width="100px" class="demo-userForm">
      <el-form-item label="id" prop="id">
        <el-input v-model="userForm.id"></el-input>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="userForm.email"></el-input>
      </el-form-item>
      <el-form-item label="昵称" prop="nickName">
        <el-input v-model="userForm.nickName"></el-input>
      </el-form-item>
      <el-form-item label="个性签名" prop="describe">
        <el-input v-model="userForm.describe"></el-input>
      </el-form-item>
      <el-form-item label="身份" prop="role">
        <el-input v-if="userForm.role === 'user'" model-value="用户"></el-input>
        <el-input v-if="userForm.role === 'admin'" model-value="管理员"></el-input>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-input v-if="userForm.status === 0" model-value="正常"></el-input>
        <el-input v-if="userForm.status === 1" model-value="禁用"></el-input>
      </el-form-item>
      <el-form-item label="创建时间" prop="createTime">
        <el-input v-model="userForm.createTime"></el-input>
      </el-form-item>
    </el-form>
    <template #footer v-if="saveMode != 'show'">
      <el-button type="primary" @click="submitForm('userForm')">提交</el-button>
      <el-button @click="resetForm('userForm')">重置</el-button>
    </template>
  </el-dialog>
</template>

<script>
import {Search,DeleteFilled} from "@element-plus/icons-vue";
export default {
  name: "UserManger",
  components: {
    Search,
    DeleteFilled,
  },
  data() {
    return {
      userList:[],
      selection: [],
      userForm:{
        id:'',
        email:'',
        nickName:'',
        describe:'',
        role:'',
        status:'',
        createTime:''
      },
      isEdit:false,
      search: {
        keyword: null
      },
      saveDialogVisible: false,
      dialogVisible:false,
      saveMode: 'add',
      titleMap: {
        add: "新增",
        edit: "编辑",
        show: "查看"
      },
      isSaveing: false,
      value:'',
      rules: {
        title: [
          { required: true, message: '请输入文章标题', trigger: 'blur' },
          { min: 1, max: 100, message: '长度在 1 到 100 个字符', trigger: 'blur' }
        ],
        content: [
          { required: true, message: '请输入内容', trigger: 'blur' },
        ],
      }
    }
  },
  methods:{
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.axios.post("/notice/post",this.userForm,{
            headers:{
              "Authorization": sessionStorage.getItem("token")
            },
          }).then(response => {
            console.log(response)
            this.$message.success("发布成功！")
            this.userList = response.data.data
            this.dialogVisible = false
          })
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(() => {
            done();
          })
          .catch(() => {});
    },
    table_disable(row,value){
      this.axios.get("admin/disableUser",{
        headers:{
          "Authorization": sessionStorage.getItem("token"),
        },
        params:{
          id:row.id,
          status:value
        }
      }).then(res => {
        this.userList = res.data.data
        this.$message.success("操作成功")
      })
    },
    //添加
    add() {
      this.saveMode = 'add';
      this.saveDialogVisible = true;
    },
    //查看
    table_view(row) {
      this.saveMode = 'show';
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.userForm = row
      })

    },
    //修改用户权限
    table_role(row,roleId) {
        this.axios.get("admin/updateRole",{
          headers:{
            "Authorization": sessionStorage.getItem("token"),
          },
          params:{
            id:row.id,
            roleId:roleId
          }
        }).then(res => {
          this.userList = res.data.data
          this.$message.success("操作成功")
        })
    },
    //删除
    async table_del(row) {
      this.axios.get("admin/deleteUser",{
        headers:{
          "Authorization": sessionStorage.getItem("token"),
        },
        params:{
          id:row.id
        }
      }).then(res => {
        this.userList = res.data.data
        this.$message.success("删除成功")
      })
    },
    //批量删除
    async batch_del() {
      this.$confirm(`确定删除选中的 ${this.selection.length} 项吗？如果删除项中含有子集将会被一并删除`, '提示', {
        type: 'warning'
      }).then(() => {
        const loading = this.$loading();
        this.axios.post("admin/batchDelUser",{
              userList:this.selection
            },
            {
              headers:{
                "Authorization": sessionStorage.getItem("token"),
                "Content-Type": 'application/json'
              },
            }).then(res => {
          this.userList = res.data.data
        })
        loading.close();
        this.$message.success("操作成功")
      }).catch(() => {

      })
    },
    selectChange(select){
      this.selection = select
    },
    clearFilter() {
      this.$refs.table.clearFilter();
    },
    filterTag(value,row){
      console.log(value)
      console.log(row)
      return row.status === value
    },
    filterRoleTag(value,row){
      return row.role === value
    },
    //搜索
    upsearch() {

    },
    //增加文章类型
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  },
  beforeCreate() {
    this.axios.get("/admin/selectALLUser",{
      headers:{
        "Authorization": sessionStorage.getItem("token")
      },
    }).then(response => {
      this.userList = response.data.data
    })
  }
}
</script>

<style scoped>
.left-panel{
  margin-right: auto;
}
.right-panel{
  /*position: absolute;*/
  /*padding-right: 0px;*/
  /*居中*/
}
.el-header{
  background-color: #ffffff;
  color: #333;
  display: flex;
  align-items: center;
  position: relative;
  /*justify-content:right;*/
}
.el-main {
  background-color: #ffffff;
  color: #333;
  height: 400px;
  /*text-align: center;*/
  /*line-height: 160px;*/
}
.el-container{
  height: 600px;
}
</style>
