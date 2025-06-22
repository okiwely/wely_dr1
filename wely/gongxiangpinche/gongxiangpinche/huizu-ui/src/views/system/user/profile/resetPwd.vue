<template>
  <el-form ref="form" :model="user" :rules="rules" label-width="180px">
    <el-form-item label="古いパスワード" prop="oldPassword">
      <el-input v-model="user.oldPassword" placeholder="" type="password" show-password/>
    </el-form-item>
    <el-form-item label="新しいパスワード" prop="newPassword">
      <el-input v-model="user.newPassword" placeholder="" type="password" show-password/>
    </el-form-item>
    <el-form-item label="新しいパスワードを確認" prop="confirmPassword">
      <el-input v-model="user.confirmPassword" placeholder="" type="password" show-password/>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" size="mini" @click="submit">パスワードを変更</el-button>
      <el-button type="danger" size="mini" @click="close">クローズ</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import { updateUserPwd } from "@/api/system/user";

export default {
  data() {
    const equalToPassword = (rule, value, callback) => {
      if (this.user.newPassword !== value) {
        callback(new Error("パスワードが一致しません"));
      } else {
        callback();
      }
    };
    return {
      user: {
        oldPassword: undefined,
        newPassword: undefined,
        confirmPassword: undefined
      },
      // 表单校验
      rules: {
        oldPassword: [
          { required: true, message: "古いパスワードは必須", trigger: "blur" }
        ],
        newPassword: [
          { required: true, message: "新しいパスワードは必須", trigger: "blur" },
          { min: 6, max: 20, message: "パスワードの長さは6〜20文字", trigger: "blur" },
          { pattern: /^[^<>"'|\\]+$/, message: "不能包含非法字符：< > \" ' \\\ |", trigger: "blur" }
        ],
        confirmPassword: [
          { required: true, message: "確認用パスワードは必須", trigger: "blur" },
          { required: true, validator: equalToPassword, trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    submit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          updateUserPwd(this.user.oldPassword, this.user.newPassword).then(response => {
            this.$modal.msgSuccess("修正成功");
          });
        }
      });
    },
    close() {
      this.$tab.closePage();
    }
  }
};
</script>
