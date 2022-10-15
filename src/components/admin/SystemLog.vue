<template>
  <el-container>
    <el-header>
      <div>
        <el-breadcrumb separator="/">
          <el-breadcrumb-item :to="{ path: '/' }">系统日志</el-breadcrumb-item>
          <el-breadcrumb-item>日志查看</el-breadcrumb-item>
        </el-breadcrumb>
      </div>
    </el-header>
    <el-header>
      <div class="left-panel">
        <el-button type="danger" :disabled="selection.length==0" @click="batch_del"><el-icon><delete-filled /></el-icon></el-button>
      </div>
      <div class="right-panel">
        <div style="float: left">
          <el-input v-model="search.keyword" placeholder="搜索日志..." clearable></el-input>
        </div>
        <div style="float: left;margin-left: 10px">
          <el-button type="primary"><el-icon><Search/></el-icon></el-button>
        </div>
      </div>
    </el-header>
    <el-main class="nopadding">
      <el-table ref="table" :data="systemList" height="400" @selection-change="selectChange" @row-click="table_view">
        <el-table-column type="selection" width="50"></el-table-column>
        <el-table-column label="编号" fixed prop="id" width="170" show-overflow-tooltip></el-table-column>
        <el-table-column label="用户id" prop="uid" width="170"></el-table-column>
        <el-table-column label="客户端ip" prop="ip" width="150"></el-table-column>
        <el-table-column label="请求路径" prop="url" width="150"></el-table-column>
        <el-table-column label="请求的方法详情" prop="methodName" width="150" show-overflow-tooltip></el-table-column>
        <el-table-column label="描述" prop="describe" width="150" show-overflow-tooltip></el-table-column>
        <el-table-column label="发生时间" prop="createTime" width="150"></el-table-column>
        <el-table-column label="操作" fixed="right" align="center" width="250">
          <template #default="scope">
            <el-popconfirm title="确定删除吗？" @confirm.stop="table_del(scope.row, scope.$index)">
              <template #reference>
                <el-button type="danger" @click.stop size="small">删除</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </el-main>
  </el-container>

  <el-drawer
      v-model="drawer"
      direction="rtl"
      :before-close="handleClose"
      size="40%"
  >
    <template #title>
      <h3 style="text-align: left">系统日志</h3>
    </template>
        <el-descriptions :column="1" border size="small" direction="horizontal" >
          <el-descriptions-item label="编号">{{systemForm.id}}</el-descriptions-item>
          <el-descriptions-item label="用户id">{{systemForm.uid}}</el-descriptions-item>
          <el-descriptions-item label="客户端ip">{{systemForm.ip}}</el-descriptions-item>
          <el-descriptions-item label="请求路径">{{systemForm.url}}</el-descriptions-item>
          <el-descriptions-item label="请求方法详情" min-width="200px">{{systemForm.methodName}}</el-descriptions-item>
          <el-descriptions-item label="描述">{{systemForm.describe}}</el-descriptions-item>
          <el-descriptions-item label="发生时间">{{systemForm.createTime}}</el-descriptions-item>
        </el-descriptions>
  </el-drawer>
</template>

<script>
import {Search,DeleteFilled} from "@element-plus/icons-vue";
export default {
  name: "SystemLog",
  components: {
    Search,
    DeleteFilled,
  },
  data() {
    return {
      systemList:[],
      selection: [],
      systemForm:{
        id:'',
        uid:'',
        ip:'',
        methodName:'',
        describe:'',
        url:'',
        createTime:'',
        updateTime:''
      },
      drawer:false,
      search: {
        keyword: null
      },
      value:'',
    }
  },
  methods:{
    handleClose(done) {
      done()
    },
    //查看
    table_view(row) {
      console.log("show")
      this.drawer = true
      this.$nextTick(() => {
        this.systemForm = row
      })

    },
    //删除
    async table_del(row) {
      console.log("del")
      this.axios.get("admin/deleteLog",{
        headers:{
          "Authorization": sessionStorage.getItem("token"),
        },
        params:{
          id:row.id
        }
      }).then(res => {
        this.systemList = res.data.data
        this.$message.success("删除成功")
      })
    },
    //批量删除
    async batch_del() {
      this.$confirm(`确定删除选中的 ${this.selection.length} 项吗？如果删除项中含有子集将会被一并删除`, '提示', {
        type: 'warning'
      }).then(() => {
        const loading = this.$loading();
        this.axios.post("admin/batchDelLog",{
              systemList:this.selection
            },
            {
              headers:{
                "Authorization": sessionStorage.getItem("token"),
                "Content-Type": 'application/json'
              },
            }).then(res => {
          this.systemList = res.data.data
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
    //搜索
    upsearch() {

    }
  },
  beforeCreate() {
    this.axios.get("/admin/selectAllLog",{
      headers:{
        "Authorization": sessionStorage.getItem("token")
      },
    }).then(response => {
      this.systemList = response.data.data
    })
  }
}
</script>

<style scoped>
.right-panel-search{
  width: 300px;
}
.left-panel{
  margin-right: auto;
}
.right-panel{
  /*position: absolute;*/
  /*padding-right: 0px;*/
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
.code {background: #848484;padding:15px;color: #fff;font-size: 12px;border-radius: 4px;}
</style>
