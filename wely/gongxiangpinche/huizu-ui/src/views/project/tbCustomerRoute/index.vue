<template>
  <div class="app-container">
    <!-- 查询栏 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="ユーザー" prop="customerName">-->
<!--        <el-input-->
<!--          v-model="queryParams.customerName"-->
<!--          placeholder=""-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="ユーザータイプ" prop="type">
        <el-select v-model="queryParams.type" placeholder="" clearable>
          <el-option
            v-for="dict in dict.type.pro_customer_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="出発日時" prop="startTime">
        <el-date-picker clearable
          v-model="queryParams.startTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="">
        </el-date-picker>
      </el-form-item>
<!--      <el-form-item label="到着予定日時" prop="endTime">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.endTime"-->
<!--          type="date"-->
<!--          value-format="yyyy-MM-dd"-->
<!--          placeholder="選択をお願いします到着予定日時">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="出発地" prop="startAddress">-->
<!--        <el-input-->
<!--          v-model="queryParams.startAddress"-->
<!--          placeholder="请输入出発地"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="目的地" prop="endAddress">-->
<!--        <el-input-->
<!--          v-model="queryParams.endAddress"-->
<!--          placeholder="请输入目的地"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="出発地緯度と経度" prop="startLonLat">-->
<!--        <el-input-->
<!--          v-model="queryParams.startLonLat"-->
<!--          placeholder="请输入出発地緯度と経度"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="目的地の緯度緯度" prop="endLonLat">-->
<!--        <el-input-->
<!--          v-model="queryParams.endLonLat"-->
<!--          placeholder="请输入目的地の緯度緯度"-->
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
<!--          v-hasPermi="['project:tbCustomerRoute:add']"-->
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
<!--          v-hasPermi="['project:tbCustomerRoute:edit']"-->
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
<!--          v-hasPermi="['project:tbCustomerRoute:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['project:tbCustomerRoute:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 行程管理;表格数据列表 -->
    <el-table v-loading="loading" :data="tbCustomerRouteList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ユーザー" align="center" prop="customerName" />
      <el-table-column label="ユーザータイプ" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.pro_customer_type" :value="scope.row.type"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="ないよう" align="center" prop="describe" />-->
      <el-table-column label="出発日時" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="到着予定日時" align="center" prop="endTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="出発地" align="center" prop="startAddress" />
      <el-table-column label="目的地" align="center" prop="endAddress" />
<!--      <el-table-column label="出発地緯度と経度" align="center" prop="startLonLat" />-->
<!--      <el-table-column label="目的地の緯度緯度" align="center" prop="endLonLat" />-->
      <el-table-column label="価格" align="center" prop="price" />
      <el-table-column label="乗車人数" align="center" prop="total" />
      <el-table-column label="乗車済み人数" align="center" prop="alreadyTotal" />
