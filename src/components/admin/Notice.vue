<template>
  <el-container>
    <el-header>
      <div>
        <el-breadcrumb separator="/">
          <el-breadcrumb-item :to="{ path: '/' }">公告管理</el-breadcrumb-item>
          <el-breadcrumb-item>公告查看</el-breadcrumb-item>
        </el-breadcrumb>
      </div>
    </el-header>
    <el-header>
      <div class="left-panel">
        <el-button type="danger" :disabled="selection.length==0" @click="batch_del"><el-icon><delete-filled /></el-icon></el-button>
        <el-button type="primary"  @click="add"><el-icon><plus /></el-icon></el-button>
      </div>
      <div class="right-panel">
        <el-form :inline="true" :model="noticeSearch" style="height: 32px">
          <el-form-item label="标题" style="">
            <el-input class="right-panel-internal"  v-model="noticeSearch.title" placeholder="搜索标题..." clearable></el-input>
          </el-form-item>
          <el-form-item label="操作者id">
            <el-input class="right-panel-internal" v-model="noticeSearch.creatorId" placeholder="搜索操作者id..." clearable></el-input>
          </el-form-item>
          <el-form-item label="时间">
            <el-date-picker
                v-model="noticeSearch.TimeValue"
                type="datetimerange"
                range-separator="至"
                start-placeholder="开始日期"
                end-placeholder="结束日期"
                format="YYYY-MM-DD hh:mm:ss"
                value-format="YYYY-MM-DD:hh:mm:ss"
                unlink-panels="true"
                :disabled-date="disabledDate"

            >
            </el-date-picker>
          </el-form-item>
          <el-form-item>
            <el-button class="right-panel-internal" type="primary" @click="upsearch"><el-icon><Search/></el-icon></el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-header>
    <el-main class="nopadding">
      <el-table ref="table" :data="noticeList" height="400" @selection-change="selectChange">
        <el-table-column type="selection" width="50"></el-table-column>
        <el-table-column label="编号" fixed prop="id" width="100"></el-table-column>
        <el-table-column label="标题" prop="title" width="150"></el-table-column>
        <el-table-column label="内容" prop="content" width="150" show-overflow-tooltip></el-table-column>
        <el-table-column label="操作人id" prop="creatorId" width="150"></el-table-column>
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
        <el-table-column label="操作" fixed="right" align="center" width="220">
          <template #default="scope">
            <el-button type="text" size="small" @click="table_view(scope.row, scope.$index)">查看</el-button>
            <el-button type="text" size="small" @click="table_edit(scope.row, scope.$index)">编辑</el-button>
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
      <h3 style="margin-left: -1000px" v-if="saveMode == 'add'">添加公告</h3>
      <h3 style="margin-left: -900px" v-if="saveMode == 'show'">查看公告</h3>
      <h3 style="margin-left: -900px" v-if="saveMode == 'edit'">修改公告</h3>
    </template>
    <el-form :model="NoticeForm" :rules="rules" ref="NoticeForm" label-width="100px" class="demo-NoticeForm">
      <el-form-item label="公告标题" prop="title">
        <el-input v-model="NoticeForm.title" :disabled="saveMode == 'show'"></el-input>
      </el-form-item>
      <el-form-item label="公告内容" prop="content" style="text-align: left">
        <md-editor-v3 :preview-only="saveMode == 'show'" v-model="NoticeForm.content"/>
      </el-form-item>
      <el-form-item label="操作人id" prop="title" v-if="saveMode == 'show'">
        <el-input v-model="NoticeForm.creatorId" :disabled="saveMode == 'show'"></el-input>
      </el-form-item>
    </el-form>
    <template #footer v-if="saveMode != 'show'">
      <el-button type="primary" @click="submitForm('NoticeForm')">提交</el-button>
      <el-button @click="resetForm('NoticeForm')">重置</el-button>
    </template>
  </el-dialog>
</template>

<script>
import {Search,DeleteFilled,Plus} from "@element-plus/icons-vue";
export default {
  name: "Notice",
  components: {
    Search,
    DeleteFilled,
    Plus
  },
  data() {
    return {
      noticeList:[],
      selection: [],
      NoticeForm:{
        id:'',
        title:'',
        content:'',
        creatorId:this.$userStore.userinfo.id,
      },
      isEdit:false,
      noticeSearch: {
          title:null,
          creatorId:null,
          TimeValue:[]
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
    disabledDate(time) {
      return time.getTime() > Date.now();
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.axios.post("/notice/post",this.NoticeForm,{
            headers:{
              "Authorization": sessionStorage.getItem("token")
            },
          }).then(response => {
            console.log(response)
            this.$message.success("发布成功！")
            this.noticeList = response.data.data
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
      this.axios.get("notice/disableNotice",{
        headers:{
          "Authorization": sessionStorage.getItem("token"),
        },
        params:{
          id:row.id,
          status:value
        }
      }).then(res => {
        this.noticeList = res.data.data
        this.$message.success("操作成功")
      })
    },
    //添加
    add() {
      this.saveMode = 'add';
      this.dialogVisible = true;
    },
    //查看
    table_view(row) {
      this.saveMode = 'show';
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.NoticeForm.id = row.id
        this.NoticeForm.title = row.title
        this.NoticeForm.content = row.content
      })

    },
    //编辑
    table_edit(row) {
      this.saveMode = 'edit';
      this.isEdit = true
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.NoticeForm.id = row.id
        this.NoticeForm.title = row.title
        this.NoticeForm.content = row.content
      })

    },
    //删除
    async table_del(row) {
      this.axios.get("notice/deleteNotice",{
        headers:{
          "Authorization": sessionStorage.getItem("token"),
        },
        params:{
          id:row.id
        }
      }).then(res => {
        this.noticeList = res.data.data
        this.$message.success("删除成功")
      })
    },
    //批量删除
    async batch_del() {
      this.$confirm(`确定删除选中的 ${this.selection.length} 项吗？如果删除项中含有子集将会被一并删除`, '提示', {
        type: 'warning'
      }).then(() => {
        const loading = this.$loading();
        this.axios.post("notice/batchDelNotice",{
              noticeList:this.selection
            },
            {
              headers:{
                "Authorization": sessionStorage.getItem("token"),
                "Content-Type": 'application/json'
              },
            }).then(res => {
          this.noticeList = res.data.data
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
      this.axios.get("/notice/selectALLNotice",{
            headers:{
              "Authorization": sessionStorage.getItem("token"),
            },
            params:{
              title:this.noticeSearch.title,
              creatorId:this.noticeSearch.creatorId,
              startTime:this.noticeSearch.TimeValue[0],
              endTime:this.noticeSearch.TimeValue[1]
            }
          },
      ).then(res => {
        this.noticeList = res.data.data
      })
    },
    //增加文章类型
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  },
  beforeCreate() {
    this.axios.get("/notice/selectALLNotice",{
      headers:{
        "Authorization": sessionStorage.getItem("token")
      },
    }).then(response => {
      this.noticeList = response.data.data
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
  width: auto;
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
</style>
