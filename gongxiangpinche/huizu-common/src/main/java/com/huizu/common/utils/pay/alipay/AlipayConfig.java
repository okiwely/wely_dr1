package com.huizu.common.utils.pay.alipay;

import org.springframework.stereotype.Component;

@Component
public class AlipayConfig {
    public String gatewayUrl = "https://openapi.alipay.com/gateway.do";
    // 应用ID
    private String app_id = "2021002193676142";
    // 商户私钥
    private String merchant_private_key = "MIIEogIBAAKCAQEAoBkhmUYcSWLtzuGw80M7biRWsMxJGxKEqq1+zi6yqA1PxMK/ruRSqqInMfaZ7W4aIVk2zGtuGtLR+rO6tDJjBOdCJSPo03301iJxPfJA3GjCVG5uydMVqjdRqhyunJUcmXwv4eR2S00+lHShyAG0/1tMlVprbOUtt0x38ZzoyG7hVwv5qIIoDBS+XmjcJ6k2od6H8tSbJTC9Z60UyyQEQPzJjhkcLR1Dq1eOSou3qBfTHipKO2P5LJh0dov5dkUZWDwIJ02FhfFnctItbUAcCXvhnGUIC+q7PiRi13EU7K5CN1J+M4geCD9+TAFN1YwEva/touF9PYf1+iVkT0dWnQIDAQABAoIBACN+ruZOlwLmPhc6DoNAirKWt+mmwSaRanx0zsJjtBRyLxdOnjTmRjWykcIQDHyJhp2SLAYSY2zrBMbyhhhhe3ag1xdo6LvLFzdKl5TGWv8C8uLJQSLZ+9mrPh3bEhOBM8ALuon4nwl+7Lr5SM0RI9Hhqg8K5vpTrVkQSR92TF3zbF3750SDaoQU087jY9ak209hfWnKZjVqX7mxjmKR0CXOXhHEXvLY1pbzhkiDx1o3VwIoagaNCY4v1GTpfCTLG53PpgylCs3aSaruLBrXOQ1KTDyDvdIslx0jO4jLJiKoLtUbwuvIL02pOjlcueBLfiUmXLgJ4aETeTfhymKMCPkCgYEA7uHoQNUr3Gy2wB7jlsL9N6ax+BKT/y9Z/2ZYMe2VOVu9lKxp2+FTd6v6qarjijsI10CXH/Wb6UqKayVvzq/LgMy8iP1L012hb7QOa4MiZtwonJ9KmjyS8ztj6rk81PIePrGYClgyOM+x8lTCwvpL31RHbuNn0PzOQ919w61XhRMCgYEAq5H+hkChr3WEQ1GKgjZkkg7bkogObl3Hbda9/4Lja5W9/jnXRK3kn1r6avu7NT+yHJMg2gUaIM+H4JG81MqBV0TcI2+U0mtQk0MDe9g6LnSNNUswll6ldQgIBkzzv8DNgxgqJ5xqzqvyON2TICy7C+x7hpBIIocuSo950GiZG48CgYBIG+tm/rJRxINZ9TkQPmX/kZMxZjJEmr+ZCAThdW1RNi9BHNaLqDXw7vook0xCYtWlXHsCC7r3riegdlmM06YjiCn1VDi6Yg4kUP71V01gLV8ZAECd1GEriSb9KNODGF8m36ccoEjwu0lk9E8iWjni/Wbew0iIXnfJJqgbFE1R/wKBgFY/SPTSLrVWXQu+ROOaVko6H9T0glSm3ebwaYi1kn91whG3n+iNhf05reLz8rMc9vt4Vq5inDTcPpD8kjFiL0zgd810fRqeCd5NdMXf97d8rbOZva4JnCFNzULlki7VzDnXfvF0pxiHxXcio6Ar/EdNNPd7NlftHq8qmvDSdA0vAoGAUYo2Pzdw/fubv7oDuJSrmVQu0U56JQoLVsKzPT2H0M1KhCwiimf+5oiPdHKKDSY95hRm9mvAbIRdvg+ASQbFi38PNWwLZ7HYsDstTqpqb1gxf+Qevf/T82jOC3nF3q4S+Th8+HrShp5Za+We8QRaJb4eWgPUeydAEkJ4n0Wiag4=";
    // 支付宝公钥
    private String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2iJ0MYzESe79LmFEqJtNhKMuRqGR296/J5qoRg4yxbhcMAPGuGxCxNonNXy/4ttKz6D9VZzE2xHL+lY+Ey44HOhxIIwnATBuAQC1zqN4hk2n0YJ7ECXIhegAamuy+uNV4j+79f0CvSHuGEMKkKcHlB2Hd08ZcHSUV2s1JKpvwK5qriCmJJNH98RSEaUbz1Fw1YpwHd1wmsQ/pUN3MvT3x6U1IkFLdU4NBP0q1wFDW1X0tpxoNYBK9yghjcWVF/Lau3dJy6p8UP0hrQVv2IDGUMf4qsOQbf71d+cX3qIhZTHdLbC8r0MsqVA5YCAYzpaqh3dZFxNpG4mAmiSj/w79fwIDAQAB";
    // 服务器异步通知页面路径
    private String notify_url_pay = "https://kafei666.gaojinyi.top/prod-api/api/aliPayNotifyUrl";
    // 服务器异步通知页面路径
    private String notify_url_order = "https://kafei666.gaojinyi.top/prod-api/api/aliOrderNotifyUrl";
    private String notify_url_recharge = "https://kafei666.gaojinyi.top/prod-api/api/aliRechargeNotifyUrl";
    // 页面跳转同步通知页面路径
    private String return_url = "/port/pay/return";
    // 签名方式
    private String sign_type = "RSA2";
    // 字符编码格式
    private String charset = "utf-8";
    // 返回格式
    private String format = "json";
    // 支付成功跳转页面
    private String paymentSuccessUrl = "";
    // 支付失败跳转页面
    private String paymentFailureUrl = "";

    public String getApp_id() {
        return app_id;
    }

    public String getMerchant_private_key() {
        return merchant_private_key;
    }

    public String getAlipay_public_key() {
        return alipay_public_key;
    }

    public String getNotify_url_pay() {
        return notify_url_pay;
    }

    public void setNotify_url_pay(String notify_url_pay) {
        this.notify_url_pay = notify_url_pay;
    }

    public String getNotify_url_order() {
        return notify_url_order;
    }

    public void setNotify_url_order(String notify_url_order) {
        this.notify_url_order = notify_url_order;
    }

    public String getSign_type() {
        return sign_type;
    }

    public String getCharset() {
        return charset;
    }

    public String getGatewayUrl() {
        return gatewayUrl;
    }

    public String getFormat() {
        return format;
    }

    public String getPaymentSuccessUrl() {
        return paymentSuccessUrl;
    }

    public String getPaymentFailureUrl() {
        return paymentFailureUrl;
    }

    public String getNotify_url_recharge() {
        return notify_url_recharge;
    }

    public void setNotify_url_recharge(String notify_url_recharge) {
        this.notify_url_recharge = notify_url_recharge;
    }
}
