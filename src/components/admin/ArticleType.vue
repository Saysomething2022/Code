<template>
    <el-container>
      <el-header>
        <div>
          <el-breadcrumb separator="/">
            <el-breadcrumb-item :to="{ path: '/' }">帖子管理</el-breadcrumb-item>
            <el-breadcrumb-item>帖子类型管理</el-breadcrumb-item>
          </el-breadcrumb>
        </div>
      </el-header>
      <el-header>
        <div class="left-panel">
          <el-button type="danger" :disabled="selection.length==0" @click="batch_del"><el-icon><delete-filled /></el-icon></el-button>
          <el-button type="primary"  @click="dialogVisible = true"><el-icon><plus /></el-icon></el-button>
        </div>
        <div class="right-panel">
          <el-form :inline="true" :model="ArticleTypeSearch" style="height: 32px">
            <el-form-item label="类型" style="">
              <el-input class="right-panel-internal"  v-model="ArticleTypeSearch.type" placeholder="搜索类型..." clearable></el-input>
            </el-form-item>
            <el-form-item label="操作人id">
              <el-input class="right-panel-internal" v-model="ArticleTypeSearch.creatorId" placeholder="搜索操作人id..." clearable></el-input>
            </el-form-item>
            <el-form-item label="时间">
              <el-date-picker
                  v-model="ArticleTypeSearch.TimeValue"
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
        <el-table ref="table" :data="typeList" height="400" @selection-change="selectChange">
          <el-table-column type="selection" width="50"></el-table-column>
          <el-table-column label="编号" fixed prop="id" width="100"></el-table-column>
          <el-table-column label="类型" prop="type" width="150"></el-table-column>
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
          <el-table-column label="操作" fixed="right" align="center" width="180">
            <template #default="scope">
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

    <el-dialog :title="titleMap[saveMode]" v-model="saveDialogVisible" :width="500" destroy-on-close>
      <save-dialog ref="saveDialog" :mode="saveMode"></save-dialog>
      <template #footer>
        <el-select size="mini" v-model="value" placeholder="请选择">
          <el-option value="0" label="审核通过">审核通过</el-option>
          <el-option value="2" label="审核不通过">审核不通过</el-option>
        </el-select>
        <el-button style="margin-left: 10px"  type="primary" @click="saveForm()" :loading="isSaveing">提交</el-button>
      </template>
    </el-dialog>

    <el-dialog
        v-model="dialogVisible"
        width="30%"
        :before-close="handleClose"
    >
      <template #title>
        <h3 style="margin-left: -300px">添加类型</h3>
      </template>
      <div style="margin-left: -100px;line-height: 10px">
        <span>类型名称</span>
        <el-input style="margin-left: 10px;width: 210px" v-model="typeform.type"></el-input>
      </div>
      <template #footer>
        <el-button style="margin-left:10px" type="primary" @click="addType">确 定</el-button>
      </template>
    </el-dialog>
</template>
<script>
import saveDialog from "./save"
import {Search,DeleteFilled,Plus} from "@element-plus/icons-vue";
export default {
  name: "ArticleType",
  components: {
    Search,
    DeleteFilled,
    saveDialog,
    Plus
  },
  data() {
    return {
      typeList:[],
      selection: [],
      typeform:{
        type:'',
        creatorId:this.$userStore.userinfo.id
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
      ArticleTypeSearch: {
        type:null,
        creatorId:null,
        TimeValue:[],
      },
    }
  },
  methods:{
    disabledDate(time) {
      return time.getTime() > Date.now();
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(() => {
            done();
          })
          .catch(() => {});
    },
    table_disable(row,value){
        this.axios.get("audit/disableArticleType",{
          headers:{
            "Authorization": sessionStorage.getItem("token"),
          },
          params:{
            id:row.id,
            status:value
          }
        }).then(res => {
          this.typeList = res.data.data
          this.$message.success("操作成功")
        })
    },
    //添加
    add() {
      this.saveMode = 'add';
      this.saveDialogVisible = true;
    },
    //编辑
    table_edit(row) {
      this.saveMode = 'edit';
      this.saveDialogVisible = true;
      this.$nextTick(() => {
        //这里应该再次根据ID查询详情接口
        this.$refs.saveDialog.setData(row)
      })

    },
    //删除
    async table_del(row, index) {
      this.axios.get("audit/deleteArticleType",{
        headers:{
          "Authorization": sessionStorage.getItem("token"),
        },
        params:{
          tid:row.id
        }
      }).then(res => {
        //重新查询文章
        this.axios.get("/article/typeList").then(response => {
          this.typeList = response.data.data
        })
        this.$message.success("删除成功")
      })
    },
    //批量删除
    async batch_del() {
      this.$confirm(`确定删除选中的 ${this.selection.length} 项吗？如果删除项中含有子集将会被一并删除`, '提示', {
        type: 'warning'
      }).then(() => {
        const loading = this.$loading();
        this.axios.post("audit/batchDelType",{
              delList:this.selection
            },
            {
              headers:{
                "Authorization": sessionStorage.getItem("token"),
                "Content-Type": 'application/json'
              },
            }).then(res => {
          this.typeList = res.data.data
        })
        loading.close();
        this.$message.success("操作成功")
      }).catch(() => {

      })
    },
    // 提交
    saveForm() {
      this.$refs.saveDialog.submit(async (formData) => {
        this.isSaveing = true;
        console.log(formData)

        this.isSaveing = false;
        this.axios.get("audit/ArticleAudit",{
          headers:{
            "Authorization": sessionStorage.getItem("token")
          },
          params:{
            articleId:formData.id,
            status:this.value
          }
        }).then(res => {
          //这里选择刷新整个表格 OR 插入/编辑现有表格数据
          console.log(res.data)
          this.typeList = res.data.data
          this.saveDialogVisible = false;
          this.$message.success("操作成功")
        })

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
      this.axios.get("/article/typeList",{
            headers:{
              "Authorization": sessionStorage.getItem("token")
            },
            params:{
              type:this.ArticleTypeSearch.type,
              creatorId:this.ArticleTypeSearch.creatorId,
              startTime:this.ArticleTypeSearch.TimeValue[0],
              endTime:this.ArticleTypeSearch.TimeValue[1]
            }
          },
      ).then(res => {
        this.typeList = res.data.data
      })
    },
    //增加文章类型
    addType(){
      if (this.typeform.type === ''){
        this.$message.warning("类型不能为空")
        return false
      }
      this.axios.get("audit/addType",{
        headers:{
          "Authorization": sessionStorage.getItem("token")
        },
        params:{
          type:this.typeform.type,
          creatorId:this.typeform.creatorId
        }
      }).then(res => {
        this.typeList = res.data.data
        this.$message.success("添加成功")
        this.dialogVisible = false
      })
    }
  },
  beforeCreate() {
    this.axios.get("/article/typeList").then(response => {
      this.typeList = response.data.data
      console.log(this.typeList)
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
</style>
