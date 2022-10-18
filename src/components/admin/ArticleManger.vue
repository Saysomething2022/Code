<template>
  <el-container>
    <el-header>
      <div>
        <el-breadcrumb separator="/">
          <el-breadcrumb-item :to="{ path: '/' }">帖子管理</el-breadcrumb-item>
          <el-breadcrumb-item>帖子查看</el-breadcrumb-item>
        </el-breadcrumb>
      </div>
    </el-header>
    <el-header>
      <div class="left-panel">
        <el-button type="danger" :disabled="selection.length==0" @click="batch_del"><el-icon><delete-filled /></el-icon></el-button>
        <el-button type="primary" :disabled="selection.length==0" @click="dialogVisible = true"><el-icon><Coordinate /></el-icon></el-button>
      </div>
      <div class="right-panel">
          <el-form :inline="true" :model="ArticleSearch" style="height: 32px">
            <el-form-item label="作者" style="">
              <el-input class="right-panel-internal"  v-model="ArticleSearch.author" placeholder="搜索作者..." clearable></el-input>
            </el-form-item>
            <el-form-item label="文章内容">
              <el-input class="right-panel-internal" v-model="ArticleSearch.content" placeholder="搜索文章..." clearable></el-input>
            </el-form-item>
              <el-form-item label="时间">
                <el-date-picker
                    v-model="ArticleSearch.TimeValue"
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
      <el-table ref="table" :data="articleList" height="400" @selection-change="selectChange">
        <el-table-column type="selection" width="50"></el-table-column>
        <el-table-column label="编号" fixed prop="id" width="100"></el-table-column>
        <el-table-column label="标题" prop="title" width="150" show-overflow-tooltip="true"></el-table-column>
        <el-table-column label="内容" prop="content" width="150" show-overflow-tooltip="true"></el-table-column>
        <el-table-column label="类型" prop="category" width="150"
                         :filters="[{ text: '文章', value: 'article' },{text:'问答',value: 'answer'}]"
                         :filter-method="filterCategoryTag"
        ></el-table-column>
        <el-table-column label="作者id" prop="authorId" width="200" show-overflow-tooltip></el-table-column>
        <el-table-column label="作者昵称" prop="nickName" width="150"></el-table-column>
        <el-table-column label="状态" prop="status" width="150"
                         :filters="[{ text: '审核通过', value: 0 },{text:'待审核',value: 1},{text:'审核不通过',value: 2}]"
                         :filter-method="filterTag"
        >
          <template v-slot="scope">
            <el-tag v-if="scope.row.status === 0" type="success">审核通过</el-tag>
            <el-tag v-if="scope.row.status === 1" type="warning">待审核</el-tag>
            <el-tag v-if="scope.row.status === 2" type="danger">审核不通过</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="点赞数" prop="approves" width="150"></el-table-column>
        <el-table-column label="收藏数" prop="collections" width="150"></el-table-column>
        <el-table-column label="评论数" prop="comments" width="150"></el-table-column>
        <el-table-column label="创建时间" prop="createTime" width="150"></el-table-column>
        <el-table-column label="更新时间" prop="updateTime" width="150"></el-table-column>
        <el-table-column label="操作" fixed="right" align="center" width="150">
          <template #default="scope">
            <el-button type="text" size="small" @click="table_show(scope.row, scope.$index)">查看</el-button>
            <el-popconfirm title="确定删除吗？" @confirm="table_del(scope.row, scope.$index)">
              <template #reference>
                <el-button type="danger" size="small">删除</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </el-main>
  </el-container>

  <el-dialog v-model="saveDialogVisible" :width="500" destroy-on-close>
    <template #title>
      <h3 style="margin-left: -400px">查看</h3>
    </template>
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
      <h3 style="margin-left: -300px">批量审核</h3>
    </template>
    <div style="margin-left: -100px;line-height: 10px">
      <span>审核结果</span>
      <el-select style="margin-left: 10px" size="mini" v-model="value" placeholder="请选择">
        <el-option value="0" label="审核通过">审核通过</el-option>
        <el-option value="2" label="审核不通过">审核不通过</el-option>
      </el-select>
    </div>
    <template #footer>
      <el-button style="margin-left:10px" type="primary" @click="batch_aduit">确 定</el-button>
    </template>
  </el-dialog>

</template>

<script>
import saveDialog from "./save"
import {Search,DeleteFilled,Coordinate} from "@element-plus/icons-vue";
export default {
  name: 'ArticleManger',
  components: {
    Search,
    DeleteFilled,
    saveDialog,
    Coordinate
  },
  data() {
    return {
      articleList:[],
      selection: [],
      ArticleSearch: {
        author:'',
        content:'',
        TimeValue:[],
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
    }
  },
  methods: {
    disabledDate(time) {
      console.log(time.getTime())
      return time.getTime() > Date.now();
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(() => {
            done();
          })
          .catch(() => {});
    },
    //添加
    add() {
      this.saveMode = 'add';
      this.saveDialogVisible = true;
    },
    //查看
    table_show(row) {
      this.saveMode = 'show';
      this.saveDialogVisible = true;
      this.$nextTick(() => {
        //这里应该再次根据ID查询详情接口
        this.$refs.saveDialog.setData(row)
      })
    },
    //删除
    async table_del(row, index) {
      this.axios.get("article/deleteArticle",{
        headers:{
          "Authorization": sessionStorage.getItem("token"),
        },
        params:{
          articleId:row.id
        }
      }).then(res => {
        //重新查询文章
        this.axios.get("/article/selectALLArticle").then(response => {
          // console.log(response.data.data)
          this.articleList = response.data.data
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
        this.axios.post("audit/batchDel",{
          delList:this.selection
        },
      {
        headers:{
          "Authorization": sessionStorage.getItem("token"),
          "Content-Type": 'application/json'
          },
        }).then(res => {
          this.articleList = res.data.data
        })
        loading.close();
        this.$message.success("操作成功")
      }).catch(() => {

      })
    },
    //批量审核
    async batch_aduit() {
      console.log("当前选择的对象===》")
      console.log(JSON.stringify(this.selection))
      console.log(this.selection)
      console.log(typeof JSON.stringify(this.selection))
      this.axios.post("audit/batchAudit",{
          auditList:this.selection,
          status:this.value
      }, {
            headers:{
              "Authorization": sessionStorage.getItem("token"),
              "Content-Type": 'application/json'
            },
          }
      ,).then(res => {
        this.articleList = res.data.data
        this.dialogVisible = false
        this.$message.success("操作成功")
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
            status:this.value,
            userid:this.$userStore.userinfo.id
          }
        }).then(res => {
            //这里选择刷新整个表格 OR 插入/编辑现有表格数据
            console.log(res.data)
            this.articleList = res.data.data
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
    filterCategoryTag(value,row){
      return row.category === value
    },
    //搜索
    upsearch() {
      console.log(this.ArticleSearch)
      console.log(this.ArticleSearch.TimeValue[0])
      this.axios.get("/article/selectALLArticle",{
        headers:{
          "Authorization": sessionStorage.getItem("token")
        },
        params:{
          author:this.ArticleSearch.author,
          content:this.ArticleSearch.content,
          startTime:this.ArticleSearch.TimeValue[0],
          endTime:this.ArticleSearch.TimeValue[1]
        }
      },
      ).then(res => {
            this.articleList = res.data.data
      })
    }
  },
  beforeCreate() {
    this.axios.get("/article/selectALLArticle").then(response => {
      // console.log(response.data.data)
      this.articleList = response.data.data
      console.log(this.articleList)
    })
  }
}
</script>

<style scoped>

.right-panel-internal{
}
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
