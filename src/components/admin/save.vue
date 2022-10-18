<template>
    <el-form :model="form" :disabled="mode=='show'" ref="dialogForm" label-width="70px" label-position="left">
          <el-form-item label="标题">
            <el-input v-model="form.title" clearable></el-input>
          </el-form-item>
          <el-form-item label="内容">
            <el-input v-model="form.content" type="textarea" :autosize="{minRows:2,maxRows:6}" clearable></el-input>
          </el-form-item>
          <el-form-item label="类型">
            <el-input v-model="form.category" clearable></el-input>
          </el-form-item>
          <el-form-item label="作者">
            <el-input v-model="form.nickName" clearable></el-input>
          </el-form-item>
          <el-form-item label="发布时间">
            <el-input v-model="form.createTime" clearable></el-input>
          </el-form-item>
          <el-form-item label="状态">
            <el-input v-if="form.status == 1" model-value="待审核">
            </el-input>
            <el-input v-if="form.status == 0" model-value="审核通过">
            </el-input>
            <el-input v-if="form.status == 2" model-value="审核不通过">
            </el-input>
          </el-form-item>
    </el-form>
</template>

<script>
	export default {
		props: {
			mode: { type: String, default: "add" }
		},
		data() {
			return {
				uploadUrl: '',
				//表单数据
				form: {
        },
				//所需数据选项
				groups: [],
				groupsProps: {
					value: "id",
					multiple: true,
					checkStrictly: true
				}
			}
		},
		mounted() {
		},
		methods: {
			// 表单提交方法
			submit(callback){
        console.log("hhhh")
				callback(this.form)
			},
			//表单注入数据
			setData(data){
				// this.form.id = data.id
				// this.form.userName = data.userName
				// this.form.avatar = data.avatar
				// this.form.name = data.name
				// this.form.group = data.group
        console.log(data)
				//可以和上面一样单个注入，也可以像下面一样直接合并进去
				Object.assign(this.form, data)
			}
		}
	}
</script>

<style scoped>
.el-form.el-row{
  display: inline-block;
}
</style>
