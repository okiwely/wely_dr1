<template>
  <div class="app-container">
    <!-- 查询栏 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="商店类型" prop="storeType">
        <el-select v-model="queryParams.storeType" placeholder="请选择商店类型" clearable>
          <el-option
            v-for="dict in dict.type.pro_version_shop"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="系统类型" prop="systemType">
        <el-select v-model="queryParams.systemType" placeholder="请选择系统类型" clearable>
          <el-option
            v-for="dict in dict.type.pro_version_system"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作栏 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:version:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:version:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:version:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:version:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 存储app版本相关信息表格数据列表 -->
    <el-table v-loading="loading" :data="versionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="商店类型" align="center" prop="storeType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.pro_version_shop" :value="scope.row.storeType"/>
        </template>
      </el-table-column>
      <el-table-column label="系统类型" align="center" prop="systemType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.pro_version_system" :value="scope.row.systemType"/>
        </template>
      </el-table-column>
      <el-table-column label="安装url" align="center" prop="resUrl">
        <template slot-scope="scope">
            <el-button type="info"  size="small" v-if="scope.row.resUrl != null" @click="downloadFile(scope.row.resUrl)">下载</el-button>
        </template>
      </el-table-column>
      <el-table-column label="版本编码" align="center" prop="versionCode" />
      <el-table-column label="版本名称" align="center" prop="versionName" />
<!--      <el-table-column label="更新内容" align="center" prop="content" />-->
      <el-table-column label="是否强制更新" align="center" prop="upFlag" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.yes_no" :value="scope.row.upFlag"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="描述信息" align="center" prop="description" />-->
<!--      <el-table-column label="帐号状态" align="center" prop="status" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:version:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:version:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleDetails(scope.row)"
            v-hasPermi="['system:version:details']"
          >详情</el-button>
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
    />

    <!-- 添加或修改存储app版本相关信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="130px" inline>
        <el-form-item label="商店类型" prop="storeType">
          <el-select v-model="form.storeType" placeholder="请选择商店类型"  style="width:220px">
            <el-option
              v-for="dict in dict.type.pro_version_shop"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="系统类型" prop="systemType">
          <el-select v-model="form.systemType" placeholder="请选择系统类型"  style="width:220px">
            <el-option
              v-for="dict in dict.type.pro_version_system"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="版本编码" prop="versionCode">
          <el-input v-model="form.versionCode" placeholder="请输入版本编码" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="版本名称" prop="versionName">
          <el-input v-model="form.versionName" placeholder="请输入版本名称" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="是否强制更新" prop="upFlag">
          <el-select v-model="form.upFlag" placeholder="请选择是否强制更新"  style="width:220px">
            <el-option
              v-for="dict in dict.type.yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="安装url" prop="resUrl">
          <file-upload v-model="form.resUrl"/>
        </el-form-item>
        <el-form-item label="更新内容">
          <editor v-model="form.content" :min-height="192"  style="width:580px"/>
        </el-form-item>
        <el-form-item label="描述信息" prop="description">
          <el-input v-model="form.description" type="textarea" placeholder="请输入内容"  maxlength="500" show-word-limit style="width:580px"/>
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
        <el-descriptions-item label="商店类型">
          <dict-tag
              :options="dict.type.pro_version_shop"
              :value="formDetails.storeType"
          />
        </el-descriptions-item>
        <el-descriptions-item label="系统类型">
          <dict-tag
              :options="dict.type.pro_version_system"
              :value="formDetails.systemType"
          />
        </el-descriptions-item>
        <el-descriptions-item label="安装url">
          <el-button type="info"  size="small" v-if="formDetails.resUrl != null" @click="downloadFile(formDetails.resUrl)">下载</el-button>
        </el-descriptions-item>
        <el-descriptions-item label="版本编码">
          {{ formDetails.versionCode }}
        </el-descriptions-item>
        <el-descriptions-item label="版本名称">
          {{ formDetails.versionName }}
        </el-descriptions-item>
        <el-descriptions-item label="是否强制更新">
          <dict-tag :options="dict.type.yes_no" :value="formDetails.upFlag"/>
        </el-descriptions-item>
      </el-descriptions>
      <el-descriptions class="margin-top" :column="1" border :labelStyle="labelStyle">
        <el-descriptions-item label="更新内容">
          <p class="wrapper" v-html='formDetails.content'></p>
        </el-descriptions-item>
        <el-descriptions-item label="描述信息">
          {{ formDetails.description }}
        </el-descriptions-item>
      </el-descriptions>
    </el-dialog>

  </div>
</template>

<script>
import { listVersion, getVersion, delVersion, addVersion, updateVersion } from "@/api/system/version";

export default {
  name: "Version",
  dicts: ['pro_version_system', 'pro_version_shop','yes_no'],
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
      // 存储app版本相关信息表格数据
      versionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetails: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        storeType: null,
        systemType: null,
        resUrl: null,
        versionCode: null,
        versionName: null,
        content: null,
        upFlag: null,
        description: null,
        status: null,
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
    /** 查询存储app版本相关信息列表 */
    getList() {
      this.loading = true;
      listVersion(this.queryParams).then(response => {
        this.versionList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        storeType: null,
        systemType: null,
        resUrl: null,
        versionCode: null,
        versionName: null,
        content: null,
        upFlag: null,
        description: null,
        status: null,
        createTime: null,
        updateTime: null,
        delFlag: null
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
      this.title = "添加存储app版本相关信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getVersion(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改存储app版本相关信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateVersion(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addVersion(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
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
      this.$modal.confirm('是否确认删除存储app版本相关信息编号为"' + ids + '"的数据项？').then(function() {
        return delVersion(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 详情按钮操作 */
    handleDetails(row) {
      this.reset();
      const id = row.id || this.ids
      getVersion(id).then(response => {
        this.formDetails = response.data;
        this.openDetails = true;
        this.title = "存储app版本相关信息详情";
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.$modal.confirm('是否根据搜索条件导出所有数据？').then(() => {
         this.download('system/version/export', {
              ...this.queryParams
         }, `存储app版本相关信息_${new Date().getTime()}.xlsx`)
      })
    }
  }
};
</script>
