package com.huizu.project.utils;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

public class SMSUtil {

    private static final String API_URL = "https://sandbox.sms2.nexlink2.jp/api/v1/short_messages";
    private static final String API_TOKEN = "YOUR_API_TOKEN";
    private static final long EXPIRE_TIME = 5 * 60; // 验证码过期时间（秒）
    private static final String autograph = "【共享拼车】";

    public static void main(String[] args) throws Exception {
        SMSUtil.sendSMS("15552833781","111");
    }
    public static boolean sendSMS(String phoneNumber, String code) {
        String message = autograph + "验证码${code}，五分钟内有效。您正在注册成为新用户，感谢您的支持！";
        message = message.replace("${code}", code);
        String requestBody = String.format("{\"phone_number\":\"%s\", \"text_message\":\"%s\", \"click_count\":true}", phoneNumber, message);

        // 创建HttpClient实例
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost httpPost = new HttpPost(API_URL);

            // 设置请求头
            httpPost.setHeader("Authorization", "Bearer " + API_TOKEN);
            httpPost.setHeader("Content-Type", "application/json");

            // 设置请求体
            StringEntity entity = new StringEntity(requestBody);
            httpPost.setEntity(entity);

            // 发送请求并获取响应
            try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
                System.err.println(EntityUtils.toString(response.getEntity()));
                // 检查响应状态码
                if (response.getStatusLine().getStatusCode() != 200) {
                    return false;
                }else {
                    return true;
                }
            }
        }catch (Exception e){
            return false;
        }
    }
}
