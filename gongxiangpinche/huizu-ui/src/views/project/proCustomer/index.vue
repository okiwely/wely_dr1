<template>
  <div class="app-container">
    <!-- 查询栏 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="メールアドレス" prop="email">
        <el-input
          v-model="queryParams.email"
          placeholder=""
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="電話番号" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder=""
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="お名前" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder=""
          clearable
          @keyup.enter.native="handleQuery"
        />
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
<!--          v-hasPermi="['project:proCustomer:add']"-->
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
<!--          v-hasPermi="['project:proCustomer:edit']"-->
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
<!--          v-hasPermi="['project:proCustomer:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['project:proCustomer:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 会员信息表格数据列表 -->
    <el-table v-loading="loading" :data="proCustomerList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="ユーザータイプ" align="center" prop="type">-->
<!--        <template slot-scope="scope">-->
<!--          <dict-tag :options="dict.type.pro_customer_type" :value="scope.row.type"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="アイコン" align="center" prop="avatar" width="100">
        <template slot-scope="scope">
          <image-preview v-if="scope.row.avatar != null" :src="scope.row.avatar && scope.row.avatar.replace('wely.info', '54.92.100.72:9006')" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="お名前" align="center" prop="name" />
<!--      <el-table-column label="性别" align="center" prop="sex">-->
<!--        <template slot-scope="scope">-->
<!--          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sex"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="メールアドレス" align="center" prop="email" />
      <el-table-column label="電話番号" align="center" prop="phone" />
      <!-- <el-table-column label="余额" align="center" prop="money" />
      <el-table-column label="待提现金额" align="center" prop="integral" /> -->
