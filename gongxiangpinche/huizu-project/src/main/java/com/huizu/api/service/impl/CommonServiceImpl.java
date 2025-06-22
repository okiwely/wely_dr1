package com.huizu.api.service.impl;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.huizu.api.mapper.ApiMapper;
import com.huizu.common.config.WeChatConfig;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.common.utils.StringUtils;
import com.huizu.common.utils.XmlUtil;
import com.huizu.common.utils.pay.alipay.AlipayConfig;
import com.huizu.common.utils.pay.alipay.AlipayUtil;
import com.huizu.common.utils.pay.wxpay.*;
import org.jdom.JDOMException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

@Service
public class CommonServiceImpl {
    public static String WECHAT_NOTIFY_URL_ORDER = "https://kafei666.gaojinyi.top/prod-api/api/wxOrderNotifyUrl";
    public static String WECHAT_NOTIFY_URL_ORDER2 = "https://kafei666.gaojinyi.top/prod-api/api/wxOrderNotifyUrl2";
    public static String WECHAT_NOTIFY_URL_RECHARGE = "https://kafei666.gaojinyi.top/prod-api/api/wxRechargeNotifyUrl";
    public static String WECHAT_NOTIFY_URL_RECHARGE2 = "https://kafei666.gaojinyi.top/prod-api/api/wxRechargeNotifyUrl2";

