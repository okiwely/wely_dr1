package com.huizu.common.utils.withdraw;

//import org.junit.Test;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * @version: 企业转账到零钱
 */
public class WXTransfer {


//    @Test
//    public void test(HttpServletRequest request) {
//        String transfer = WXTransfer.transfer(request, "oY9sQ5FNj7C8b7RD96dzyKWkpzhQ", "1");
//
//    }

    /**
     * @Description: 企业转账到零钱
     * @param:
     * @return:
     */
    public static String transfer(String openId, String money) {

        // 1.0 拼凑企业支付需要的参数
        String appid = WXPayConfig.APPID; // 微信公众号的appid
        String mch_id = WXPayConfig.MCHID; // 商户号
        String nonce_str = WXPayUtil.generateNonceStr(); // 生成随机数
        String partner_trade_no = WXPayUtil.generateNonceStr(); // 生成商户订单号
        String openid = openId; // 支付给用户openid
        String check_name = "NO_CHECK"; // 是否验证真实姓名呢
        String re_user_name = "KOLO"; // 收款用户姓名(非必须)
        String amount = money; // 企业付款金额，最少为100，单位为分
        String desc = "恭喜你，提现成功！"; // 企业付款操作说明信息。必填。
//        String spbill_create_ip = getRequestIp(request); // 用户的ip地址

        // 2.0 生成map集合
        SortedMap<String, String> packageParams = new TreeMap<String, String>();
        packageParams.put("mch_appid", appid); // 微信公众号的appid
        packageParams.put("mchid", mch_id); // 商务号
        packageParams.put("nonce_str", nonce_str); // 随机生成后数字，保证安全性

        packageParams.put("partner_trade_no", partner_trade_no); // 生成商户订单号
        packageParams.put("openid", openid); // 支付给用户openid
        packageParams.put("check_name", check_name); // 是否验证真实姓名呢
        packageParams.put("re_user_name", re_user_name);// 收款用户姓名
        packageParams.put("amount", amount); // 企业付款金额，单位为分
        packageParams.put("desc", desc); // 企业付款操作说明信息。必填。
//        packageParams.put("spbill_create_ip", spbill_create_ip); // 调用接口的机器Ip地址
        packageParams.put("spbill_create_ip", "116.62.67.192"); // 调用接口的机器Ip地址
        System.out.println("发送前的xml为：" + packageParams);
        try {
            // 3.0 利用上面的参数，先去生成自己的签名
            String sign = WXPayUtil.generateSignature(packageParams, WXPayConfig.APIKEY);

            // 4.0 将签名再放回map中，它也是一个参数
            packageParams.put("sign", sign);

            // 5.0将当前的map结合转化成xml格式
            String xml = WXPayUtil.mapToXml(packageParams);

            // 6.0获取需要发送的url地址	https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers
            String wxUrl = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";

            System.out.println("发送前的xml为：" + xml);

            // 7,向微信发送请求转账请求
            String returnXml = WXCertHttpUtil.postData(wxUrl, xml);

            System.out.println("返回的returnXml为:" + returnXml);

            // 8，将微信返回的xml结果转成map格式
            Map<String, String> returnMap = WXPayUtil.xmlToMap(returnXml);
            System.out.println("returnMap为:" + returnMap);
            if (returnMap.get("return_code").equals("SUCCESS")) {
                // 付款成功
                return returnMap.get("return_code");
            }

            // return returnXml;

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "error";
    }


    /**
     * @Title: getRequestIp
     * @Description: 获取用户的ip地址
     * @param:
     * @return:
     */
    public static String getRequestIp(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (ip.indexOf(",") != -1) {
            String[] ips = ip.split(",");
            ip = ips[0].trim();
        }
        return ip;
    }


}
