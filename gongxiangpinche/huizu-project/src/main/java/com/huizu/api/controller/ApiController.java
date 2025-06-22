package com.huizu.api.controller;

import com.alibaba.fastjson2.JSONObject;
import com.huizu.api.service.ApiService;
import com.huizu.common.aliyun.AliyunFileUtils;
import com.huizu.common.config.HuiZuConfig;
import com.huizu.common.config.WeChatConfig;
import com.huizu.common.core.controller.BaseController;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.common.core.domain.entity.DictData;
import com.huizu.common.core.domain.entity.SysDictData;
import com.huizu.common.core.redis.RedisCache;
import com.huizu.common.enums.CommonEunm;
import com.huizu.common.message.SendMessageUtils;
import com.huizu.common.message.SendSmsUtil;
import com.huizu.common.utils.CRCUtils;
import com.huizu.common.utils.DictUtils;
import com.huizu.common.utils.GetPostUntil;
import com.huizu.common.utils.StringUtils;
import com.huizu.common.utils.file.FileUploadUtils;
import com.huizu.common.utils.file.FileUtils;
import com.huizu.common.utils.qiyuesuo.QiYueSuoUtils;
import com.huizu.project.utils.SMSUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
@RequestMapping("/api")
public class ApiController extends BaseController {
    @Autowired
    protected RedisCache redis;
    @Autowired
    private ApiService apiService;

    // TODO 会员模块

