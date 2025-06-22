package com.huizu.common.utils.withdraw;


import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ClassPathResource;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

public class WXPayConfig {
    public static String APPID = "wx8a74c55c0254e584";// 微信服务号APPID
    public static String MCHID = "1680937039";// 微信支付的商户号
    public static String APIKEY = "hengshuiwancaituliaoyouxiangongs";// 微信支付的API密钥
    public static String WECHAT_NOTIFY_URL_PC = "/port/pay/wxNotifyUrl";// 微信支付成功之后的回调地址【注意：当前回调地址必须是公网能够访问的地址】
    public static String initCertURL = "config/apiclient_cert.p12";// 证书地址
    public static String UFDODER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";

    public static InputStream getCertStream() {
        WXPayConfig wxPayConfig = new WXPayConfig();
        return wxPayConfig.certStream();
    }

    private static byte[] certData;

    private InputStream certStream() {
        try {
            ClassPathResource classPathResource = new ClassPathResource(initCertURL);
            // 获取文件流
            InputStream certStream = classPathResource.getInputStream();
            certData = IOUtils.toByteArray(certStream);
            certStream.read(certData);
            certStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        ByteArrayInputStream certBis = new ByteArrayInputStream(certData);
        return certBis;
    }

}
