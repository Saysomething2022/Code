<template>
    <el-container>
      <el-header>
        <div>
          <el-breadcrumb separator="/">
            <el-breadcrumb-item :to="{ path: '/' }">消息管理</el-breadcrumb-item>
            <el-breadcrumb-item>消息查看</el-breadcrumb-item>
          </el-breadcrumb>
        </div>
      </el-header>
      <el-header>
        <div class="left-panel">
        </div>
        <div class="right-panel">
          <el-form :inline="true" :model="messageSearch" style="height: 32px">
            <el-form-item label="消息源id" style="">
              <el-input class="right-panel-internal"  v-model="messageSearch.oriId" placeholder="搜索源id..." clearable></el-input>
            </el-form-item>
            <el-form-item label="消息目标id">
              <el-input class="right-panel-internal" v-model="messageSearch.desId" placeholder="搜索目标id..." clearable></el-input>
            </el-form-item>
            <el-form-item label="时间">
              <el-date-picker
                  v-model="messageSearch.TimeValue"
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
        <el-table ref="table" :data="messageList" height="400" @selection-change="selectChange">
          <el-table-column type="selection" width="50"></el-table-column>
          <el-table-column label="编号" fixed prop="id" width="150"></el-table-column>
          <el-table-column label="消息源用户id" prop="oriId" width="250" show-overflow-tooltip="true"></el-table-column>
          <el-table-column label="消息目标用户id" prop="desId" width="300" show-overflow-tooltip="true"></el-table-column>
          <el-table-column label="消息类型"
                           prop="mesType"
                           width="200"
                           :filters="[{text:'普通',value:0},{text:'官方',value:1}]"
                           :filter-method="filterMesType"
          >
            <template v-slot="scope">
              <el-tag v-if="scope.row.mesType === 0" type="info">普通</el-tag>
              <el-tag v-if="scope.row.mesType === 1" type="primary">官方</el-tag>
            </template>
          </el-table-column>
          <el-table-column label="消息内容" prop="content" width="150" show-overflow-tooltip="true"></el-table-column>
          <el-table-column label="状态" prop="status" width="150"
                           :filters="[{ text: '未读', value: 0 },{text:'已读',value: 1}]"
                           :filter-method="filterTag"
          >
            <template v-slot="scope">
              <el-tag v-if="scope.row.status === 0" type="warning">未读</el-tag>
              <el-tag v-if="scope.row.status === 1" type="success">已读</el-tag>
            </template>
          </el-table-column>
          <el-table-column label="创建时间" prop="createTime" width="200"></el-table-column>
          <el-table-column label="更新时间" prop="updateTime" width="200"></el-table-column>
<!--          <el-table-column label="操作" fixed="right" align="center" width="180">-->
<!--            <template #default="scope">-->
<!--              <el-popconfirm title="确定删除吗？" @confirm="table_del(scope.row, scope.$index)">-->
<!--                <template #reference>-->
<!--                  <el-button type="text" size="small">删除</el-button>-->
<!--                </template>-->
<!--              </el-popconfirm>-->
<!--           </template>-->
<!--          </el-table-column>-->
        </el-table>
      </el-main>
    </el-container>
</template>
<script>
import {Search} from "@element-plus/icons-vue";
export default {
  name: "Message",
  components: {
    Search,
  },
  data() {
    return {
      messageList:[],
      selection: [],
      isSaveing: false,
      value:'',
      messageSearch: {
        oriId:null,
        desId:null,
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
        this.axios.get("/article/messageList").then(response => {
          this.messageList = response.data.data
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
          this.messageList = res.data.data
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
    filterMesType(value,row){
      return row.mesType === value
    },
    //搜索
    upsearch() {
      this.axios.get("/message/selectAllMessage1",{
            params:{
              oriId:this.messageSearch.oriId,
              desId:this.messageSearch.desId,
              startTime:this.messageSearch.TimeValue[0],
              endTime:this.messageSearch.TimeValue[1]
            }
          },
      ).then(res => {
        this.messageList = res.data.data
      })
    }
  },
  beforeCreate() {
    this.axios.get("/message/selectAllMessage1").then(response => {
      this.messageList = response.data.data
      console.log(this.messageList)
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