<!--      <el-table-column label="省" align="center" prop="province" />-->
<!--      <el-table-column label="都道府県" align="center" prop="city" />-->
<!--      <el-table-column label="主要出发地址" align="center" prop="address" />-->
<!--      <el-table-column label="经纬度" align="center" prop="lonLat" />-->
<!--      <el-table-column label="名乗する" align="center" prop="content" />-->
<!--      <el-table-column label="是否是司机" align="center" prop="isDriver">-->
<!--        <template slot-scope="scope">-->
<!--          <dict-tag :options="dict.type.yes_no" :value="scope.row.isDriver"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="運転免許証" align="center" prop="drivingLicense" width="100">-->
<!--        <template slot-scope="scope">-->
<!--          <image-preview v-if="scope.row.drivingLicense != null" :src="scope.row.drivingLicense" :width="50" :height="50"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="車検証" align="center" prop="insurance" width="100">-->
<!--        <template slot-scope="scope">-->
<!--          <image-preview v-if="scope.row.insurance != null" :src="scope.row.insurance" :width="50" :height="50"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="自動車保険証" align="center" prop="insuranceCertificate" width="100">-->
<!--        <template slot-scope="scope">-->
<!--          <image-preview v-if="scope.row.insuranceCertificate != null" :src="scope.row.insuranceCertificate" :width="50" :height="50"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
         <el-button
           size="mini"
           type="text"
           icon="el-icon-edit"
           @click="handleUpdate(scope.row)"
           v-hasPermi="['project:proCustomer:edit']"
         >編集</el-button>
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['project:proCustomer:remove']"-->
<!--          >删除</el-button>-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleWithdraw(scope.row)"
            v-show="scope.row.integral > 0"
          >引き出し</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleAuditDetails(scope.row)"
            v-show="scope.row.audit != '' && scope.row.audit != null"
          >個人書類</el-button>
          <el-button
            icon="el-icon-check"
            size="mini"
            type="text"
            @click="handlePass(scope.row)"
            v-show="scope.row.audit == '0'"
          >承認
          </el-button>
          <el-button
            icon="el-icon-close"
            size="mini"
            type="text"
            @click="handleNoPass(scope.row)"
            v-show="scope.row.audit == '0'"
          >審査不可
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleDetails(scope.row)"
            v-hasPermi="['project:proCustomer:details']"
          >詳細</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleCar(scope.row)"
            v-show="scope.row.isDriver == 1"
          >車種</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleAppraise(scope.row)"
          >評価</el-button>
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
    <!-- 添加或修改会员信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="130px" inline>
        <!-- <el-form-item label="ユーザータイプ" prop="type">
          <el-select v-model="form.type" placeholder="選択をお願いしますユーザータイプ" style="width:220px">
            <el-option
              v-for="dict in dict.type.pro_customer_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item> -->
        <el-form-item label="お名前" prop="name">
          <el-input v-model="form.name" placeholder="一度入力してくださいお名前" maxlength="100" style="width:220px"/>
        </el-form-item>
        <!-- <el-form-item label="昵称" prop="nickName">
          <el-input v-model="form.nickName" placeholder="一度入力してください昵称" maxlength="100" style="width:220px"/>
        </el-form-item> -->
        <!-- <el-form-item label="极光账号" prop="jimName">
          <el-input v-model="form.jimName" placeholder="一度入力してください极光账号" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-select v-model="form.sex" placeholder="選択をお願いします性别" style="width:220px">
            <el-option
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="年龄" prop="age">
          <el-input v-model="form.age" placeholder="一度入力してください年龄" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="工龄" prop="workingAge">
          <el-input v-model="form.workingAge" placeholder="一度入力してください工龄" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="身高" prop="height">
          <el-input v-model="form.height" placeholder="一度入力してください身高" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="体重" prop="weight">
          <el-input v-model="form.weight" placeholder="一度入力してください体重" maxlength="100" style="width:220px"/>
        </el-form-item> -->
        <el-form-item label="メールアドレス" prop="email">
          <el-input v-model="form.email" placeholder="一度入力してくださいメールアドレス" maxlength="100" style="width:220px"/>
        </el-form-item>
        <!-- <el-form-item label="银行卡" prop="bank">
          <el-input v-model="form.bank" placeholder="一度入力してください银行卡" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="身份证号" prop="number">
          <el-input v-model="form.number" placeholder="一度入力してください身份证号" maxlength="100" style="width:220px"/>
        </el-form-item> -->
        <el-form-item label="電話番号" prop="phone">
          <el-input v-model="form.phone" placeholder="一度入力してください電話番号" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="パスワード" prop="password">
          <el-input v-model="form.password" placeholder="一度入力してください密码" maxlength="100" style="width:220px"/>
        </el-form-item>
        <!-- <el-form-item label="レビューの点数" prop="score">
          <el-input v-model="form.score" placeholder="一度入力してくださいレビューの点数" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="乘车次数" prop="carTotal">
          <el-input v-model="form.carTotal" placeholder="一度入力してください乘车次数" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="回复率" prop="rate">
          <el-input v-model="form.rate" placeholder="一度入力してください回复率" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="最终在线时间" prop="onLineTime">
          <el-date-picker clearable
            v-model="form.onLineTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="選択をお願いします最终在线时间"  style="width:220px">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="登录日期" prop="loginDate">
          <el-date-picker clearable
            v-model="form.loginDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="選択をお願いします登录日期"  style="width:220px">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="省" prop="province">
          <el-input v-model="form.province" placeholder="一度入力してください省" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="省编号" prop="provinceCode">
          <el-input v-model="form.provinceCode" placeholder="一度入力してください省编号" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="都道府県" prop="city">
          <el-input v-model="form.city" placeholder="一度入力してください都道府県" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="都道府県编号" prop="cityCode">
          <el-input v-model="form.cityCode" placeholder="一度入力してください都道府県编号" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="市区町村" prop="area">
          <el-input v-model="form.area" placeholder="一度入力してください市区町村" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="市区町村编号" prop="areaCode">
          <el-input v-model="form.areaCode" placeholder="一度入力してください市区町村编号" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="主要出发地址" prop="address">
          <el-input v-model="form.address" placeholder="一度入力してください主要出发地址" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="经纬度" prop="lonLat">
          <el-input v-model="form.lonLat" placeholder="一度入力してください经纬度" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="当前位置" prop="currentAddress">
          <el-input v-model="form.currentAddress" placeholder="一度入力してください当前位置" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="邀请码" prop="code">
          <el-input v-model="form.code" placeholder="一度入力してください邀请码" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="微信openid" prop="openId">
          <el-input v-model="form.openId" placeholder="一度入力してください微信openid" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="分享码" prop="qrcode">
          <el-input v-model="form.qrcode" placeholder="一度入力してください分享码" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="上级邀请码" prop="proCode">
          <el-input v-model="form.proCode" placeholder="一度入力してください上级邀请码" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="上级编号" prop="upId">
          <el-input v-model="form.upId" placeholder="一度入力してください上级编号" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="余额" prop="money">
          <el-input v-model="form.money" placeholder="一度入力してください余额" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="积分" prop="integral">
          <el-input v-model="form.integral" placeholder="一度入力してください积分" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="开始日期" prop="startTime">
          <el-date-picker clearable
            v-model="form.startTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="選択をお願いします开始日期"  style="width:220px">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="到期日期" prop="endTime">
          <el-date-picker clearable
            v-model="form.endTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="選択をお願いします到期日期"  style="width:220px">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="开通状态" prop="openFlag">
          <el-input v-model="form.openFlag" placeholder="一度入力してください开通状态" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="观看状态" prop="watchFlag">
          <el-input v-model="form.watchFlag" placeholder="一度入力してください观看状态" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="推流地址" prop="pushUrl">
          <el-input v-model="form.pushUrl" placeholder="一度入力してください推流地址" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="保证金" prop="bond">
          <el-input v-model="form.bond" placeholder="一度入力してください保证金" maxlength="100" style="width:220px"/>
        </el-form-item>
        <el-form-item label="是否支付保证金" prop="bondFlag">
          <el-select v-model="form.bondFlag" placeholder="選択をお願いします是否支付保证金" style="width:220px">
            <el-option
              v-for="dict in dict.type.yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否签署合同" prop="contractFlag">
          <el-select v-model="form.contractFlag" placeholder="選択をお願いします是否签署合同" style="width:220px">
            <el-option
              v-for="dict in dict.type.yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否认证" prop="isAuth">
          <el-select v-model="form.isAuth" placeholder="選択をお願いします是否认证" style="width:220px">
            <el-option
              v-for="dict in dict.type.yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否是司机" prop="isDriver">
          <el-select v-model="form.isDriver" placeholder="選択をお願いします是否是司机" style="width:220px">
            <el-option
              v-for="dict in dict.type.yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="启用状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_open_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item> -->

        <!-- <el-form-item label="アイコン地址" prop="avatar">
          <image-upload v-model="form.avatar"/>
        </el-form-item> -->
