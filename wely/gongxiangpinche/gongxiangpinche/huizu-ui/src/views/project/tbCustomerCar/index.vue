<template>
  <div class="app-container">
    <!-- 查询栏 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="用户id" prop="customerId">-->
<!--        <el-input-->
<!--          v-model="queryParams.customerId"-->
<!--          placeholder="请输入用户id"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="車両情報" prop="info">-->
<!--        <el-input-->
<!--          v-model="queryParams.info"-->
<!--          placeholder="请输入車両情報"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="ガソリンタイプ" prop="gasoline">
        <el-select v-model="queryParams.gasoline" placeholder="" clearable>
          <el-option
            v-for="dict in dict.type.tb_car_gasoline"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="排気量" prop="carCc">
        <el-select v-model="queryParams.carCc" placeholder="" clearable>
          <el-option
            v-for="dict in dict.type.car_cc"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="搭乗人数" prop="total">
        <el-select v-model="queryParams.total" placeholder="" clearable>
          <el-option
            v-for="dict in dict.type.tb_car_total"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="ETC" prop="isEtc">
        <el-select v-model="queryParams.isEtc" placeholder="" clearable>
          <el-option
            v-for="dict in dict.type.yes_no"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
<!--      <el-form-item label="制造商" prop="manufacturer">-->
<!--        <el-input-->
<!--          v-model="queryParams.manufacturer"-->
<!--          placeholder="请输入制造商"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="模型" prop="model">-->
<!--        <el-input-->
<!--          v-model="queryParams.model"-->
<!--          placeholder="请输入模型"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="颜色" prop="color">-->
<!--        <el-input-->
<!--          v-model="queryParams.color"-->
<!--          placeholder="请输入颜色"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="年代" prop="decade">-->
<!--        <el-input-->
<!--          v-model="queryParams.decade"-->
<!--          placeholder="请输入年代"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="是否有导航仪" prop="isNavigation">-->
<!--        <el-select v-model="queryParams.isNavigation" placeholder="選択をお願いします是否有导航仪" clearable>-->
<!--          <el-option-->
<!--            v-for="dict in dict.type.yes_no"-->
<!--            :key="dict.value"-->
<!--            :label="dict.label"-->
<!--            :value="dict.value"-->
<!--          />-->
<!--        </el-select>-->
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
<!--          v-hasPermi="['project:tbCustomerCar:add']"-->
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
<!--          v-hasPermi="['project:tbCustomerCar:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['project:tbCustomerCar:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['project:tbCustomerCar:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 汽车管理表格数据列表 -->
    <el-table v-loading="loading" :data="tbCustomerCarList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ドライバー" align="center" prop="customerName" />
      <el-table-column label="車両情報" align="center" prop="info" />
      <el-table-column label="ガソリンタイプ" align="center" prop="gasoline">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.tb_car_gasoline" :value="scope.row.gasoline"/>
        </template>
      </el-table-column>
      <el-table-column label="排気量" align="center" prop="carCc">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.car_cc" :value="scope.row.carCc"/>
        </template>
      </el-table-column>
      <el-table-column label="搭乗人数" align="center" prop="total">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.tb_car_total" :value="scope.row.total"/>
        </template>
      </el-table-column>
      <el-table-column label="ETC" align="center" prop="isEtc">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.yes_no" :value="scope.row.isEtc"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="制造商" align="center" prop="manufacturer" />-->
<!--      <el-table-column label="模型" align="center" prop="model" />-->
<!--      <el-table-column label="颜色" align="center" prop="color" />-->
<!--      <el-table-column label="年代" align="center" prop="decade" />-->
<!--      <el-table-column label="内饰等级" align="center" prop="grade" />-->
<!--      <el-table-column label="是否有导航仪" align="center" prop="isNavigation">-->
<!--        <template slot-scope="scope">-->
<!--          <dict-tag :options="dict.type.yes_no" :value="scope.row.isNavigation"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['project:tbCustomerCar:edit']"-->
<!--          >修改</el-button>-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['project:tbCustomerCar:remove']"
          >削除する</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleDetails(scope.row)"
            v-hasPermi="['project:tbCustomerCar:details']"
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

    <!-- 添加或修改汽车管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="130px" inline>
        <el-form-item label="用户id" prop="customerId">
          <el-input v-model="form.customerId" placeholder="请输入用户id" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="車両情報" prop="info">
          <el-input v-model="form.info" placeholder="请输入車両情報" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="ガソリンタイプ" prop="gasoline">
          <el-select v-model="form.gasoline" placeholder="選択をお願いしますガソリンタイプ" style="width:220px">
            <el-option
              v-for="dict in dict.type.tb_car_gasoline"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="排気量" prop="carCc">
          <el-select v-model="form.carCc" placeholder="選択をお願いします排気量" style="width:220px">
            <el-option
              v-for="dict in dict.type.car_cc"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="搭乗人数" prop="total">
          <el-select v-model="form.total" placeholder="選択をお願いします搭乗人数" style="width:220px">
            <el-option
              v-for="dict in dict.type.tb_car_total"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="ETC" prop="isEtc">
          <el-select v-model="form.isEtc" placeholder="選択をお願いしますETC" style="width:220px">
            <el-option
              v-for="dict in dict.type.yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
