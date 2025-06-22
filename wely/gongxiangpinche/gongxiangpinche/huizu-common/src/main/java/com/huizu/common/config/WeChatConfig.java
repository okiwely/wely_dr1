package com.huizu.common.config;


import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "wechat")
public class WeChatConfig {

    /**微信APPID*/
    public static String appid;
    /**微信公众号密钥*/
    public static String secret;
    /**商户号*/
    public static String mchid;
    /**商户密钥*/
    public static String apikey2;


    public static String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        WeChatConfig.appid = appid;
    }

    public static String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        WeChatConfig.secret = secret;
    }

    public static String getMchid() {
        return mchid;
    }

    public void setMchid(String mchid) {
        WeChatConfig.mchid = mchid;
    }

    public static String getApikey2() {
        return apikey2;
    }

    public void setApikey2(String apikey2) {
        WeChatConfig.apikey2 = apikey2;
    }
}