<!--        <el-form-item label="名乗する">-->
<!--          <editor v-model="form.content" :min-height="192" style="width:580px"/>-->
<!--        </el-form-item>-->
        <!-- <el-form-item label="协议" prop="bondFile">
          <file-upload v-model="form.bondFile"/>
        </el-form-item> -->
        <!-- <el-form-item label="運転免許証" prop="drivingLicense">
          <image-upload v-model="form.drivingLicense"/>
        </el-form-item>
        <el-form-item label="車検証" prop="insurance">
          <image-upload v-model="form.insurance"/>
        </el-form-item>
        <el-form-item label="自動車保険証" prop="insuranceCertificate">
          <image-upload v-model="form.insuranceCertificate"/>
        </el-form-item>
        <el-form-item label="自己紹介" prop="content">
          <el-input v-model="form.content" type="textarea" placeholder="一度入力してください内容"  maxlength="500" show-word-limit style="width:580px"/>
        </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">確認</el-button>
        <el-button @click="cancel">キャンセル</el-button>
      </div>
    </el-dialog>

    <!--详情弹窗-->
    <el-dialog :title="title" :visible.sync="openDetails" width="900px" append-to-body>
      <el-descriptions class="margin-top" :model="formDetails" :column="2" border :labelStyle="labelStyle" :contentStyle="contentStyle">
        <el-descriptions-item label="ユーザータイプ">
          <dict-tag
              :options="dict.type.pro_customer_type"
              :value="formDetails.type"
          />
        </el-descriptions-item>
        <el-descriptions-item label="お名前">
          {{ formDetails.name }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="昵称">-->
<!--          {{ formDetails.nickName }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="极光账号">-->
<!--          {{ formDetails.jimName }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="性别">
          <dict-tag
              :options="dict.type.sys_user_sex"
              :value="formDetails.sex"
          />
        </el-descriptions-item>
<!--        <el-descriptions-item label="年龄">-->
<!--          {{ formDetails.age }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="工龄">-->
<!--          {{ formDetails.workingAge }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="身高">-->
<!--          {{ formDetails.height }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="体重">-->
<!--          {{ formDetails.weight }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="メールアドレス">
          {{ formDetails.email }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="银行卡">-->
<!--          {{ formDetails.bank }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="身份证号">-->
<!--          {{ formDetails.number }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="電話番号">
          {{ formDetails.phone }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="密码">-->
<!--          {{ formDetails.password }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="レビューの点数">
          {{ formDetails.score }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="乘车次数">-->
<!--          {{ formDetails.carTotal }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="回复率">-->
<!--          {{ formDetails.rate }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="最终在线时间">-->
<!--          {{ parseTime(formDetails.onLineTime,'{y}-{m}-{d}') }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="登录日期">-->
<!--          {{ parseTime(formDetails.loginDate,'{y}-{m}-{d}') }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="省">-->
<!--          {{ formDetails.province }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="省编号">-->
<!--          {{ formDetails.provinceCode }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="都道府県">
          {{ formDetails.city }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="都道府県编号">-->
<!--          {{ formDetails.cityCode }}-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="市区町村">
          {{ formDetails.area }}
        </el-descriptions-item>
<!--        <el-descriptions-item label="市区町村编号">-->
<!--          {{ formDetails.areaCode }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="主要出发地址">-->
<!--          {{ formDetails.address }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="经纬度">-->
<!--          {{ formDetails.lonLat }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="当前位置">-->
<!--          {{ formDetails.currentAddress }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="邀请码">-->
<!--          {{ formDetails.code }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="微信openid">-->
<!--          {{ formDetails.openId }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="分享码">-->
<!--          {{ formDetails.qrcode }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="上级邀请码">-->
<!--          {{ formDetails.proCode }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="上级编号">-->
<!--          {{ formDetails.upId }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="余额">-->
<!--          {{ formDetails.money }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="积分">-->
<!--          {{ formDetails.integral }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="开始日期">-->
<!--          {{ parseTime(formDetails.startTime,'{y}-{m}-{d}') }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="到期日期">-->
<!--          {{ parseTime(formDetails.endTime,'{y}-{m}-{d}') }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="开通状态">-->
<!--          {{ formDetails.openFlag }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="观看状态">-->
<!--          {{ formDetails.watchFlag }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="推流地址">-->
<!--          {{ formDetails.pushUrl }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="保证金">-->
<!--          {{ formDetails.bond }}-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="是否支付保证金">-->
<!--          <dict-tag-->
<!--              :options="dict.type.yes_no"-->
<!--              :value="formDetails.bondFlag"-->
<!--          />-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="是否签署合同">-->
<!--          <dict-tag-->
<!--              :options="dict.type.yes_no"-->
<!--              :value="formDetails.contractFlag"-->
<!--          />-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="协议">-->
<!--          <el-button type="info"  size="small" v-if="formDetails.bondFile != null" @click="downloadFile(formDetails.bondFile)">下载</el-button>-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="是否认证">-->
<!--          <dict-tag-->
<!--              :options="dict.type.yes_no"-->
<!--              :value="formDetails.isAuth"-->
<!--          />-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="是否是司机">-->
<!--          <dict-tag-->
<!--              :options="dict.type.yes_no"-->
<!--              :value="formDetails.isDriver"-->
<!--          />-->
<!--        </el-descriptions-item>-->
<!--        <el-descriptions-item label="启用状态">-->
<!--          <dict-tag-->
<!--              :options="dict.type.sys_open_status"-->
<!--              :value="formDetails.status"-->
<!--          />-->
<!--        </el-descriptions-item>-->
      </el-descriptions>
      <el-descriptions class="margin-top" :column="1" border :labelStyle="labelStyle">
        <el-descriptions-item label="アイコン">
          <image-preview :src="formDetails.avatar && formDetails.avatar.replace('wely.info', '54.92.100.72:9006')" :width="50" :height="50"/>
        </el-descriptions-item>
<!--        <el-descriptions-item label="名乗する">-->
<!--          <p class="wrapper" v-html='formDetails.content'></p>-->
<!--        </el-descriptions-item>-->
        <el-descriptions-item label="運転免許証">
          <image-preview v-if="formDetails.drivingLicense!=null && formDetails.drivingLicense!=''" :src="formDetails.drivingLicense && formDetails.drivingLicense.replace('wely.info', '54.92.100.72:9006')" :width="50" :height="50"/>
        </el-descriptions-item>
        <el-descriptions-item label="車検証">
          <image-preview v-if="formDetails.insurance!=null && formDetails.insurance!=''" :src="formDetails.insurance && formDetails.insurance.replace('wely.info', '54.92.100.72:9006')" :width="50" :height="50"/>
        </el-descriptions-item>
        <el-descriptions-item label="自動車保険証">
          <image-preview v-if="formDetails.insuranceCertificate!=null && formDetails.insuranceCertificate!=''" :src="formDetails.insuranceCertificate && formDetails.insuranceCertificate.replace('wely.info', '54.92.100.72:9006')" :width="50" :height="50"/>
        </el-descriptions-item>
        <el-descriptions-item label="自己紹介">
          {{ formDetails.content }}
        </el-descriptions-item>
      </el-descriptions>
    </el-dialog>
    <!--认证信息-->
    <el-dialog :title="title" :visible.sync="openAuditDetails" width="900px" append-to-body>
      <el-descriptions class="margin-top" :column="1" border :labelStyle="labelStyle">
        <el-descriptions-item label="個人書類">
          <image-preview :src="formDetails.numberImage && formDetails.numberImage.replace('wely.info', '54.92.100.72:9006')" :width="50" :height="50"/>
        </el-descriptions-item>
      </el-descriptions>
    </el-dialog>
    <!--提现信息-->
    <el-dialog :title="title" :visible.sync="openWithdraw" width="900px" append-to-body>
      <el-descriptions class="margin-top" :column="2" border :labelStyle="labelStyle">
        <!-- <el-descriptions-item label="待提现金额">
          {{ formDetails.integral }}
        </el-descriptions-item> -->
        <el-descriptions-item label="金額">
          {{ formDetails.realIntegral }}
        </el-descriptions-item>
        <!-- <el-descriptions-item label="平台佣金（20%）">
          {{ formDetails.brokerage }}
        </el-descriptions-item> -->
         <el-descriptions-item label="電話番号">
          {{ formDetails.phone }}
        </el-descriptions-item>
        <!-- <el-descriptions-item label="卡名">
          {{ formDetails.name }}
        </el-descriptions-item>
        <el-descriptions-item label="卡号">
          {{ formDetails.cardNo }}
        </el-descriptions-item>
        <el-descriptions-item label="日期">
          {{ formDetails.expire }}
        </el-descriptions-item> -->
      </el-descriptions>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitWithdraw">確定</el-button>
        <el-button  @click="submitUnWithdraw">取り消す</el-button>
        <!-- <el-button @click="cancel">取り消す</el-button> -->
      </div>
    </el-dialog>
    <!--車種弹窗-->
    <el-dialog :title="title" :visible.sync="openCar" width="900px" append-to-body>
      <el-descriptions class="margin-top" :model="formCar" :column="2" border :labelStyle="labelStyle" :contentStyle="contentStyle">
        <el-descriptions-item label="車種">
          {{ formCar.info }}
        </el-descriptions-item>
        <el-descriptions-item label="ガソリンタイプ">
          <dict-tag
            :options="dict.type.tb_car_gasoline"
            :value="formCar.gasoline"
          />
        </el-descriptions-item>
        <el-descriptions-item label="排気量">
          <dict-tag
            :options="dict.type.car_cc"
            :value="formCar.carCc"
          />
        </el-descriptions-item>
        <el-descriptions-item label="乗車人数">
          <dict-tag
            :options="dict.type.tb_car_total"
            :value="formCar.total"
          />
        </el-descriptions-item>
        <el-descriptions-item label="ETC">
          <dict-tag
            :options="dict.type.yes_no"
            :value="formCar.isEtc"
          />
        </el-descriptions-item>
        <!--        <el-descriptions-item label="制造商">-->
        <!--          {{ formCar.manufacturer }}-->
        <!--        </el-descriptions-item>-->
        <!--        <el-descriptions-item label="模型">-->
        <!--          {{ formCar.model }}-->
        <!--        </el-descriptions-item>-->
        <!--        <el-descriptions-item label="颜色">-->
        <!--          {{ formCar.color }}-->
        <!--        </el-descriptions-item>-->
        <!--        <el-descriptions-item label="年代">-->
        <!--          {{ formCar.decade }}-->
        <!--        </el-descriptions-item>-->
        <!--        <el-descriptions-item label="是否有导航仪">-->
        <!--          <dict-tag-->
        <!--              :options="dict.type.yes_no"-->
        <!--              :value="formCar.isNavigation"-->
        <!--          />-->
        <!--        </el-descriptions-item>-->
        <!--        <el-descriptions-item label="状态">-->
        <!--          <dict-tag-->
        <!--              :options="dict.type.sys_open_status"-->
        <!--              :value="formCar.status"-->
        <!--          />-->
        <!--        </el-descriptions-item>-->
      </el-descriptions>
<!--      <el-descriptions class="margin-top" :column="1" border :labelStyle="labelStyle">-->
<!--        <el-descriptions-item label="自己紹介">-->
<!--          {{ formCar.content }}-->
<!--        </el-descriptions-item>-->
<!--      </el-descriptions>-->
    </el-dialog>
    <!--評論-->
    <el-dialog :title="title" :visible.sync="openAppraise" width="900px" append-to-body>
      <el-table v-loading="loading" :data="appraiseList">
        <el-table-column label="ユーザー" align="center" prop="customerName" />
<!--        <el-table-column label="レビューの点数されたユーザー" align="center" prop="subName" />-->
        <el-table-column label="レビューの点数" align="center" prop="level" />
        <el-table-column label="レビューのコメント" align="center" prop="content" />
      </el-table>
    </el-dialog>

  </div>
</template>

<script>
import { listProCustomer, getProCustomer, delProCustomer, addProCustomer, updateProCustomer, auditCustomer,updateProCustomerWithdraw } from "@/api/project/proCustomer";
import { getCarByCustomerId } from "@/api/project/tbCustomerCar";
import { noPageListTbCustomerAppraise } from "@/api/project/tbCustomerAppraise";
import { getProCustomerCardByCustomerId } from "@/api/project/proCustomerCard";
import CryptoJS from "crypto-js";

export default {
  name: "ProCustomer",
  dicts: ['sys_open_status', 'pro_customer_type', 'sys_user_sex','tb_car_gasoline', 'yes_no','car_cc','tb_car_total'],
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
      // 会员信息表格数据
      proCustomerList: [],
      appraiseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetails: false,
      openAuditDetails: false,
      openCar: false,
      openAppraise: false,
      openWithdraw: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 100,
        type: null,
        avatar: null,
        name: null,
        nickName: null,
        jimName: null,
        sex: null,
        age: null,
        workingAge: null,
        height: null,
        weight: null,
        email: null,
        bank: null,
        number: null,
        phone: null,
        password: null,
        score: null,
        carTotal: null,
        rate: null,
        onLineTime: null,
        loginDate: null,
        province: null,
        provinceCode: null,
        city: null,
        cityCode: null,
        area: null,
        areaCode: null,
        address: null,
        lonLat: null,
        currentAddress: null,
        code: null,
        openId: null,
        qrcode: null,
        proCode: null,
        upId: null,
        money: null,
        integral: null,
        startTime: null,
        endTime: null,
        openFlag: null,
        watchFlag: null,
        pushUrl: null,
        bond: null,
        bondFlag: null,
        contractFlag: null,
        bondFile: null,
        isAuth: null,
        isDriver: null,
      },
      // 表单参数
      form: {},
      formDetails: {},
      formCar: {},
      // 表单校验
      rules: {
        password: [
          { required: true, message: "密码不能为空", trigger: "blur" }
        ],
        money: [
          { required: true, message: "余额不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询会员信息列表 */
    getList() {
      this.loading = true;
      listProCustomer(this.queryParams).then(response => {
        this.proCustomerList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.openDetails = false;
      this.openWithdraw = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        type: null,
        avatar: null,
        name: null,
        nickName: null,
        jimName: null,
        sex: null,
        age: null,
        workingAge: null,
        height: null,
        weight: null,
        email: null,
        bank: null,
        number: null,
        phone: null,
        password: null,
        score: null,
        carTotal: null,
        rate: null,
        onLineTime: null,
        loginDate: null,
        province: null,
        provinceCode: null,
        city: null,
        cityCode: null,
        area: null,
        areaCode: null,
        address: null,
        lonLat: null,
        currentAddress: null,
        content: null,
        code: null,
        openId: null,
        qrcode: null,
        proCode: null,
        upId: null,
        money: null,
        integral: null,
        startTime: null,
        endTime: null,
        openFlag: null,
        watchFlag: null,
        pushUrl: null,
        bond: null,
        bondFlag: null,
        contractFlag: null,
        bondFile: null,
        isAuth: null,
        isDriver: null,
        drivingLicense: null,
        insurance: null,
        insuranceCertificate: null,
        status: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        content: null,
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
      this.title = "添加会员信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getProCustomer(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "詳細";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 在提交前对密码进行MD5加密
          if (this.form.password && this.form.password.length!==32) {
           
            // this.form.password = CryptoJS.MD5(this.form.password).toString().toUpperCase();
            // 正确使用 CryptoJS.MD5 并将结果转换为十六进制
            // if(this.form.password.length!==16){

            // }
           this.form.password = CryptoJS.MD5(this.form.password).toString(CryptoJS.enc.Hex).toUpperCase();

            
          }
          
          if (this.form.id != null) {
            updateProCustomer(this.form).then(response => {
              this.$modal.msgSuccess("修正成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProCustomer(this.form).then(response => {
              this.$modal.msgSuccess("新たに成功します。");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    // submitForm() {
    //   this.$refs["form"].validate(valid => {
    //     if (valid) {
    //       if (this.form.id != null) {
    //         updateProCustomer(this.form).then(response => {
    //           this.$modal.msgSuccess("修正成功");
    //           this.open = false;
    //           this.getList();
    //         });
    //       } else {
    //         addProCustomer(this.form).then(response => {
    //           this.$modal.msgSuccess("新たに成功します。");
    //           this.open = false;
    //           this.getList();
    //         });
    //       }
    //     }
    //   });
    // },
    submitUnWithdraw(){
      this.formDetails.money =  this.formDetails.integral
      updateProCustomerWithdraw(this.formDetails).then(response => {
        this.$modal.msgSuccess("修正成功");
        this.openWithdraw = false;
        this.getList();
      });
    },
    submitWithdraw() {
      updateProCustomerWithdraw(this.formDetails).then(response => {
        this.$modal.msgSuccess("修正成功");
        this.openWithdraw = false;
        this.getList();
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('削除を確認しますか？').then(function() {
        return delProCustomer(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("削除成功");
      }).catch(() => {});
    },
    /** 详情按钮操作 */
    handleDetails(row) {
      this.reset();
      const id = row.id || this.ids
      getProCustomer(id).then(response => {
        this.formDetails = response.data;
        this.openDetails = true;
        this.title = "ユーザー詳細";
      });
    },
    /** 详情按钮操作 */
    handleAuditDetails(row) {
      this.reset();
      const id = row.id || this.ids
      getProCustomer(id).then(response => {
        this.formDetails = response.data;
        this.openAuditDetails = true;
        this.title = "個人書類";
      });
    },
    /** 車種詳細按钮操作 */
    handleCar(row) {
      this.reset();
      const id = row.id || this.ids
      getCarByCustomerId(id).then(response => {
        this.formCar = response.data;
        this.openCar = true;
        this.title = "車両情報詳細";
      });
    },
    /** 評価按钮操作 */
    handleAppraise(row) {
      this.reset();
      const id = row.id || this.ids
      noPageListTbCustomerAppraise({
        subId: id
      }).then(response => {
        this.appraiseList = response.data;
        this.openAppraise = true;
        this.title = " 評価";
      });
    },
    /** 通过 */
    handlePass(row) {
      row.audit = '1';
      row.isAuth = '1';
      auditCustomer(row).then(response => {
        this.$modal.msgSuccess("審査が通");
        this.getList();
      });
    },
    /** 不通过 */
    handleNoPass(row) {
      row.audit = '2';
      row.isAuth = '0';
      auditCustomer(row).then(response => {
        this.$modal.msgError("審査不可としました");
        this.getList();
      });
    },
    /** 提现按钮 */
    handleWithdraw(row) {
      this.reset();
      const id = row.id || this.ids
      getProCustomer(id).then(response => {
        this.formDetails = response.data;
        this.formDetails.realIntegral = Math.floor(this.formDetails.integral/1.2);
        this.formDetails.brokerage = this.formDetails.integral - this.formDetails.realIntegral;
        getProCustomerCardByCustomerId(id).then(res => {
          // this.formDetails.cardNo = res.data.cardNo
          // this.formDetails.expire = res.data.expire
          this.openWithdraw = true
          this.title = "引き出し";
        });
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.$modal.confirm('是否根据搜索条件导出所有数据？').then(() => {
         this.download('project/proCustomer/export', {
              ...this.queryParams
         }, `会员信息_${new Date().getTime()}.xlsx`)
      })
    }
  }
};
</script>
