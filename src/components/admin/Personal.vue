<template>
  <el-main>
    <el-row :gutter="15">
      <el-col :lg="6">
        <el-card shadow="never" style="display:flex;align-items:center;justify-content:center;line-height: 30px;">
          <div class="user-info">
            <div class="user-info-top">
              <el-avatar :size="80" :src="$userStore.userinfo.avatar"></el-avatar>
              <h2>{{$userStore.userinfo.nickName?$userStore.userinfo.nickName:$userStore.userinfo.email}}</h2>
              <p>{{ userinfo.describe||'无签名' }}</p>
              <el-button type="primary" round size="medium"><el-icon><collection-tag /></el-icon><span>Administrator</span></el-button>
            </div>
            <div class="user-info-main">
              <div class="common">
                <el-icon><Message /></el-icon><span class="common1">{{userinfo.email}}</span>
              </div>
              <div class="common">
                  <el-icon><tickets /></el-icon><span class="common1">{{ userinfo.createTime }}</span>
              </div>
              <div class="common">
                <el-icon><User /></el-icon><span class="common1">{{ userinfo.role }}</span>
              </div>
            </div>
          </div>
        </el-card>
      </el-col>
      
      
      <el-col :lg="16">
        <el-card shadow="never">
          <el-tabs tab-position="top">
          
            <el-tab-pane label="近期动态">
              <el-timeline style="margin-top:20px;padding-left:10px;">
                <el-timeline-item v-for="(activity, index) in activities" :key="index" :timestamp="activity.timestamp" placement="top">
                  <div class="activity-item">
                    <el-avatar class="avatar" :size="24" src="img/avatar.jpg"></el-avatar>
                    <label>{{activity.operate}}</label><el-tag v-if="activity.mod" size="mini">{{activity.mod}}</el-tag>{{activity.describe}}
                  </div>
                </el-timeline-item>
              </el-timeline>
            </el-tab-pane>
            
            <el-tab-pane label="基本信息">
              <el-form ref="form" :model="userinfo" label-width="80px" style="width: 460px;margin-top:20px;">
                <el-form-item label="账号">
                  <el-input v-model="userinfo.email" disabled></el-input>
                  <div class="el-form-item-msg">账号信息用于登录，系统不允许修改</div>
                </el-form-item>
                <el-form-item label="姓名">
                  <el-input v-model="userinfo.nickName"></el-input>
                </el-form-item>
<!--                <el-form-item label="性别">-->
<!--                  <el-select v-model="form.sex" placeholder="请选择">-->
<!--                    <el-option label="保密" value="0"></el-option>-->
<!--                    <el-option label="男" value="1"></el-option>-->
<!--                    <el-option label="女" value="2"></el-option>-->
<!--                  </el-select>-->
<!--                </el-form-item>-->
                <el-form-item label="个性签名">
                  <el-input v-model="userinfo.describe" type="textarea"></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary">保存</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>
            
            <el-tab-pane label="个人设置">
              <el-form ref="form" :model="userinfo" label-width="120px" style="width: 460px;margin-top:20px;">
                <el-form-item label="布局">
                  <el-select v-model="config.theme" placeholder="请选择">
                    <el-option label="常规" value="0"></el-option>
                    <el-option label="分栏" value="1"></el-option>
                  </el-select>
                </el-form-item>
                <el-form-item label="控制台自由布局">
                  <el-switch v-model="config.diy"></el-switch>
                </el-form-item>
                <el-form-item label="多标签">
                  <el-switch v-model="config.tags"></el-switch>
                </el-form-item>
                <el-form-item label="系统通知">
                  <el-switch v-model="config.msg"></el-switch>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary">保存</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>
            
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
  </el-main>
</template>

<script>
import {User,CollectionTag,Message,Tickets} from "@element-plus/icons-vue"
export default {
  name: "Personal",
  data() {
    return {
     activities: [
{
          operate: '更改了',
          mod: '系统配置',
          describe: 'systemName 为 SCUI',
          type: 'edit',
          timestamp: '刚刚'
        },
        {
          operate: '删除了',
          mod: '用户',
          describe: 'USER',
          type: 'del',
          timestamp: '5分钟前'
        },
        {
          operate: '禁用了',
          mod: '用户',
          describe: 'USER',
          type: 'del',
          timestamp: '5分钟前'
        },
        {
          operate: '创建了',
          mod: '用户',
          describe: 'USER',
          type: 'add',
          timestamp: '5分钟前'
        },
        {
          operate: '审核了',
          mod: '用户',
          describe: 'lolowan 为 通过',
          type: 'add',
          timestamp: '10分钟前'
        },
        {
          operate: '登录',
          mod: '',
          describe: '成功',
          type: 'do',
          timestamp: '1小时前'
        },
      ],
      userinfo: {
      },
      config: {
        theme: '1',
        diy: true,
        tags: true,
        msg: true
      }
    }
  },
  created() {
    this.userinfo = this.$userStore.userinfo
  },
  components:{
    User,
    CollectionTag,
    Message,
    Tickets
  }
}
</script>

<style scoped>
.el-card {
  margin-bottom:15px;
}


.user-info-main{
  margin-top: 30px;
  text-align: left;
  margin-left: -50px;
}
.user-info-top{
  line-height: 10px;
}
.common{
  position: relative;
}
.common1{
  position: absolute;
  margin-left: 10px;
  margin-top: -2px;
}
</style>
