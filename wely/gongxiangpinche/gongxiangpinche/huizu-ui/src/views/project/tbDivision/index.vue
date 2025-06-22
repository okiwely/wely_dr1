<template>
  <div class="app-container">
    <!-- 查询栏 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="エンコード" prop="code">-->
<!--        <el-input-->
<!--          v-model="queryParams.code"-->
<!--          placeholder=""-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="都道府県" prop="cityC">-->
<!--        <el-input-->
<!--          v-model="queryParams.cityC"-->
<!--          placeholder="一度入力してください都道府県"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="市区町村" prop="areaC">-->
<!--        <el-input-->
<!--          v-model="queryParams.areaC"-->
<!--          placeholder="一度入力してください市区町村"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="都道府県" prop="city">-->
<!--        <el-input-->
<!--          v-model="queryParams.city"-->
<!--          placeholder="一度入力してください都道府県"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="市区町村" prop="area">-->
<!--        <el-input-->
<!--          v-model="queryParams.area"-->
<!--          placeholder="一度入力してください市区町村"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item>-->
<!--        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">検索する</el-button>-->
<!--        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">リセット</el-button>-->
<!--      </el-form-item>-->
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
<!--          v-hasPermi="['project:tbDivision:add']"-->
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
<!--          v-hasPermi="['project:tbDivision:edit']"-->
<!--        >編集する</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['project:tbDivision:remove']"-->
<!--        >削除する</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['project:tbDivision:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 行政区划表格数据列表 -->
    <el-table v-loading="loading" :data="tbDivisionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="エンコード" align="center" prop="code" />-->
      <el-table-column label="都道府県" align="center" prop="cityC" />
      <el-table-column label="市区町村" align="center" prop="areaC" />
      <el-table-column label="都道府県" align="center" prop="city" />
      <el-table-column label="市区町村" align="center" prop="area" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['project:tbDivision:edit']"-->
<!--          >編集する</el-button>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['project:tbDivision:remove']"-->
<!--          >削除する</el-button>-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleDetails(scope.row)"
            v-hasPermi="['project:tbDivision:details']"
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

    <!-- 添加或改める行政区划对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="130px" inline>
        <el-form-item label="エンコード" prop="code">
          <el-input v-model="form.code" placeholder="一度入力してくださいエンコード" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="都道府県" prop="cityC">
          <el-input v-model="form.cityC" placeholder="一度入力してください都道府県" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="市区町村" prop="areaC">
          <el-input v-model="form.areaC" placeholder="一度入力してください市区町村" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="都道府県" prop="city">
          <el-input v-model="form.city" placeholder="一度入力してください都道府県" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="市区町村" prop="area">
          <el-input v-model="form.area" placeholder="一度入力してください市区町村" maxlength="100" style="width:220px"/>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">確定する</el-button>
        <el-button @click="cancel">取り消す</el-button>
      </div>
    </el-dialog>

    <!--詳細弹窗-->
    <el-dialog :title="title" :visible.sync="openDetails" width="900px" append-to-body>
      <el-descriptions class="margin-top" :model="formDetails" :column="2" border :labelStyle="labelStyle" :contentStyle="contentStyle">
        <el-descriptions-item label="エンコード">
          {{ formDetails.code }}
        </el-descriptions-item>
        <el-descriptions-item label="都道府県">
          {{ formDetails.cityC }}
        </el-descriptions-item>
        <el-descriptions-item label="市区町村">
          {{ formDetails.areaC }}
        </el-descriptions-item>
        <el-descriptions-item label="都道府県">
          {{ formDetails.city }}
        </el-descriptions-item>
        <el-descriptions-item label="市区町村">
          {{ formDetails.area }}
        </el-descriptions-item>
      </el-descriptions>
      <el-descriptions class="margin-top" :column="1" border :labelStyle="labelStyle">
      </el-descriptions>
    </el-dialog>

  </div>
</template>

<script>
import { listTbDivision, getTbDivision, delTbDivision, addTbDivision, updateTbDivision } from "@/api/project/tbDivision";

export default {
  name: "TbDivision",
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
      // 行政区划表格数据
      tbDivisionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetails: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 100,
        code: null,
        cityC: null,
        areaC: null,
        city: null,
        area: null
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
    /** 查询行政区划列表 */
    getList() {
      this.loading = true;
      listTbDivision(this.queryParams).then(response => {
        this.tbDivisionList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取り消す按钮
    cancel() {
      this.open = false;
      this.openDetails = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        code: null,
        cityC: null,
        areaC: null,
        city: null,
        area: null
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
      this.title = "添加行政区划";
    },
    /** 改める按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTbDivision(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "編集する";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTbDivision(this.form).then(response => {
              this.$modal.msgSuccess("修正成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTbDivision(this.form).then(response => {
              this.$modal.msgSuccess("新たに成功します");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 削除する按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('削除を確認しますか？').then(function() {
        return delTbDivision(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("削除する成功");
      }).catch(() => {});
    },
    /** 詳細按钮操作 */
    handleDetails(row) {
      this.reset();
      const id = row.id || this.ids
      getTbDivision(id).then(response => {
        this.formDetails = response.data;
        this.openDetails = true;
        this.title = "詳細";
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.$modal.confirm('是否根据搜索条件导出所有数据？').then(() => {
        this.download('project/tbDivision/export', {
          ...this.queryParams
        }, `行政区划_${new Date().getTime()}.xlsx`)
      })
    }
  }
};
</script>
