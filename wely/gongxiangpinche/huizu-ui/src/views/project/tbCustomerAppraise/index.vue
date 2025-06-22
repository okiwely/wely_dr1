<template>
  <div class="app-container">
    <!-- 查询栏 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="评论人id" prop="customerId">-->
<!--        <el-input-->
<!--          v-model="queryParams.customerId"-->
<!--          placeholder=""-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="被评论人id" prop="subId">-->
<!--        <el-input-->
<!--          v-model="queryParams.subId"-->
<!--          placeholder=""-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">検索する</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">リセット</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作栏 -->
    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['project:tbCustomerAppraise:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['project:tbCustomerAppraise:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['project:tbCustomerAppraise:remove']"
        >削除する</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['project:tbCustomerAppraise:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 评价;表格数据列表 -->
    <el-table v-loading="loading" :data="tbCustomerAppraiseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="レビューユーザー" align="center" prop="customerName" />
      <el-table-column label="レビューされたユーザー" align="center" prop="subName" />
      <el-table-column label="れべる" align="center" prop="level" />
<!--      <el-table-column label="コメントの内容" align="center" prop="content" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['project:tbCustomerAppraise:edit']"-->
<!--          >修改</el-button>-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['project:tbCustomerAppraise:remove']"
          >削除する</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleDetails(scope.row)"
            v-hasPermi="['project:tbCustomerAppraise:details']"
          >詳細</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页插件 -->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
      layout="prev, pager, next"
    />

    <!-- 添加或修改评价;对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="130px" inline>
        <el-form-item label="评论人id" prop="customerId">
          <el-input v-model="form.customerId" placeholder="请输入评论人id" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="被评论人id" prop="subId">
          <el-input v-model="form.subId" placeholder="请输入被评论人id" maxlength="100" style="width:220px"/>
        </el-form-item>

        <el-form-item label="内容" prop="content">
          <el-input v-model="form.content" type="textarea" placeholder="请输入内容"  maxlength="500" show-word-limit style="width:580px"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!--详情弹窗-->
    <el-dialog :title="title" :visible.sync="openDetails" width="900px" append-to-body>
      <el-descriptions class="margin-top" :model="formDetails" :column="2" border :labelStyle="labelStyle" :contentStyle="contentStyle">
        <el-descriptions-item label="レビューユーザー">
          {{ formDetails.customerName }}
        </el-descriptions-item>
        <el-descriptions-item label="レビューされたユーザー">
          {{ formDetails.subName }}
        </el-descriptions-item>
      </el-descriptions>
      <el-descriptions class="margin-top" :column="1" border :labelStyle="labelStyle">
        <el-descriptions-item label="コメントの内容">
          {{ formDetails.content }}
        </el-descriptions-item>
      </el-descriptions>
    </el-dialog>

  </div>
</template>

<script>
import { listTbCustomerAppraise, getTbCustomerAppraise, delTbCustomerAppraise, addTbCustomerAppraise, updateTbCustomerAppraise } from "@/api/project/tbCustomerAppraise";

export default {
  name: "TbCustomerAppraise",
  data() {
    return {
      labelStyle: {'width': '140px'},
      contentStyle: {'width': '300px'},
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 评价;表格数据
      tbCustomerAppraiseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetails: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 100,
        customerId: null,
        subId: null,
        level: null,
      },
      // 表单参数
      form: {},
      formDetails: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询评价;列表 */
    getList() {
      this.loading = true;
      listTbCustomerAppraise(this.queryParams).then(response => {
        this.tbCustomerAppraiseList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.openDetails = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        customerId: null,
        subId: null,
        level: null,
        content: null,
        status: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        delFlag: null,
        standby1: null,
        standby2: null,
        standby3: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加评价;";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTbCustomerAppraise(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改评价;";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTbCustomerAppraise(this.form).then(response => {
              this.$modal.msgSuccess("修正成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTbCustomerAppraise(this.form).then(response => {
              this.$modal.msgSuccess("新たに成功します");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('削除を確認しますか？').then(function() {
        return delTbCustomerAppraise(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("削除成功");
      }).catch(() => {});
    },
    /** 详情按钮操作 */
    handleDetails(row) {
      this.reset();
      const id = row.id || this.ids
      getTbCustomerAppraise(id).then(response => {
        this.formDetails = response.data;
        this.openDetails = true;
        this.title = "詳細";
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.$modal.confirm('是否根据搜索条件导出所有数据？').then(() => {
         this.download('project/tbCustomerAppraise/export', {
              ...this.queryParams
         }, `评价;_${new Date().getTime()}.xlsx`)
      })
    }
  }
};
</script>
