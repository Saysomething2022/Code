<template>
  <div>
      <el-menu  class="el-menu-demo" mode="horizontal">
        <el-menu-item v-for="(item,i) in typeList" :key="i" :index="item.id" @click="change(item.id)">
          {{ item.type }}
        </el-menu-item>
      </el-menu>
<!--    </el-menu>-->
    <div class="h-6">
    </div>
  </div>
</template>

<script>
import {UserStore} from "../store/index"
export default {
  name: 'Nav',
  data() {
    return {
      activeIndex: '1',
      typeList:[
      ]
    }
  },
  props:['ChangeArticleList'],
  beforeCreate() {
    //加载所有文章类型
    this.axios.get("/article/typeList1").then(response => {
      console.log(response.data.data)
      this.typeList = response.data.data
    })
  },
    methods: {
      change(id) {
        const store = UserStore()
        this.axios.get("/article",{
          params:{
            category:store.category,
            type_id:id
          }
        }).then(response => {
          this.ChangeArticleList(response.data.data.records)
        })

        //修改当前类别
        store.setTypeId(id)
      }
    }
}
</script>

<style scoped>
.demo-tabs > .el-tabs__content {
  padding: 32px;
  background-color: #f4f5f7;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}
</style>
