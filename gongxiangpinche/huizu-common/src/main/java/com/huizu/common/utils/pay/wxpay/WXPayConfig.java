package com.huizu.common.utils.pay.wxpay;



public class WXPayConfig {
    public static final String GRANT_TYPE = "client_credential";
    public static final String TOKEN = "https://api.weixin.qq.com/cgi-bin/token";
    public static final String LIMIT = "https://api.weixin.qq.com/wxa/getwxacodeunlimit";
    public static final String PATH = "pages/index/index";
    public static final String CUT_PATH = "pagesTo/me/activity/bargain/wxCodes";

    /**微信下单API地址*/
    public static String UFORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
    public static String REFUND = "https://api.mch.weixin.qq.com/secapi/pay/refund";
    public static String CRET_URL = "/www/SpringBootProjects/kafeizulin/cert/apiclient_cert.p12";
//    public static String CRET_URL = "D:\\www\\SpringBootProjects\\kafeizulin\\cert\\apiclient_cert.p12";
}
