<template>
    <el-form class="user-account-key" ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="原密码" prop="password">
            <el-input type="password" placeholder="请输入原密码" v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item label="新密码" prop="newPassword">
            <el-input type="password" placeholder="请设置新密码" v-model="form.newPassword"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="newPassword2">
            <el-input type="password" placeholder="请确认新密码" v-model="form.newPassword2"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="onSubmit('form')">保存</el-button>
            <el-button @click="$refs['form'].resetFields()">重置</el-button>
        </el-form-item>
    </el-form>
</template>

<script>
export default {
    name: 'all',
    data () {
    	//此处即表单发送之前验证
        let validateNewPassword = (rule, value, callback) => {
            if (value === this.form.password) {
                callback(new Error('新密码不能与原密码相同!'))
            } else {
                callback()
            }
        }
        let validateNewPassword2 = (rule, value, callback) => {
            if (value !== this.form.newPassword) {
                callback(new Error('与新密码不一致!'))
            } else {
                callback()
            }
        }
        return {
            form: {},
            rules: {
                password: [
                    { required: true, message: '请输入原密码', trigger: 'blur' }
                ],
                newPassword: [
                    { required: true, message: '请设置新密码', trigger: 'blur' },
                    { validator: validateNewPassword, trigger: 'blur' }
                ],
                newPassword2: [
                    { required: true, message: '请确认新密码', trigger: 'blur' },
                    { validator: validateNewPassword2, trigger: 'blur' }
                ]
            }
        }
    },
    methods: {
        onSubmit (formName) {
            this.$refs[formName].validate(valid => {
                if (valid) {this.$store.dispatch('api_get_update_password', {category: 'pwd',newPassword:this.form.newPassword,password:this.form.password})
                .then(() => {
                                this.$message.success('密码已修改')
                    })
                } else {
                    this.$message.error('请正确填写表单')
                    return false
                }
            })
        }
    },
}
</script>
