package com.huizu.common.utils.withdraw;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;

import javax.net.ssl.SSLContext;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * 微信退款申请
 */
public class WXPayRefund {

    /**
     * 微信退款申请
     *
     * @param orderNo
     * @param totalFee
     * @param refundFee
     * @return
     */
    public static Boolean refund(String orderNo, String totalFee, String refundFee) {
        HashMap<String, String> map = new HashMap<>();
        WXPayRefund wxPayRefund = new WXPayRefund();
        map.put("out_trade_no", orderNo);
        map.put("total_fee", totalFee);
        map.put("refund_fee", refundFee);
        map.put("out_refund_no", orderNo);
        try {
            Map refund = wxPayRefund.Refund(map);
            return "SUCCESS".equals(refund.get("return_code")) && "SUCCESS".equals(refund.get("result_code"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private Map Refund(Map<String, String> reqData) throws Exception {
        StringBuilder sb = new StringBuilder();
        /**
         * 时间字符串
         */
        String currTime = PayForUtil.getCurrTime();
        String strTime = currTime.substring(8);
        String strRandom = PayForUtil.buildRandom(4) + "";
        String nonce_str = strTime + strRandom;

        SortedMap<String, String> parameters = new TreeMap<>();
        parameters.put("appid", WXPayConfig.APPID);
        parameters.put("mch_id", WXPayConfig.MCHID);
        parameters.put("nonce_str", nonce_str);
        // 微信支付订单中的out_trade_no
        parameters.put("out_trade_no", reqData.get("out_trade_no"));
        // 我们自己设定的退款申请号，约束为UK
        parameters.put("out_refund_no", reqData.get("out_refund_no"));
        // 单位为分
        parameters.put("total_fee", reqData.get("total_fee"));
        // 单位为分
        parameters.put("refund_fee", reqData.get("refund_fee"));
        parameters.put("op_user_id", WXPayConfig.MCHID);
        String sign = PayForUtil.generateSignature(parameters, WXPayConfig.APIKEY, "MD5");  //获取签名
        parameters.put("sign", sign);

        String reuqestXml = PayForUtil.getRequestXml(parameters);//将请求参数转换成String类型
        char[] password = WXPayConfig.MCHID.toCharArray();
        InputStream certStream = WXPayConfig.getCertStream();
        KeyStore keyStore = KeyStore.getInstance("PKCS12");
        keyStore.load(certStream, password);

        SSLContext sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore, WXPayConfig.MCHID.toCharArray()).build();
        SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, new String[]{"TLSv1"}, null, SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
        CloseableHttpClient httpclient = HttpClients.custom().setSSLSocketFactory(sslsf).build();
        try {
            HttpPost httpPost = new HttpPost("https://api.mch.weixin.qq.com/secapi/pay/refund");//退款接口
            StringEntity reqEntity = new StringEntity(reuqestXml);
            // 设置类型
            reqEntity.setContentType("application/x-www-form-urlencoded");
            httpPost.setEntity(reqEntity);
            CloseableHttpResponse response = httpclient.execute(httpPost);
            try {
                HttpEntity entity = response.getEntity();
                if (entity != null) {
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent(), StandardCharsets.UTF_8));
                    String line = null;
                    while ((line = bufferedReader.readLine()) != null) {
                        sb.append(line);
                        sb.append("\r\n");
                    }
                }
                EntityUtils.consume(entity);
            } finally {
                response.close();
            }
        } finally {
            httpclient.close();
        }
        return XMLUtil.doXMLParse(sb.toString());
    }

}
