<template>
  <div class="app-container">
    <!-- 查询栏 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="マッチングID" prop="orderCode">
        <el-input
          v-model="queryParams.orderCode"
          placeholder=""
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="マッチングステータス" prop="orderStatus">
        <el-select v-model="queryParams.orderStatus" placeholder="" clearable>
          <el-option
            v-for="dict in dict.type.tb_order_status"
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
      <el-form-item label="到着予定日時" prop="endTime">
        <el-date-picker clearable
                        v-model="queryParams.endTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="">
        </el-date-picker>
      </el-form-item>
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
<!--          v-hasPermi="['project:proOrderInfo:add']"-->
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
<!--          v-hasPermi="['project:proOrderInfo:edit']"-->
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
<!--          v-hasPermi="['project:proOrderInfo:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['project:proOrderInfo:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 订单信息表格数据列表 -->
    <el-table v-loading="loading" :data="proOrderInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ユーザー" align="center" prop="customerName" />
<!--      <el-table-column label="ドライバーid" align="center" prop="driverId" />-->
<!--      <el-table-column label="行程id" align="center" prop="routeId" />-->
<!--      <el-table-column label="註文タイプ" align="center" prop="orderType">-->
<!--        <template slot-scope="scope">-->
<!--          <dict-tag :options="dict.type.pro_recharge_type" :value="scope.row.orderType"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="マッチングID" align="center" prop="orderCode" />
<!--      <el-table-column label="总数量" align="center" prop="totalNum" />-->
<!--      <el-table-column label="总金额" align="center" prop="totalPrice" />-->
<!--      <el-table-column label="优惠金额" align="center" prop="discountPrice" />-->
      <el-table-column label="支払い金額" align="center" prop="actualPrice" />
<!--      <el-table-column label="保证金" align="center" prop="bondPrice" />-->
<!--      <el-table-column label="优惠券编号" align="center" prop="couponId" />-->
<!--      <el-table-column label="实付积分" align="center" prop="integral" />-->
<!--      <el-table-column label="运费" align="center" prop="freight" />-->
<!--      <el-table-column label="套餐编号" align="center" prop="packageId" />-->
<!--      <el-table-column label="配送时间" align="center" prop="sendTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.sendTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="配送箱数" align="center" prop="sendCnt" />-->
<!--      <el-table-column label="收货人" align="center" prop="people" />-->
<!--      <el-table-column label="联系电话" align="center" prop="phone" />-->
<!--      <el-table-column label="收货地址" align="center" prop="address" />-->
<!--      <el-table-column label="マンスリークリア方式" align="center" prop="payType">-->
<!--        <template slot-scope="scope">-->
<!--          <dict-tag :options="dict.type.yes_no" :value="scope.row.payType"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="時間払い賃金" align="center" prop="payTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.payTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="发货人" align="center" prop="pushPeople" />-->
      <el-table-column label="マッチングステータス" align="center" prop="orderStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.tb_order_status" :value="scope.row.orderStatus"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="收货方式" align="center" prop="takeType" />-->
<!--      <el-table-column label="仓库名称" align="center" prop="storehouse" />-->
      <el-table-column label="出発地" align="center" prop="startAddress" />
      <el-table-column label="目的地" align="center" prop="endAddress" />
      <el-table-column label="出発日時" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="到着予定日時" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['project:proOrderInfo:edit']"-->