<!--      <el-table-column label="事前の注意事項" align="center" prop="attention" />-->
<!--      <el-table-column label="評論する" align="center" prop="comment" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['project:tbCustomerRoute:edit']"-->
<!--          >修改</el-button>-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['project:tbCustomerRoute:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleDetails(scope.row)"
            v-hasPermi="['project:tbCustomerRoute:details']"
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

    <!-- 添加或修改行程管理;对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="130px" inline>
        <el-form-item label="用户id" prop="customerId">
          <el-input v-model="form.customerId" placeholder="请输入用户id" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="ユーザータイプ" prop="type">
          <el-select v-model="form.type" placeholder="選択をお願いしますユーザータイプ" style="width:220px">
            <el-option
              v-for="dict in dict.type.pro_customer_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="出発日時" prop="startTime">
          <el-date-picker clearable
            v-model="form.startTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="選択をお願いします出発日時"  style="width:220px">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="到着予定日時" prop="endTime">
          <el-date-picker clearable
            v-model="form.endTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="選択をお願いします到着予定日時"  style="width:220px">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="出発地" prop="startAddress">
          <el-input v-model="form.startAddress" placeholder="请输入出発地" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="目的地" prop="endAddress">
          <el-input v-model="form.endAddress" placeholder="请输入目的地" maxlength="100" style="width:220px"/>
        </el-form-item>
<!--        <el-form-item label="出発地緯度と経度" prop="startLonLat">-->
<!--          <el-input v-model="form.startLonLat" placeholder="请输入出発地緯度と経度" maxlength="100" style="width:220px"/>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="目的地の緯度緯度" prop="endLonLat">-->
<!--          <el-input v-model="form.endLonLat" placeholder="请输入目的地の緯度緯度" maxlength="100" style="width:220px"/>-->
<!--        </el-form-item>-->
        <el-form-item label="车型号" prop="model">
          <el-input v-model="form.model" placeholder="请输入车型号" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="车牌号" prop="number">
          <el-input v-model="form.number" placeholder="请输入车牌号" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="価格" prop="price">
          <el-input v-model="form.price" placeholder="请输入価格" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="乗車人数" prop="total">
          <el-input v-model="form.total" placeholder="请输入乗車人数" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="乗車済み人数" prop="alreadyTotal">
          <el-input v-model="form.alreadyTotal" placeholder="请输入乗車済み人数" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="访问人数" prop="viewTotal">
          <el-input v-model="form.viewTotal" placeholder="请输入访问人数" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="行程状态" prop="state">
          <el-input v-model="form.state" placeholder="请输入行程状态" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_open_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>

<!--        <el-form-item label="ないよう" prop="describe">-->
<!--          <el-input v-model="form.describe" type="textarea" placeholder="请输入内容"  maxlength="500" show-word-limit style="width:580px"/>-->
<!--        </el-form-item>-->
        <el-form-item label="事前の注意事項" prop="attention">
          <el-input v-model="form.attention" type="textarea" placeholder="请输入内容"  maxlength="500" show-word-limit style="width:580px"/>
        </el-form-item>
        <el-form-item label="評論する" prop="comment">
          <el-input v-model="form.comment" type="textarea" placeholder="请输入内容"  maxlength="500" show-word-limit style="width:580px"/>
        </el-form-item>
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
        <el-descriptions-item label="ユーザー">
          {{ formDetails.customerName }}
        </el-descriptions-item>
        <el-descriptions-item label="ユーザータイプ">
          <dict-tag
              :options="dict.type.pro_customer_type"
              :value="formDetails.type"
          />
        </el-descriptions-item>
        <el-descriptions-item label="出発日時">
          {{ parseTime(formDetails.startTime,'{y}-{m}-{d}') }}
        </el-descriptions-item>
        <el-descriptions-item label="到着予定日時">
          {{ parseTime(formDetails.endTime,'{y}-{m}-{d}') }}
        </el-descriptions-item>
        <el-descriptions-item label="出発地">
          {{ formDetails.startAddress }}
        </el-descriptions-item>
        <el-descriptions-item label="目的地">
          {{ formDetails.endAddress }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="出発地緯度と経度">-->
<!--          {{ formDetails.startLonLat }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="目的地の緯度緯度">-->
<!--          {{ formDetails.endLonLat }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="车型号">-->
<!--          {{ formDetails.model }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="车牌号">-->
<!--          {{ formDetails.number }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="価格">
          {{ formDetails.price }}
        </el-descriptions-item>
        <el-descriptions-item label="乗車人数">
          {{ formDetails.total }}
        </el-descriptions-item>
        <el-descriptions-item label="乗車済み人数">
          {{ formDetails.alreadyTotal }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="访问人数">-->
<!--          {{ formDetails.viewTotal }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="行程状态">-->
<!--          {{ formDetails.state }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="状态">-->
<!--          <dict-tag-->
<!--              :options="dict.type.sys_open_status"-->
<!--              :value="formDetails.status"-->
<!--          />-->
<!--        </el-descriptions-item>-->
      </el-descriptions>
      <el-descriptions class="margin-top" :column="1" border :labelStyle="labelStyle">
<!--        <el-descriptions-item label="ないよう">-->
<!--          {{ formDetails.describe }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="事前の注意事項">
          {{ formDetails.attention }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="評論する">-->
<!--          {{ formDetails.comment }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="备注">-->
<!--          {{ formDetails.remark }}-->
<!--        </el-descriptions-item>-->
      </el-descriptions>
    </el-dialog>

  </div>
</template>

<script>
import { listTbCustomerRoute, getTbCustomerRoute, delTbCustomerRoute, addTbCustomerRoute, updateTbCustomerRoute } from "@/api/project/tbCustomerRoute";

export default {
  name: "TbCustomerRoute",
  dicts: ['sys_open_status', 'pro_customer_type'],
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
      // 行程管理;表格数据
      tbCustomerRouteList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetails: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 100,
        customerName: null,
        customerId: null,
        type: null,
        describe: null,
        startTime: null,
        endTime: null,
        startAddress: null,
        endAddress: null,
        startLonLat: null,
        endLonLat: null,
        model: null,
        number: null,
        price: null,
        total: null,
        alreadyTotal: null,
        viewTotal: null,
        state: null,
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
    /** 查询行程管理;列表 */
    getList() {
      this.loading = true;
      listTbCustomerRoute(this.queryParams).then(response => {
        this.tbCustomerRouteList = response.rows;
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
        type: null,
        describe: null,
        startTime: null,
        endTime: null,
        startAddress: null,
        endAddress: null,
        startLonLat: null,
        endLonLat: null,
        model: null,
        number: null,
        price: null,
        total: null,
        alreadyTotal: null,
        attention: null,
        comment: null,
        viewTotal: null,
        state: null,
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
      this.title = "添加行程管理;";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTbCustomerRoute(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改行程管理;";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTbCustomerRoute(this.form).then(response => {
              this.$modal.msgSuccess("修正成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTbCustomerRoute(this.form).then(response => {
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
        return delTbCustomerRoute(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("削除成功");
      }).catch(() => {});
    },
    /** 詳細按钮操作 */
    handleDetails(row) {
      this.reset();
      const id = row.id || this.ids
      getTbCustomerRoute(id).then(response => {
        this.formDetails = response.data;
        this.openDetails = true;
        this.title = "詳細";
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.$modal.confirm('是否根据搜索条件导出所有数据？').then(() => {
         this.download('project/tbCustomerRoute/export', {
              ...this.queryParams
         }, `行程管理;_${new Date().getTime()}.xlsx`)
      })
    }
  }
};
</script>