    /**
     * 获取小程序openid
     *
     * @param map
     * @param response
     * @return
     */
    @PostMapping("/getOpenId")
    public AjaxResult getOpenId(@RequestBody Map<String, Object> map, HttpServletResponse response) {
        JSONObject jsonObject = mapToJson(map);
        if (jsonObject == null || StringUtils.isBlank(jsonObject.getString("code"))) {
            return AjaxResult.error("参数不能为空");
        } else {
            String code = jsonObject.getString("code");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "GET,POST");
            String wxLoginUrl = "https://api.weixin.qq.com/sns/jscode2session";
            String param = "appid=" + WeChatConfig.getAppid() + "&secret=" + WeChatConfig.getSecret() + "&js_code=" + code + "&grant_type=authorization_code";
            String jsonString = GetPostUntil.sendGet(wxLoginUrl, param);
            JSONObject json = JSONObject.parseObject(jsonString);
            System.err.println(JSONObject.toJSONString(json));
            if (json == null || StringUtils.isBlank(json.getString("openid"))) {
                return AjaxResult.error("微信code已过期，请重新进入页面获取");
            } else {
                String openid = json.getString("openid");
                System.out.println("====================================openid======================================");
                System.err.println(openid);
                System.out.println("==========================================================================================");
                jsonObject.put("openid", json.getString("openid"));
                System.err.println(JSONObject.toJSONString(jsonObject));
                return AjaxResult.success(jsonObject);
            }
        }
    }

    /**
     * 用户注册
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/register")
    public AjaxResult register(@RequestBody JSONObject jsonObject) {
        return apiService.register(jsonObject);
    }

    /**
     * 微信注册
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/wxRegister")
    public AjaxResult wxRegister(@RequestBody JSONObject jsonObject) {
        return apiService.wxRegister(jsonObject);
    }

    /**
     * 微信拉取手机号
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/wxPhone")
    public AjaxResult wxPhone(@RequestBody JSONObject jsonObject) {
        return apiService.wxPhone(jsonObject);
    }

    /**
     * 账号登陆
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody JSONObject jsonObject) {
        return apiService.login(jsonObject);
    }

    /**
     * 短信登陆
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/loginBySms")
    public AjaxResult loginBySms(@RequestBody JSONObject jsonObject) {
        return apiService.loginBySms(jsonObject);
    }

    /**
     * 提交入驻申请
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/userAudit")
    public AjaxResult userAudit(@RequestBody JSONObject jsonObject) {
        return apiService.userAudit(jsonObject);
    }

    /**
     * 查询客户类型申请状态
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getCustomerStatus")
    public AjaxResult getCustomerStatus(@RequestBody JSONObject jsonObject) {
        return apiService.getCustomerStatus(jsonObject);
    }

    /**
     * 找回密码
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/updatePassword")
    public AjaxResult updatePassword(@RequestBody JSONObject jsonObject) {
        return apiService.updatePassword(jsonObject);
    }

    /**
     * 修改密码
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/modifyPassword")
    public AjaxResult modifyPassword(@RequestBody JSONObject jsonObject) {
        return apiService.modifyPassword(jsonObject);
    }

    /**
     * 完善资料
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/updateCustomer")
    public AjaxResult updateCustomer(@RequestBody JSONObject jsonObject) {
        return apiService.updateCustomer(jsonObject);
    }

    /**
     * 获取字典类型数据列表
     *
     * @return
     */
    @PostMapping("/dictData")
    public AjaxResult dictData(@RequestBody JSONObject jsonObject) {
        String type = jsonObject.getString("type");
        List<SysDictData> dictData = DictUtils.getDictCache(type);
        if (dictData == null || dictData.size() == 0) {
            return AjaxResult.error("该类型不存在");
        }
        List<DictData> data = dictData.stream().map(DictData::new).collect(Collectors.toList());
        return AjaxResult.success(data);
    }

    /**
     * 交保证金
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/createCustomerSign")
    public AjaxResult createCustomerSign(@RequestBody JSONObject jsonObject) {
        return apiService.createCustomerSign(jsonObject);
    }

    /**
     * 改签署状态
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/updateContractFlag")
    public AjaxResult updateContractFlag(@RequestBody JSONObject jsonObject) {
        return apiService.updateContractFlag(jsonObject);
    }


    /**
     * 获取会员信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getCustomer")
    public AjaxResult getCustomer(@RequestBody JSONObject jsonObject) {
        return apiService.getCustomer(jsonObject);
    }
    /**
     * 获取会员信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getCustomerInfo")
    public AjaxResult getCustomerInfo(@RequestBody JSONObject jsonObject) {
        return apiService.getCustomerInfo(jsonObject);
    }
    /**
     * 会员实名认证
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/customerAuth")
    public AjaxResult customerAuth(@RequestBody JSONObject jsonObject) {
        return apiService.customerAuth(jsonObject);
    }

    /**
     * 获取服务商、合伙人中心信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getCustomerService")
    public AjaxResult getCustomerService(@RequestBody JSONObject jsonObject) {
        return AjaxResult.success(apiService.getCustomerService(jsonObject));
    }
    /**
     * 合伙人设备数量
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getSpecsCnt")
    public AjaxResult getSpecsCnt(@RequestBody JSONObject jsonObject) {
        return apiService.getSpecsCnt(jsonObject);
    }
    /**
     * 添加客户信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/addCustomer")
    public AjaxResult addCustomer(@RequestBody JSONObject jsonObject) {
        return AjaxResult.success(apiService.addCustomer(jsonObject));
    }

    /**
     * 获取分享信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getCustomerShare")
    public AjaxResult getCustomerShare(@RequestBody JSONObject jsonObject) {
        return AjaxResult.success(apiService.getCustomerShare(jsonObject));
    }

    /**
     * 获取粉丝信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getFans")
    public AjaxResult getFans(@RequestBody JSONObject jsonObject) {
        return apiService.getFans(jsonObject);
    }

    /**
     * 获取间推信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getTwoFans")
    public AjaxResult getTwoFans(@RequestBody JSONObject jsonObject) {
        return apiService.getTwoFans(jsonObject);
    }

    /**
     * 上传图片
     *
     * @param file
     * @return
     */
    @Transactional
    @PostMapping("/uploadImage")
    public AjaxResult uploadImage(@RequestParam(value = "file") MultipartFile file) {
        try {
            // 上传文件路径
            String filePath = HuiZuConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = HuiZuConfig.getUploadUrl() + fileName;
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("image", url);


//            String path = AliyunFileUtils.uploadFile(file);
//            JSONObject jsonObject = new JSONObject();
//            jsonObject.put("image", path);
            return AjaxResult.success(jsonObject);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("上传异常");
        }
    }

    // TODO 商品模块

    /**
     * 获取热门商品列表
     *
     * @return
     */
    @PostMapping("/getHotGoodsList")
    public AjaxResult getHotGoodsList(@RequestBody JSONObject jsonObject) {
        return apiService.getHotGoodsList(jsonObject);
    }
    /**
     * 获取商品分类
     *
     * @return
     */
    @PostMapping("/getGoodTypeList")
    public AjaxResult getGoodTypeList(@RequestBody JSONObject jsonObject) {
        return apiService.getGoodTypeList(jsonObject);
    }

    /**
     * 获取商品分类
     *
     * @return
     */
    @PostMapping("/getGoodTypeList2")
    public AjaxResult getGoodTypeList2(@RequestBody JSONObject jsonObject) {
        return apiService.getGoodTypeList2(jsonObject);
    }

    /**
     * 获取商品列表【首页】
     *
     * @return
     */
    @PostMapping("/getGoodInfoListByHomePage")
    public AjaxResult getGoodInfoListByHomePage(@RequestBody JSONObject jsonObject) {
        return apiService.getGoodInfoListByHomePage(jsonObject);
    }

    /**
     * 获取展示商品列表【首页】
     *
     * @return
     */
    @PostMapping("/getShowGoodInfoList")
    public AjaxResult getShowGoodInfoList(@RequestBody JSONObject jsonObject) {
        return apiService.getShowGoodInfoList(jsonObject);
    }

    /**
     * 获取商品列表
     *
     * @return
     */
    @PostMapping("/getGoodInfoList")
    public AjaxResult getGoodInfoList(@RequestBody JSONObject jsonObject) {
        return apiService.getGoodInfoList(jsonObject);
    }

    /**
     * 获取商品列表
     *
     * @return
     */
    @PostMapping("/getGoodInfoListByName")
    public AjaxResult getGoodInfoListByName(@RequestBody JSONObject jsonObject) {
        return apiService.getGoodInfoListByName(jsonObject);
    }

    /**
     * 获取商品详情
     *
     * @return
     */
    @PostMapping("/getGoodInfo")
    public AjaxResult getGoodInfo(@RequestBody JSONObject jsonObject) {
        return apiService.getGoodInfo(jsonObject);
    }

    /**
     * 获取商品下单页面
     *
     * @return
     */
    @PostMapping("/getGoodOrder")
    public AjaxResult getGoodOrder(@RequestBody JSONObject jsonObject) {
        return apiService.getGoodOrder(jsonObject);
    }

    /**
     * 领取优惠券列表
     *
     * @return
     */
    @PostMapping("/insertCoupon")
    public AjaxResult insertCoupon(@RequestBody JSONObject jsonObject) {
        return apiService.insertCoupon(jsonObject);
    }

    /**
     * 获取优惠券列表
     *
     * @return
     */
    @PostMapping("/getSysCouponList")
    public AjaxResult getSysCouponList() {
        return apiService.getSysCouponList();
    }

    /**
     * 获取我的优惠券列表
     *
     * @return
     */
    @PostMapping("/getCouponList")
    public AjaxResult getCouponList(@RequestBody JSONObject jsonObject) {
        return apiService.getCouponList(jsonObject);
    }

    /**
     * 获取优惠券数量
     *
     * @return
     */
    @PostMapping("/getCouponCnt")
    public AjaxResult getCouponCnt(@RequestBody JSONObject jsonObject) {
        return apiService.getCouponCnt(jsonObject);
    }

    // TODO 订单模块

    /**
     * 添加地址
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/addAddress")
    public AjaxResult addAddress(@RequestBody JSONObject jsonObject) {
        return apiService.addAddress(jsonObject);
    }

    /**
     * 修改地址
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/updateAddress")
    public AjaxResult updateAddress(@RequestBody JSONObject jsonObject) {
        return apiService.updateAddress(jsonObject);
    }

    /**
     * 删除地址
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/removeAddress")
    public AjaxResult removeAddress(@RequestBody JSONObject jsonObject) {
        return apiService.removeAddress(jsonObject);
    }

    /**
     * 获取地址列表
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getAddressList")
    public AjaxResult getAddressList(@RequestBody JSONObject jsonObject) {
        return apiService.getAddressList(jsonObject);
    }

    /**
     * 获取地址详情
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getAddressInfo")
    public AjaxResult getAddressInfo(@RequestBody JSONObject jsonObject) {
        return apiService.getAddressInfo(jsonObject);
    }

    /**
     * 获取订单列表
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getOrderList")
    public AjaxResult getOrderList(@RequestBody JSONObject jsonObject) {
        return apiService.getOrderList(jsonObject);
    }

    /**
     * 获取订单详情
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getOrderInfo")
    public AjaxResult getOrderInfo(@RequestBody JSONObject jsonObject) {
        return apiService.getOrderInfo(jsonObject);
    }

    /**
     * 提交订单
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/addOrder")
    public AjaxResult addOrder(@RequestBody JSONObject jsonObject) {
        return apiService.addOrder(jsonObject);
    }
    /**
     * 提交订单（paypal支付）
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/addOrderPayPal")
    public AjaxResult addOrderPayPal(@RequestBody JSONObject jsonObject) {
        return apiService.addOrderPayPal(jsonObject);
    }

    /**
     * paypal支付
     *
     * @return 返回结果
     */
    @PostMapping("/payPalNotify")
    @Deprecated
    public AjaxResult payPalNotify(@RequestBody JSONObject jsonObject){
        // 根据paypal的订单id，捕获订单付款
        String orderNo = jsonObject.getString("orderNo");
        String outOrderNo = jsonObject.getString("outOrderNo");
        String orderType = jsonObject.getString("orderType");

        // 校验该订单是否处理

        //进行二次验证
//        PayPalUtils payPalUtils = new PayPalUtils();
//        Boolean pay = payPalUtils.verifyOrderInfo(outOrderNo);
        //如果成功则执行后面的逻辑
//        if (pay){
//            boolean b = orderService.finishOrder(orderNo, orderType,payPalVo.getLanguage());
//            if (!b){
//                return ResponseModel.error(appConfigStatusCodeService.getStatusCode(payPalVo.getLanguage(), ResponseCnSate.ORDER_HANDLER_FAIL));
//            }
//            //保存订单号返回订单信息
//            PayOrderDto payOrderDto =orderService.saveAndGetOrderInfo(payPalVo.getUserId(),outOrderNo,orderNo);
//            if (ObjectUtils.isNotEmpty(payOrderDto)){
//                return ResponseModel.success(payOrderDto);
//            }
//            return ResponseModel.error(appConfigStatusCodeService.getStatusCode(payPalVo.getLanguage(), ResponseCnSate.RETURN_ORDER_INFO_FAIL));
//        }
        //失败返回提示
        return AjaxResult.success();
    }

    /**
     * 再次支付
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/payOrder")
    public AjaxResult payOrder(@RequestBody JSONObject jsonObject) {
        return apiService.payOrder(jsonObject);
    }

    /**
     * 订单续租
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/payOrder2")
    public AjaxResult payOrder2(@RequestBody JSONObject jsonObject) {
        return apiService.payOrder2(jsonObject);
    }


    /**
     * 订单退款申请
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/cancelOrderSubscribe")
    public AjaxResult cancelOrderSubscribe(@RequestBody JSONObject jsonObject) {
        return apiService.cancelOrderSubscribe(jsonObject);
    }

    /**
     * 获取正在拼团列表
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getGroupList")
    public AjaxResult getGroupList(@RequestBody JSONObject jsonObject) {
        return apiService.getGroupList(jsonObject);
    }

    /**
     * 获取拼团成功列表
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getSuccessGroupList")
    public AjaxResult getSuccessGroupList(@RequestBody JSONObject jsonObject) {
        return apiService.getSuccessGroupList(jsonObject);
    }

    /**
     * 修改订单信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/updateOrder")
    public AjaxResult updateOrder(@RequestBody JSONObject jsonObject) {
        return apiService.updateOrder(jsonObject);
    }

    /**
     * 修改订单状态
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/updateOrderStatus")
    public AjaxResult updateOrderStatus(@RequestBody JSONObject jsonObject) {
        return apiService.updateOrderStatus(jsonObject);
    }

    /**
     * 取消订单
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/cancelOrder")
    public AjaxResult cancelOrder(@RequestBody JSONObject jsonObject) {
        try {
            apiService.cancelOrder(jsonObject);
        } catch (Exception e) {
            return AjaxResult.error("取消订单失败");
        }
        return AjaxResult.success("取消订单成功");
    }

    /**
     * 删除订单
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/removeOrder")
    public AjaxResult removeOrder(@RequestBody JSONObject jsonObject) {
        return apiService.removeOrder(jsonObject);
    }

    /**
     * 添加评价信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/insertEvaluate")
    public AjaxResult insertEvaluate(@RequestBody JSONObject jsonObject) {
        return apiService.insertEvaluate(jsonObject);
    }

    /**
     * 获取运费
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getFreightByProvince")
    public AjaxResult getFreightByProvince(@RequestBody JSONObject jsonObject) {
        return apiService.getFreightByProvince(jsonObject);
    }

    /**
     * 获取评价列表
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getEvaluateList")
    public AjaxResult getEvaluateList(@RequestBody JSONObject jsonObject) {
        return apiService.getEvaluateList(jsonObject);
    }

    /**
     * 获取购物车
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getOrderCar")
    public AjaxResult getOrderCar(@RequestBody JSONObject jsonObject) {
        return apiService.getOrderCar(jsonObject);
    }

    /**
     * 提交购物车
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/addOrderCar")
    public AjaxResult addOrderCar(@RequestBody JSONObject jsonObject) {
        return apiService.addOrderCar(jsonObject);
    }

    /**
     * 修改购物车
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/updateOrderCar")
    public AjaxResult updateOrderCar(@RequestBody JSONObject jsonObject) {
        return apiService.updateOrderCar(jsonObject);
    }

    /**
     * 删除购物车
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/deleteOrderCar")
    public AjaxResult deleteOrderCar(@RequestBody JSONObject jsonObject) {
        return apiService.deleteOrderCar(jsonObject);
    }

    /**
     * 清空购物车
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/removeOrderCar")
    public AjaxResult removeOrderCar(@RequestBody JSONObject jsonObject) {
        return apiService.removeOrderCar(jsonObject);
    }

    /**
     * 获取物流列表
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getOrderExpressList")
    public AjaxResult getOrderExpressList(@RequestBody JSONObject jsonObject) {
        return apiService.getOrderExpressList(jsonObject);
    }

    /**
     * 获取物流信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getOrderExpress")
    public AjaxResult getOrderExpress(@RequestBody JSONObject jsonObject) {
        return apiService.getOrderExpress(jsonObject);
    }

    /**
     * 收藏商品信息
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/insertCollectGood")
    public AjaxResult insertCollectGood(@RequestBody JSONObject jsonObject) {
        return apiService.insertCollectGood(jsonObject);
    }

    /**
     * 取消商品收藏
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/deleteCollectGood")
    public AjaxResult deleteCollectGood(@RequestBody JSONObject jsonObject) {
        return apiService.deleteCollectGood(jsonObject);
    }

    /**
     * 获取收藏列表
     *
     * @return
     */
    @PostMapping("/getCollectGoodList")
    public AjaxResult getCollectGoodList(@RequestBody JSONObject jsonObject) {
        return apiService.getCollectGoodList(jsonObject);
    }

    /**
     * 获取已兑换商品列表
     *
     * @return
     */
    @PostMapping("/getExchangeGoodList")
    public AjaxResult getExchangeGoodList(@RequestBody JSONObject jsonObject) {
        return apiService.getExchangeGoodList(jsonObject);
    }

    /**
     * 获取积分明细列表
     *
     * @return
     */
    @PostMapping("/getExchangeLogList")
    public AjaxResult getExchangeLogList(@RequestBody JSONObject jsonObject) {
        return apiService.getExchangeLogList(jsonObject);
    }

    /**
     * 会员充值
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/rechargeMoney")
    public AjaxResult rechargeMoney(@RequestBody JSONObject jsonObject) {
        return apiService.rechargeMoney(jsonObject);
    }

    /**
     * 获取充值记录
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getRechargeLogList")
    public AjaxResult getRechargeLogList(@RequestBody JSONObject jsonObject) {
        return apiService.getRechargeLogList(jsonObject);
    }

    /**
     * 获取我的足迹
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getFootprintList")
    public AjaxResult getFootprintList(@RequestBody JSONObject jsonObject) {
        return apiService.getFootprintList(jsonObject);
    }

    /**
     * 获取转盘商品
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getTurntableGoodsList")
    public AjaxResult getTurntableGoodsList(@RequestBody JSONObject jsonObject) {
        return apiService.getTurntableGoodsList(jsonObject);
    }

    /**
     * 获取转盘规则
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getTurntableRule")
    public AjaxResult getTurntableRule(@RequestBody JSONObject jsonObject) {
        return apiService.getTurntableRule(jsonObject);
    }

    /**
     * 获取中奖记录
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getTurntableLogList")
    public AjaxResult getTurntableLogList(@RequestBody JSONObject jsonObject) {
        return apiService.getTurntableLogList(jsonObject);
    }

    /**
     * 获取中奖商品
     *
     * @return
     */
    @PostMapping("/getWinGoodsInfo")
    public AjaxResult getWinGoodsInfo(@RequestBody JSONObject jsonObject) {
        return apiService.getWinGoodsInfo(jsonObject);
    }

    /**
     * 我的砍价列表
     *
     * @return
     */
    @PostMapping("/getCutList")
    public AjaxResult getCutList(@RequestBody JSONObject jsonObject) {
        return apiService.getCutList(jsonObject);
    }

    /**
     * 砍价成功列表
     *
     * @return
     */
    @PostMapping("/getSuccessCutList")
    public AjaxResult getSuccessCutList(@RequestBody JSONObject jsonObject) {
        return apiService.getSuccessCutList(jsonObject);
    }

    /**
     * 参与砍价列表
     *
     * @return
     */
    @PostMapping("/getPartakeCutList")
    public AjaxResult getPartakeCutList(@RequestBody JSONObject jsonObject) {
        return apiService.getPartakeCutList(jsonObject);
    }

    /**
     * 邀请好友砍价
     *
     * @return
     */
    @PostMapping("/inviteFriendsCut")
    public AjaxResult inviteFriendsCut(@RequestBody JSONObject jsonObject) {
        return apiService.inviteFriendsCut(jsonObject);
    }

    /**
     * 参与好友砍价
     *
     * @return
     */
    @PostMapping("/insertFriendsCut")
    public AjaxResult insertFriendsCut(@RequestBody JSONObject jsonObject) {
        return apiService.insertFriendsCut(jsonObject);
    }

    /**
     * 获取报修订单列表
     *
     * @return
     */
    @PostMapping("/getRepairOrderList")
    public AjaxResult getRepairOrderList(@RequestBody JSONObject jsonObject) {
        return apiService.getRepairOrderList(jsonObject);
    }

    /**
     * 上传报修订单
     *
     * @return
     */
    @PostMapping("/addRepairOrder")
    public AjaxResult addRepairOrder(@RequestBody JSONObject jsonObject) {
        return apiService.addRepairOrder(jsonObject);
    }

    /**
     * 修改报修订单
     *
     * @return
     */
    @PostMapping("/updateRepairOrder")
    public AjaxResult updateRepairOrder(@RequestBody JSONObject jsonObject) {
        return apiService.updateRepairOrder(jsonObject);
    }

    /**
     * 删除报修订单
     *
     * @return
     */
    @PostMapping("/deleteRepairOrder")
    public AjaxResult deleteRepairOrder(@RequestBody JSONObject jsonObject) {
        return apiService.deleteRepairOrder(jsonObject);
    }

    /**
     * 结束好友砍价
     *
     * @return
     */
    @PostMapping("/deleteFriendsCut")
    public AjaxResult deleteFriendsCut(@RequestBody JSONObject jsonObject) {
        return apiService.deleteFriendsCut(jsonObject);
    }

    // TODO 系统模块

    /**
     * 获取轮播图
     *
     * @return
     */
    @PostMapping("/getBannerList")
    public AjaxResult getBannerList(@RequestBody JSONObject jsonObject) {
        return apiService.getBannerList(jsonObject);
    }

    /**
     * 获取活动海报
     *
     * @return
     */
    @PostMapping("/getBannerInfo")
    public AjaxResult getBannerInfo(@RequestBody JSONObject jsonObject) {
        return apiService.getBannerInfo(jsonObject);
    }

    /**
     * 获取系统通知
     *
     * @return
     */
    @PostMapping("/getNoticeList")
    public AjaxResult getNoticeList(@RequestBody JSONObject jsonObject) {
        return apiService.getNoticeList(jsonObject);
    }
    /**
     * 获取系统通知详情
     *
     * @return
     */
    @PostMapping("/getNotice")
    public AjaxResult getNotice(@RequestBody JSONObject jsonObject) {
        return apiService.getNotice(jsonObject);
    }

    /**
     * 获取保证金
     *
     * @return
     */
    @PostMapping("/getBond")
    public AjaxResult getBond() {
        return apiService.getBond();
    }

    /**
     * 获取隐私政策
     *
     * @return
     */
    @PostMapping("/getConceal")
    public AjaxResult getConceal() {
        return apiService.getConceal();
    }

    /**
     * 获取协议
     *
     * @return
     */
    @PostMapping("/getAgreement")
    public AjaxResult getAgreement(@RequestBody JSONObject jsonObject) {
        return apiService.getAgreement(jsonObject);
    }

    /**
     * 获取关于我们
     *
     * @return
     */
    @PostMapping("/getWe")
    public AjaxResult getWe() {
        return apiService.getWe();
    }

    /**
     * 获取客服电话
     *
     * @return
     */
    @PostMapping("/getService")
    public AjaxResult getService() {
        return apiService.getService();
    }

    /**
     * 上传意见反馈
     *
     * @return
     */
    @PostMapping("/insertIdea")
    public AjaxResult insertIdea(@RequestBody JSONObject jsonObject) {
        return apiService.insertIdea(jsonObject);
    }

    /**
     * 获取砍价规则
     *
     * @return
     */
    @PostMapping("/getCutRule")
    public AjaxResult getCutRule() {
        return apiService.getCutRule();
    }

    /**
     * 获取邀请规则
     *
     * @return
     */
    @PostMapping("/getInviteRule")
    public AjaxResult getInviteRule() {
        return apiService.getInviteRule();
    }

    /**
     * 获取购买须知
     *
     * @return
     */
    @PostMapping("/getBuyNotice")
    public AjaxResult getBuyNotice() {
        return apiService.getBuyNotice();
    }

    /**
     * 获取运费设置
     *
     * @return
     */
    @PostMapping("/getFreight")
    public AjaxResult getFreight(@RequestBody JSONObject jsonObject) {
        return apiService.getFreight(jsonObject);
    }

    /**
     * 获取版本信息
     *
     * @return
     */
    @PostMapping("/getVersion")
    public AjaxResult getVersion() {
        return apiService.getVersion();
    }

    /**
     * 获取商品规格
     *
     * @return
     */
    @PostMapping("/getGoodsSpecs")
    public AjaxResult getGoodsSpecs(@RequestBody JSONObject jsonObject) {
        return apiService.getGoodsSpecs(jsonObject);
    }


    /**
     * 获取系统消息
     *
     * @return
     */
    @PostMapping("/getMessage")
    public AjaxResult getMessage(@RequestBody JSONObject jsonObject) {
        return apiService.getMessage(jsonObject);
    }

    /**
     * 签署合同信息
     *
     * @return
     */
    @PostMapping("/createContract")
    public AjaxResult createContract(@RequestBody JSONObject jsonObject) {
        if (jsonObject == null) {
            return AjaxResult.error("参数不能为空");
        } else {
            String title = "租赁协议";
            String userName = jsonObject.getString("userName");
            String userPhone = jsonObject.getString("userPhone");
            String cTenantName = "杭州够特科技有限公司";
            String cName = "刘东";
            String cPhone = "15996269080";
            Long documentId = 3176790181546037301L;
            Map<String, Object> draft = QiYueSuoUtils.creatHtDraft(title, userName, userPhone, title, cTenantName, cName, cPhone);
            if (draft != null && "0".equals(draft.get("code").toString())) {
                System.err.println("创建合同：" + JSONObject.toJSONString(draft));
                Long contractId = Long.parseLong(draft.get("contractId").toString());
                Long actionId = Long.parseLong(draft.get("actionId").toString());
                Long signatoryId = Long.parseLong(draft.get("signatoryid").toString());
                String result = QiYueSuoUtils.sendHt(contractId, actionId, signatoryId, documentId, cTenantName, 1, new ArrayList<>());
                System.err.println("发起合同：" + JSONObject.toJSONString(result));
                if (com.qiyuesuo.sdk.v2.utils.StringUtils.isNotBlank(result) && "success".equals(result)) {
                    Map<String, String> map = QiYueSuoUtils.appletsTicket(contractId, userPhone);
                    System.err.println("生成令牌：" + JSONObject.toJSONString(map));
                    return (map != null && "success".equals(map.get("code"))) ? AjaxResult.success(map) : AjaxResult.error(map.get("data"));
                }
            } else {
                return AjaxResult.error(draft.get("msg").toString());
            }
            return AjaxResult.error("发起合同失败");
        }
    }

    /**
     * 升级推广员
     *
     * @return
     */
    @PostMapping("/openPromoter")
    public AjaxResult openPromoter(@RequestBody JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("参数不能为空");
        } else {
            return apiService.openPromoter(jsonObject);
        }
    }

    /**
     * 用户提现
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/withdrawCustomerMoney")
    public AjaxResult withdrawCustomerMoney(@RequestBody JSONObject jsonObject) {
        return apiService.withdrawCustomerMoney(jsonObject);
    }

    /**
     * 用户提现记录
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getWithdrawLog")
    public AjaxResult getWithdrawLog(@RequestBody JSONObject jsonObject) {
        return apiService.getWithdrawLog(jsonObject);
    }
    /**
     * 获取预期项目、咨询详情、使用目的
     *
     * @return
     */
    @PostMapping("/getDictItem")
    public AjaxResult getDictItem() {
        return apiService.getDictItem();
    }
    // TODO 回调模块

    /**
     * 订单微信回调
     *
     * @param request
     * @param response
     * @return
     */
    @PostMapping("/wxOrderNotifyUrl")
    public Map wxOrderNotifyUrl(HttpServletRequest request, HttpServletResponse response) {
        try {
            Map<String, Object> map = new HashMap<>();
            String re = apiService.wxOrderNotifyUrl(request, response);
            map.put("code", re);
            return map;
        } catch (Exception e) {
            Map<String, Object> map = new HashMap<>();
            map.put("code", "fail");
            return map;
        }
    }


    /**
     * 充值微信回调
     *
     * @param request
     * @param response
     * @return
     */
    @PostMapping("/wxRechargeNotifyUrl")
    public Map wxRechargeNotifyUrl(HttpServletRequest request, HttpServletResponse response) {
        try {
            Map<String, Object> map = new HashMap<>();
            String re = apiService.wxRechargeNotifyUrl(request, response);
            map.put("code", re);
            return map;
        } catch (Exception e) {
            Map<String, Object> map = new HashMap<>();
            map.put("code", "fail");
            return map;
        }
    }

    /**
     * 充值微信回调
     *
     * @param request
     * @param response
     * @return
     */
    @PostMapping("/wxRechargeNotifyUrl2")
    public Map wxRechargeNotifyUrl2(HttpServletRequest request, HttpServletResponse response) {
        try {
            Map<String, Object> map = new HashMap<>();
            String re = apiService.wxRechargeNotifyUrl2(request, response);
            map.put("code", re);
            return map;
        } catch (Exception e) {
            Map<String, Object> map = new HashMap<>();
            map.put("code", "fail");
            return map;
        }
    }

    /**
     * 订单支付宝回调
     *
     * @param request
     * @return
     */
    @PostMapping("/aliOrderNotifyUrl")
    public String aliOrderNotifyUrl(HttpServletRequest request) {
        return apiService.aliOrderNotifyUrl(request);
    }

    /**
     * 充值支付宝回调
     *
     * @param request
     * @return
     */
    @PostMapping("/aliRechargeNotifyUrl")
    public String aliRechargeNotifyUrl(HttpServletRequest request) {
        return apiService.aliRechargeNotifyUrl(request);
    }


    /**
     * crc8解析
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/getCRC8")
    public AjaxResult getCRC8(@RequestBody JSONObject jsonObject) {
        AjaxResult ajaxResult = new AjaxResult();
        System.err.println("参数：" + JSONObject.toJSONString(jsonObject));
        String code = jsonObject.getString("code");
        try {
            String crc8 = CRCUtils.getCRC8(code);
            ajaxResult = AjaxResult.success();
            System.err.println("crc8：" + crc8);
            ajaxResult.put("crc8", crc8);
            return ajaxResult;
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error();
        }
    }


    // TODO 公共模块

    /**
     * 发送短信验证码
     *
     * @param jsonObject
     * @return
     */
    @PostMapping("/sendCode")
    public AjaxResult sendCode(@RequestBody JSONObject jsonObject) {
        String mobile = jsonObject.getString("phone");
        Long flag = jsonObject.getLong("flag");
        JSONObject before = SendSmsUtil.sendSmsBeforeExecute(mobile);
        if (!before.getBoolean("isSuccess")) {
            return AjaxResult.error(before.getString("msg"));
        }
        String mobileCode = getCode();
        boolean isSuccess = false;
        SMSUtil.sendSMS(mobile,mobileCode);
//        if (CommonEunm.VerifyCodeFlag.login.code() == flag) {
//            isSuccess = SendMessageUtils.sendLoginCode(mobileCode, mobile);
//        } else if (CommonEunm.VerifyCodeFlag.register.code() == flag) {
//            isSuccess = SendMessageUtils.sendRegisterCode(mobileCode, mobile);
//        } else if (CommonEunm.VerifyCodeFlag.updatePwd.code() == flag) {
//            isSuccess = SendMessageUtils.sendUpdatePwdCode(mobileCode, mobile);
//        } else {
//            return AjaxResult.error("未知发送状态");
//        }
        if (isSuccess) {
            redis.setCacheObject(String.format(SendSmsUtil.SMS_CODE_KEY, mobile), mobileCode, 5, TimeUnit.MINUTES);
            SendSmsUtil.sendSmsAfterExecute();
            return AjaxResult.success("发送成功");
        }
        return AjaxResult.error("发送失败");
    }



    /**
     * 获取短信验证码4位
     *
     * @return
     */
    private String getCode() {
        String code = "";
        Random random = new Random();
        for (int i = 0; i < 4; i++) {
            code += random.nextInt(10);
        }
        return code;
    }

    /**
     * map转jsonobject
     *
     * @param map
     * @return
     */
    public JSONObject mapToJson(Map<String, Object> map) {
        JSONObject jsonObject = new JSONObject(map);
        return jsonObject;
    }
}