<!--        <el-form-item label="制造商" prop="manufacturer">-->
<!--          <el-input v-model="form.manufacturer" placeholder="请输入制造商" maxlength="100" style="width:220px"/>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="模型" prop="model">-->
<!--          <el-input v-model="form.model" placeholder="请输入模型" maxlength="100" style="width:220px"/>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="颜色" prop="color">-->
<!--          <el-input v-model="form.color" placeholder="请输入颜色" maxlength="100" style="width:220px"/>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="年代" prop="decade">-->
<!--          <el-input v-model="form.decade" placeholder="请输入年代" maxlength="100" style="width:220px"/>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="是否有导航仪" prop="isNavigation">-->
<!--          <el-select v-model="form.isNavigation" placeholder="選択をお願いします是否有导航仪" style="width:220px">-->
<!--            <el-option-->
<!--              v-for="dict in dict.type.yes_no"-->
<!--              :key="dict.value"-->
<!--              :label="dict.label"-->
<!--              :value="dict.value"-->
<!--            ></el-option>-->
<!--          </el-select>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="状态" prop="status">-->
<!--          <el-radio-group v-model="form.status">-->
<!--            <el-radio-->
<!--              v-for="dict in dict.type.sys_open_status"-->
<!--              :key="dict.value"-->
<!--              :label="dict.value"-->
<!--            >{{dict.label}}</el-radio>-->
<!--          </el-radio-group>-->
<!--        </el-form-item>-->

        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"  maxlength="500" show-word-limit style="width:580px"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!--詳細弹窗-->
    <el-dialog :title="title" :visible.sync="openDetails" width="900px" append-to-body>
      <el-descriptions class="margin-top" :model="formDetails" :column="2" border :labelStyle="labelStyle" :contentStyle="contentStyle">
        <el-descriptions-item label="ドライバー">
          {{ formDetails.customerName }}
        </el-descriptions-item>
        <el-descriptions-item label="車両情報">
          {{ formDetails.info }}
        </el-descriptions-item>
        <el-descriptions-item label="ガソリンタイプ">
          <dict-tag
              :options="dict.type.tb_car_gasoline"
              :value="formDetails.gasoline"
          />
        </el-descriptions-item>
        <el-descriptions-item label="排気量">
          <dict-tag
              :options="dict.type.car_cc"
              :value="formDetails.carCc"
          />
        </el-descriptions-item>
        <el-descriptions-item label="搭乗人数">
          <dict-tag
              :options="dict.type.tb_car_total"
              :value="formDetails.total"
          />
        </el-descriptions-item>
        <el-descriptions-item label="ETC">
          <dict-tag
              :options="dict.type.yes_no"
              :value="formDetails.isEtc"
          />
        </el-descriptions-item>
<!--        <el-descriptions-item label="制造商">-->
<!--          {{ formDetails.manufacturer }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="模型">-->
<!--          {{ formDetails.model }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="颜色">-->
<!--          {{ formDetails.color }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="年代">-->
<!--          {{ formDetails.decade }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="是否有导航仪">-->
<!--          <dict-tag-->
<!--              :options="dict.type.yes_no"-->
<!--              :value="formDetails.isNavigation"-->
<!--          />-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="状态">-->
<!--          <dict-tag-->
<!--              :options="dict.type.sys_open_status"-->
<!--              :value="formDetails.status"-->
<!--          />-->
<!--        </el-descriptions-item>-->
      </el-descriptions>
      <el-descriptions class="margin-top" :column="1" border :labelStyle="labelStyle">
<!--        <el-descriptions-item label="备注">-->
<!--          {{ formDetails.remark }}-->
<!--        </el-descriptions-item>-->
      </el-descriptions>
    </el-dialog>

  </div>
</template>

<script>
import { listTbCustomerCar, getTbCustomerCar, delTbCustomerCar, addTbCustomerCar, updateTbCustomerCar } from "@/api/project/tbCustomerCar";

export default {
  name: "TbCustomerCar",
  dicts: ['tb_car_gasoline', 'sys_open_status', 'car_cc', 'yes_no', 'tb_car_total'],
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
      // 汽车管理表格数据
      tbCustomerCarList: [],
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
        info: null,
        gasoline: null,
        carCc: null,
        total: null,
        isEtc: null,
        manufacturer: null,
        model: null,
        color: null,
        decade: null,
        grade: null,
        isNavigation: null,
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
    /** 查询汽车管理列表 */
    getList() {
      this.loading = true;
      listTbCustomerCar(this.queryParams).then(response => {
        this.tbCustomerCarList = response.rows;
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
        info: null,
        gasoline: null,
        carCc: null,
        total: null,
        isEtc: null,
        manufacturer: null,
        model: null,
        color: null,
        decade: null,
        grade: null,
        isNavigation: null,
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
      this.title = "添加汽车管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTbCustomerCar(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改汽车管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTbCustomerCar(this.form).then(response => {
              this.$modal.msgSuccess("修正成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTbCustomerCar(this.form).then(response => {
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
        return delTbCustomerCar(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("削除成功");
      }).catch(() => {});
    },
    /** 詳細按钮操作 */
    handleDetails(row) {
      this.reset();
      const id = row.id || this.ids
      getTbCustomerCar(id).then(response => {
        this.formDetails = response.data;
        this.openDetails = true;
        this.title = "詳細";
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.$modal.confirm('是否根据搜索条件导出所有数据？').then(() => {
         this.download('project/tbCustomerCar/export', {
              ...this.queryParams
         }, `汽车管理_${new Date().getTime()}.xlsx`)
      })
    }
  }
};
</script>