<!--          >修改</el-button>-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['project:proOrderInfo:remove']"
          >削除する</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleDetails(scope.row)"
            v-hasPermi="['project:proOrderInfo:details']"
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

    <!-- 添加或修改订单信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="130px" inline>
        <el-form-item label="ユーザーid" prop="customerId">
          <el-input v-model="form.customerId" placeholder="请输入ユーザーid" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="ドライバーid" prop="driverId">
          <el-input v-model="form.driverId" placeholder="请输入ドライバーid" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="行程id" prop="routeId">
          <el-input v-model="form.routeId" placeholder="请输入行程id" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="註文タイプ" prop="orderType">
          <el-select v-model="form.orderType" placeholder="请选择註文タイプ" style="width:220px">
            <el-option
              v-for="dict in dict.type.pro_recharge_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="マッチングID" prop="orderCode">
          <el-input v-model="form.orderCode" placeholder="请输入マッチングID" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="总数量" prop="totalNum">
          <el-input v-model="form.totalNum" placeholder="请输入总数量" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="总金额" prop="totalPrice">
          <el-input v-model="form.totalPrice" placeholder="请输入总金额" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="优惠金额" prop="discountPrice">
          <el-input v-model="form.discountPrice" placeholder="请输入优惠金额" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="支払い金額" prop="actualPrice">
          <el-input v-model="form.actualPrice" placeholder="请输入支払い金額" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="保证金" prop="bondPrice">
          <el-input v-model="form.bondPrice" placeholder="请输入保证金" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="优惠券编号" prop="couponId">
          <el-input v-model="form.couponId" placeholder="请输入优惠券编号" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="实付积分" prop="integral">
          <el-input v-model="form.integral" placeholder="请输入实付积分" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="运费" prop="freight">
          <el-input v-model="form.freight" placeholder="请输入运费" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="套餐编号" prop="packageId">
          <el-input v-model="form.packageId" placeholder="请输入套餐编号" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="配送时间" prop="sendTime">
          <el-date-picker clearable
                          v-model="form.sendTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择配送时间"  style="width:220px">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="配送箱数" prop="sendCnt">
          <el-input v-model="form.sendCnt" placeholder="请输入配送箱数" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="收货人" prop="people">
          <el-input v-model="form.people" placeholder="请输入收货人" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系电话" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="收货地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入收货地址" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="マンスリークリア方式" prop="payType">
          <el-select v-model="form.payType" placeholder="请选择マンスリークリア方式" style="width:220px">
            <el-option
              v-for="dict in dict.type.yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="時間払い賃金" prop="payTime">
          <el-date-picker clearable
                          v-model="form.payTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择時間払い賃金"  style="width:220px">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="发货人" prop="pushPeople">
          <el-input v-model="form.pushPeople" placeholder="请输入发货人" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="マッチングステータス" prop="orderStatus">
          <el-select v-model="form.orderStatus" placeholder="请选择マッチングステータス" style="width:220px">
            <el-option
              v-for="dict in dict.type.tb_order_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="仓库名称" prop="storehouse">
          <el-input v-model="form.storehouse" placeholder="请输入仓库名称" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="出発地" prop="startAddress">
          <el-input v-model="form.startAddress" placeholder="请输入出発地" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="目的地" prop="endAddress">
          <el-input v-model="form.endAddress" placeholder="请输入目的地" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="出発日時" prop="startTime">
          <el-date-picker clearable
                          v-model="form.startTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择出発日時"  style="width:220px">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="到着予定日時" prop="endTime">
          <el-date-picker clearable
                          v-model="form.endTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择到着予定日時"  style="width:220px">
          </el-date-picker>
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
        <el-descriptions-item label="ドライバー">
          {{ formDetails.driverName }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="プロセスid">-->
<!--          {{ formDetails.routeId }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="註文タイプ">
          <dict-tag
            :options="dict.type.pro_recharge_type"
            :value="formDetails.orderType"
          />
        </el-descriptions-item>
        <el-descriptions-item label="マッチングID">
          {{ formDetails.orderCode }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="总数量">-->
<!--          {{ formDetails.totalNum }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="总金额">-->
<!--          {{ formDetails.totalPrice }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="优惠金额">-->
<!--          {{ formDetails.discountPrice }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="支払い金額">
          {{ formDetails.actualPrice }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="保证金">-->
<!--          {{ formDetails.bondPrice }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="优惠券编号">-->
<!--          {{ formDetails.couponId }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="实付积分">-->
<!--          {{ formDetails.integral }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="运费">-->
<!--          {{ formDetails.freight }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="套餐编号">-->
<!--          {{ formDetails.packageId }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="配送时间">-->
<!--          {{ parseTime(formDetails.sendTime,'{y}-{m}-{d}') }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="配送箱数">-->
<!--          {{ formDetails.sendCnt }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="收货人">-->
<!--          {{ formDetails.people }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="联系电话">-->
<!--          {{ formDetails.phone }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="收货地址">-->
<!--          {{ formDetails.address }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="マンスリークリア方式">
          <dict-tag
            :options="dict.type.yes_no"
            :value="formDetails.payType"
          />
        </el-descriptions-item>
        <el-descriptions-item label="時間払い賃金">
          {{ parseTime(formDetails.payTime,'{y}-{m}-{d} {h}:{i}:{s}') }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="发货人">-->
<!--          {{ formDetails.pushPeople }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="マッチングステータス">
          <dict-tag
            :options="dict.type.tb_order_status"
            :value="formDetails.orderStatus"
          />
        </el-descriptions-item>
<!--        <el-descriptions-item label="仓库名称">-->
<!--          {{ formDetails.storehouse }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="出発地">
          {{ formDetails.startAddress }}
        </el-descriptions-item>
        <el-descriptions-item label="目的地">
          {{ formDetails.endAddress }}
        </el-descriptions-item>
        <el-descriptions-item label="出発日時">
          {{ parseTime(formDetails.startTime,'{y}-{m}-{d} {h}:{i}:{s}') }}
        </el-descriptions-item>
        <el-descriptions-item label="到着予定日時">
          {{ parseTime(formDetails.endTime,'{y}-{m}-{d} {h}:{i}:{s}') }}
        </el-descriptions-item>
      </el-descriptions>
      <el-descriptions class="margin-top" :column="1" border :labelStyle="labelStyle">
      </el-descriptions>
    </el-dialog>

  </div>
</template>

<script>
import { listProOrderInfo, getProOrderInfo, delProOrderInfo, addProOrderInfo, updateProOrderInfo } from "@/api/project/proOrderInfo";

export default {
  name: "ProOrderInfo",
  dicts: ['pro_recharge_type', 'tb_order_status', 'yes_no'],
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
      // 订单信息表格数据
      proOrderInfoList: [],
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
        driverId: null,
        routeId: null,
        orderType: null,
        orderCode: null,
        totalNum: null,
        totalPrice: null,
        discountPrice: null,
        actualPrice: null,
        bondPrice: null,
        couponId: null,
        integral: null,
        freight: null,
        packageId: null,
        sendTime: null,
        sendCnt: null,
        people: null,
        phone: null,
        address: null,
        payType: null,
        payTime: null,
        pushPeople: null,
        orderStatus: null,
        takeType: null,
        storehouse: null,
        startAddress: null,
        endAddress: null,
        startTime: null,
        endTime: null,
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
    /** 查询订单信息列表 */
    getList() {
      this.loading = true;
      listProOrderInfo(this.queryParams).then(response => {
        this.proOrderInfoList = response.rows;
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
        driverId: null,
        routeId: null,
        orderType: null,
        orderCode: null,
        totalNum: null,
        totalPrice: null,
        discountPrice: null,
        actualPrice: null,
        bondPrice: null,
        couponId: null,
        integral: null,
        freight: null,
        packageId: null,
        sendTime: null,
        sendCnt: null,
        people: null,
        phone: null,
        address: null,
        payType: null,
        payTime: null,
        pushPeople: null,
        orderStatus: null,
        takeType: null,
        storehouse: null,
        startAddress: null,
        endAddress: null,
        startTime: null,
        endTime: null,
        createTime: null,
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
      this.title = "添加订单信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getProOrderInfo(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateProOrderInfo(this.form).then(response => {
              this.$modal.msgSuccess("修正成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProOrderInfo(this.form).then(response => {
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
        return delProOrderInfo(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("削除成功");
      }).catch(() => {});
    },
    /** 詳細按钮操作 */
    handleDetails(row) {
      this.reset();
      const id = row.id || this.ids
      getProOrderInfo(id).then(response => {
        this.formDetails = response.data;
        this.openDetails = true;
        this.title = "詳細";
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.$modal.confirm('是否根据搜索条件导出所有数据？').then(() => {
        this.download('project/proOrderInfo/export', {
          ...this.queryParams
        }, `订单信息_${new Date().getTime()}.xlsx`)
      })
    }
  }
};
</script>
