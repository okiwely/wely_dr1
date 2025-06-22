package com.huizu.common.utils.withdraw;//package com.huizu.weixin.utils;
//
//import com.bootdo.common.config.BootdoConfig;
////import org.junit.Test;
//
//import java.math.BigDecimal;
//import java.text.SimpleDateFormat;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.SortedMap;
//import java.util.TreeMap;
//
//public class WXPay {
//    /**
//     * 微信小程序支付
//     *
//     * @param total_fee    //订单金额【备注：以分为单位】
//     * @param body         //商品名称
//     * @param out_trade_no //商户订单号
//     * @param attach       //附加參數
//     * @return
//     * @throws Exception
//     */
//    public static Map<String, String> getApppay(String total_fee, String body, String out_trade_no, String attach, String openid, int time) throws Exception {
//        /**
//         * 账号信息
//         */
//        String appid = WXPayConfig.APPID;//微信服务号的appid
//        String mch_id = WXPayConfig.MCHID; //微信支付商户号
//        String key = WXPayConfig.APIKEY; // 微信支付的API密钥
//        String notify_url = BootdoConfig.getPayUrl() + WXPayConfig.WECHAT_NOTIFY_URL_PC;//回调地址【注意，这里必须要使用外网的地址】
//        String ufdoder_url = WXPayConfig.UFDODER_URL;//微信下单API地址
//        String trade_type = "APP";
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//        String time_expire = sdf.format((long) time * 60 * 1000 + System.currentTimeMillis()); //交易结束时间
//
//        /**
//         * 时间字符串
//         */
//        String currTime = PayForUtil.getCurrTime();
//        String strTime = currTime.substring(8);
//        String strRandom = PayForUtil.buildRandom(4) + "";
//        String nonce_str = strTime + strRandom;
//
//        /**
//         * 参数封装
//         */
//        SortedMap<String, String> packageParams = new TreeMap<>();
//        packageParams.put("appid", appid);
//        packageParams.put("mch_id", mch_id);
//        packageParams.put("nonce_str", nonce_str);//随机字符串
//        packageParams.put("body", body);//支付的商品名称
//        packageParams.put("out_trade_no", out_trade_no);//商户订单号【备注：每次发起请求都需要随机的字符串，否则失败。】
//        packageParams.put("total_fee", total_fee);//支付金额
//        packageParams.put("spbill_create_ip", PayForUtil.localIp());//客户端主机
//        packageParams.put("notify_url", notify_url);
//        packageParams.put("trade_type", trade_type);
//        packageParams.put("attach", attach);//额外的参数【业务类型+会员ID+支付类型】
//        packageParams.put("time_expire", time_expire);
//        packageParams.put("sign_type", "MD5");
//        packageParams.put("openid", openid);
//
//        String sign = PayForUtil.generateSignature(packageParams, key, "MD5");  //获取签名
//        packageParams.put("sign", sign);
//        String requestXML = PayForUtil.getRequestXml(packageParams);//将请求参数转换成String类型
//        String resXml = PayForUtil.postData(ufdoder_url, requestXML);  //解析请求之后的xml参数并且转换成String类型
//        Map resp = XMLUtil.doXMLParse(resXml);
//
//        System.err.println(resp.toString());
//        Map<String, String> payMap = new HashMap();
//        if ("SUCCESS".equals(resp.get("result_code")) && "SUCCESS".equals(resp.get("return_code"))) {
//            /*获取微信返回的参数*/
//            String appId = resp.get("appid").toString();
//            String mchId = resp.get("mch_id").toString();
//            String nonceStr = resp.get("nonce_str").toString();
//            String prepayId = resp.get("prepay_id").toString();
//            String timeStamp = String.valueOf(System.currentTimeMillis() / 1000);
//            /*添加二签参数*/
//            Map<String, String> signMap = new HashMap();
//            signMap.put("appid", appId);
//            signMap.put("partnerid", mchId);
//            signMap.put("prepayid", prepayId);
//            signMap.put("noncestr", nonceStr);
//            signMap.put("timestamp", timeStamp);
//            signMap.put("package", "prepay_id=" + prepayId);
//            /*添加返回值参数*/
//            payMap.put("appid", appId);// 公众账号ID
//            payMap.put("timestamp", timeStamp);
//            payMap.put("noncestr", nonceStr);// 随机字符串
//            payMap.put("signtype", "MD5");
//            payMap.put("package", "prepay_id=" + prepayId);
//            /*二签*/
//            payMap.put("paysign", PayForUtil.generateSignature(signMap, key, "MD5"));// 微信签名
//            return payMap;
//        }
//        return null;
//    }
//
//    /**
//     * 微信浏览器内微信支付/公众号支付(JSAPI)
//     *
//     * @param total_fee
//     * @param body
//     * @param out_trade_no
//     * @param attach
//     * @param openid
//     * @param time
//     * @return
//     * @throws Exception
//     */
//    public static Map<String, String> getJSAPIpay(String total_fee, String body, String out_trade_no, String attach, String openid, int time) throws Exception {
//        /**
//         * 账号信息
//         */
//        String appid = WXPayConfig.APPID;// 微信服务号的appid
//        String mch_id = WXPayConfig.MCHID;// 微信支付商户号
//        String key = WXPayConfig.APIKEY;// 微信支付的API密钥
//        String notify_url = BootdoConfig.getPayUrl() + WXPayConfig.WECHAT_NOTIFY_URL_PC;// 回调地址【注意，这里必须要使用外网的地址】
//        String ufdoder_url = WXPayConfig.UFDODER_URL;// 微信下单API地址
//        String trade_type = "JSAPI";
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//        String time_expire = sdf.format((long) time * 60 * 1000 + System.currentTimeMillis());// 交易结束时间
//
//        /**
//         * 时间字符串
//         */
//        String currTime = PayForUtil.getCurrTime();
//        String strTime = currTime.substring(8);
//        String strRandom = PayForUtil.buildRandom(4) + "";
//        String nonce_str = strTime + strRandom;
//        // 拼接统一下单地址参数
//        SortedMap<String, String> paraMap = new TreeMap<>();
//        paraMap.put("appid", appid);
//        paraMap.put("body", body);
//        paraMap.put("mch_id", mch_id);
//        paraMap.put("nonce_str", nonce_str);
//        paraMap.put("openid", openid);
//        paraMap.put("out_trade_no", out_trade_no);// 订单号
//        paraMap.put("spbill_create_ip", PayForUtil.localIp());
//        paraMap.put("total_fee", total_fee);
//        paraMap.put("trade_type", trade_type);
//        paraMap.put("notify_url", notify_url);// 此路径是微信服务器调用支付结果通知路径随意写
//        paraMap.put("attach", attach);// 额外的参数【业务类型+会员ID+支付类型】
//        paraMap.put("time_expire", time_expire);
//        paraMap.put("sign_type", "MD5");
//        String sign = PayForUtil.generateSignature(paraMap, key, "MD5");// 获取签名
//        paraMap.put("sign", sign);
//        String requestXML = PayForUtil.getRequestXml(paraMap);// 将请求参数转换成String类型
//        String xmlStr = PayForUtil.postData(ufdoder_url, requestXML);// 解析请求之后的xml参数并且转换成String类型
//
//        // 以下内容是返回前端页面的json数据
//        String prepay_id = "";// 预支付id
//        Map map = XMLUtil.doXMLParse(xmlStr);
//        System.err.println(map);// HMAC-SHA256
//        if ("SUCCESS".equals(map.get("result_code")) && "SUCCESS".equals(map.get("return_code"))) {
//            String nonceStr = map.get("nonce_str").toString();
//            String timeStamp = String.valueOf(System.currentTimeMillis() / 1000);
//            prepay_id = (String) map.get("prepay_id");
//            Map<String, String> payMap = new HashMap<String, String>();
//            payMap.put("appId", appid);
//            payMap.put("timeStamp", timeStamp);
//            payMap.put("nonceStr", nonceStr);
//            payMap.put("signType", "MD5");
//            payMap.put("package", "prepay_id=" + prepay_id);
//            String paySign = WXPayUtil.generateSignature(payMap, key);
//            payMap.put("paySign", paySign);
//            return payMap;
//        }
//        return null;
//    }
//
//}