    @Autowired
    private ApiMapper apiMapper;
    @Autowired
    private WxPayService wxPayService;
    /**
     * 支配卡支付
     *
     * @param jsonObject
     * @return
     */
    public AjaxResult pay(JSONObject jsonObject) {
        try {
            /**
             * 小程序支付
             */
            if (StringUtils.isNotBlank(jsonObject.getString("openId"))) {
                if ("1".equals(jsonObject.getString("payType"))) {// 微信支付

                    Boolean b = wxPay(jsonObject.getString("openId"),
                            jsonObject.getString("orderCode"),
                            jsonObject.getDouble("price"),
                            WECHAT_NOTIFY_URL_ORDER,
                            "订单支付");
                    return b ? AjaxResult.success() : AjaxResult.error();

                } else if ("3".equals(jsonObject.getString("payType"))) {// 积分支付
                    JSONObject object = apiMapper.getCustomerInfoByOpenId(jsonObject.getString("openId"));
                    BigDecimal integral = object.getBigDecimal("integral") == null ? BigDecimal.ZERO : object.getBigDecimal("integral");
                    if (object == null) {
                        return AjaxResult.error("未查询到会员信息");
                    } else {
                        BigDecimal price = BigDecimal.valueOf(jsonObject.getDouble("price"));
                        if (integral.compareTo(price) == -1) {
                            return AjaxResult.error("积分不足");
                        } else {
                            object.put("integral", price);
                            apiMapper.updateOrderIntegral(object);
                            jsonObject.put("orderCode", jsonObject.getString("orderCode"));
                            jsonObject.put("orderStatus", 2);
                            apiMapper.updateOrderStatus(jsonObject);
                            return AjaxResult.success("支付成功");
                        }
                    }
                } else if ("4".equals(jsonObject.getString("payType"))) {// 微信+积分支付
                    JSONObject object = apiMapper.getCustomerInfoByOpenId(jsonObject.getString("openId"));
                    BigDecimal integral = object.getBigDecimal("integral") == null ? BigDecimal.ZERO : object.getBigDecimal("integral");
                    if (object == null) {
                        return AjaxResult.error("未查询到会员信息");
                    } else {
                        BigDecimal orderIntegral = BigDecimal.valueOf(jsonObject.getDouble("integral"));
                        if (integral.compareTo(orderIntegral) == -1) {
                            return AjaxResult.error("积分不足");
                        } else {
                            Boolean b = wxPay(jsonObject.getString("openId"),
                                    jsonObject.getString("orderCode"),
                                    jsonObject.getDouble("price"),
                                    WECHAT_NOTIFY_URL_ORDER,
                                    "订单支付");
                            return b ? AjaxResult.success() : AjaxResult.error();
                        }
                    }
                }
                /**
                 * APP支付
                 */
            } else {
                if ("1".equals(jsonObject.getString("payType"))) {// 微信支付
                    Map<String, String> map = WXPay.getAppPay(
                            BigDecimal.valueOf(jsonObject.getDouble("price") * 100).setScale(0, RoundingMode.HALF_UP).toString(),
                            "订单支付",
                            jsonObject.getString("orderCode"),
                            "",
                            5,
                            WECHAT_NOTIFY_URL_ORDER);
                    System.err.println("支付返回结果：" + map.toString());
                    return AjaxResult.success(map);
                } else if ("2".equals(jsonObject.getString("payType"))) {// 支付宝支付

                    String result = aliPay(jsonObject.getString("orderCode"), jsonObject.getString("price"));
                    return AjaxResult.success(result);

                } else if ("3".equals(jsonObject.getString("payType"))) {// 积分支付
                    JSONObject object = apiMapper.getCustomerInfoById(jsonObject.getLong("customerId"));
                    if (object == null) {
                        return AjaxResult.error("未查询到会员信息");
                    } else {
                        BigDecimal price = BigDecimal.valueOf(jsonObject.getDouble("price"));
                        BigDecimal integral = object.getBigDecimal("integral") == null ? BigDecimal.ZERO : object.getBigDecimal("integral");
                        if (integral.compareTo(price) == -1) {
                            return AjaxResult.error("积分不足");
                        } else {
                            object.put("integral", price);
                            apiMapper.updateOrderIntegral(object);
                            jsonObject.put("orderCode", jsonObject.getString("orderCode"));
                            jsonObject.put("orderStatus", 2);
                            apiMapper.updateOrderStatus(jsonObject);
                            return AjaxResult.success("支付成功");
                        }
                    }
                } else if ("4".equals(jsonObject.getString("payType"))) {// 微信+积分支付
                    JSONObject object = apiMapper.getCustomerInfoById(jsonObject.getLong("customerId"));
                    BigDecimal integral = object.getBigDecimal("integral") == null ? BigDecimal.ZERO : object.getBigDecimal("integral");
                    if (object == null) {
                        return AjaxResult.error("未查询到会员信息");
                    } else {
                        BigDecimal orderIntegral = BigDecimal.valueOf(jsonObject.getDouble("integral"));
                        if (integral.compareTo(orderIntegral) == -1) {
                            return AjaxResult.error("积分不足");
                        } else {
                            Boolean b = wxPay(jsonObject.getString("openId"),
                                    jsonObject.getString("orderCode"),
                                    jsonObject.getDouble("price"),
                                    WECHAT_NOTIFY_URL_ORDER,
                                    "订单支付");
                            return b ? AjaxResult.success() : AjaxResult.error();
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return AjaxResult.error("支付失败");
    }

    /**
     * 支付保证金
     *
     * @param jsonObject
     * @return
     * @throws IOException
     * @throws JDOMException
     */
    public AjaxResult paySign(JSONObject jsonObject) {
        Boolean b = wxPay(jsonObject.getString("openId"),
                jsonObject.getString("orderCode"),
                jsonObject.getDouble("money"),
                WECHAT_NOTIFY_URL_RECHARGE2,
                "支付保证金");
        return b ? AjaxResult.success("支付成功") : AjaxResult.error("支付失败");
    }

    /**
     * 会员充值
     *
     * @param jsonObject
     * @return
     */
    public AjaxResult payMoney(JSONObject jsonObject) {
        try {
            /**
             * 小程序支付
             */
            if (StringUtils.isNotBlank(jsonObject.getString("openId"))) {
                if ("1".equals(jsonObject.getString("payType"))) {// 微信支付
                    Boolean b = wxPay(jsonObject.getString("openId"),
                            jsonObject.getString("orderCode"),
                            jsonObject.getDouble("money"),
                            WECHAT_NOTIFY_URL_RECHARGE,
                            "会员充值");
                    return b ? AjaxResult.success("支付成功") : AjaxResult.error("支付失败");
                }
                /**
                 * APP支付
                 */
            } else {
                if ("1".equals(jsonObject.getString("payType"))) {// 微信支付
                    Map<String, String> map = WXPay.getAppPay(
                            BigDecimal.valueOf(jsonObject.getDouble("money") * 100).setScale(0, RoundingMode.HALF_UP).toString(),
                            "会员充值",
                            jsonObject.getString("orderCode"),
                            "",
                            5,
                            WECHAT_NOTIFY_URL_RECHARGE);
                    System.err.println("支付返回结果：" + map.toString());
                    return AjaxResult.success(map);
                } else if ("2".equals(jsonObject.getString("payType"))) {// 支付宝支付
                    String result = aliPay(jsonObject.getString("orderCode"), jsonObject.getString("money"));
                    return AjaxResult.success(result);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return AjaxResult.error("支付失败");
    }


    /**
     * 微信支付
     *
     * @param openId openid
     * @param orderCode 订单编号
     * @param price 金额
     * @param url 回调url
     * @param body 备注
     * @return
     */
    public Boolean wxPay(String openId, String orderCode,Double price,String url,String body){
        try{
            SortedMap<String, Object> parameters = new TreeMap<>();
            parameters.put("appid", WeChatConfig.getAppid());
            parameters.put("mch_id", WeChatConfig.getMchid());
            parameters.put("nonce_str", wxPayService.getNonceStr());
            parameters.put("body", body);
            parameters.put("out_trade_no",orderCode);
            parameters.put("total_fee", BigDecimal.valueOf(price * 100).setScale(0, RoundingMode.HALF_UP));
            parameters.put("spbill_create_ip", "");
            parameters.put("notify_url",url);
            parameters.put("trade_type", "JSAPI");
            parameters.put("openid",openId);
            parameters.put("sign", wxPayService.createSign(parameters, WeChatConfig.getApikey2()));
            String result = wxPayService.postData(WeixinUtil.unifiedorder, wxPayService.getRequestXml(parameters));
            SortedMap<String, Object> map = XmlUtil.doXMLParse(result);
            System.err.println("====================================================");
            System.err.println(JSONArray.toJSONString(map));
            System.err.println("====================================================");
            String prepay_id = "";
            if ("SUCCESS".equals(map.get("return_code").toString()) && "SUCCESS".equals(map.get("result_code").toString())) {
                prepay_id = map.get("prepay_id").toString();
                if (prepay_id != null && prepay_id.length() > 10) {
                    String jsParam = wxPayService.createPackageValue(WeChatConfig.getAppid(), WeChatConfig.getApikey2(), prepay_id);
                    JSONObject object = JSONObject.parseObject(jsParam, JSONObject.class);
                    System.err.println("====================================================");
                    System.err.println(JSONArray.toJSONString(object));
                    System.err.println("====================================================");
                    return true;
                }
            }

            System.err.println("====================================================");
            System.err.println(map.get("return_msg").toString());
            System.err.println("====================================================");
        }catch (Exception e){
            return false;
        }
      return false;

    }

    /**
     * 支付宝支付
     * @return
     */
    public String aliPay(String orderCode, String price){
        try{
            AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
            model.setBody("订单支付");
            model.setSubject("订单支付");
            model.setTimeoutExpress("5m");
            model.setTotalAmount(price);
            model.setOutTradeNo(orderCode);
            String result = AlipayUtil.appPay(model, new AlipayConfig().getNotify_url_order());
            System.err.println("支付返回结果：" + result);
            return result;
        }catch (Exception e){
            return "支付失败";
        }
    }

}
