package com.huizu.project.utils;// 步骤说明：


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;


import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;


// 验证码生成与存储：

// 使用随机数生成器生成6位验证码。
// 将验证码、手机号和过期时间存储在数据库或内存中（如Redis）。
// 验证码发送接口：

// 前端请求发送验证码时，后端生成验证码，并通过SMS API发送到用户的手机号。
// 限制发送频率，比如每个手机号每分钟只能发送一次验证码。
// 验证码验证接口：

// 用户提交验证码后，后端通过验证手机号和验证码是否匹配以及验证码是否过期来判断其有效性。
// Redis存储验证码：

// 使用Redis来存储验证码信息，并设置过期时间（如5分钟）。
//验证码生成、发送、存储和验证逻辑
@Service
public class sms {

    @Autowired
    private StringRedisTemplate redisTemplate;

    private static final String API_URL = "https://sandbox.sms2.nexlink2.jp/api/v1/short_messages";
    private static final String API_TOKEN = "YOUR_API_TOKEN";
    private static final long EXPIRE_TIME = 5 * 60; // 验证码过期时间（秒）

    // 生成验证码
    public String generateCode() {
        return String.valueOf((int) (Math.random() * 900000) + 100000); // 生成6位验证码
    }

    // 发送短信验证码
//    public void sendSMS(String phoneNumber, String message) throws Exception {
//        String requestBody = String.format("{\"phone_number\":\"%s\", \"text_message\":\"%s\", \"click_count\":true}", phoneNumber, message);
//
//        HttpRequest request = HttpRequest.newBuilder()
//                .uri(URI.create(API_URL))
//                .header("Authorization", "Bearer " + API_TOKEN)
//                .header("Content-Type", "application/json")
//                .POST(HttpRequest.BodyPublishers.ofString(requestBody))
//                .build();
//
//        HttpClient client = HttpClient.newHttpClient();
//        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
//
//        if (response.statusCode() != 200) {
//            throw new RuntimeException("SMS sending failed");
//        }
//    }

    public static void main(String[] args) throws Exception {

        new sms().sendSMS1("15552833781","111");
    }
    public void sendSMS1(String phoneNumber, String message) throws Exception {
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
                // 检查响应状态码
                if (response.getStatusLine().getStatusCode() != 200) {
                    System.err.println(EntityUtils.toString(response.getEntity()));
                    throw new RuntimeException("SMS sending failed");
                }

                // 如果你想查看响应体（可选）
                HttpEntity responseEntity = response.getEntity();
                if (responseEntity != null) {
                    String responseBody = EntityUtils.toString(responseEntity);
                    System.err.println(responseBody);
                    // 处理响应体...
                }
            }
        }
    }
}

//@RestController
//@RequestMapping("/api/v1/sms")
//public class SMSController {
//
//    @Autowired
//    private SMSService smsService;
//
//    // 发送验证码
//    @PostMapping("/send")
//    public ResponseEntity<String> sendSMS(@RequestBody Map<String, String> request) {
//        String phoneNumber = request.get("phone_number");
//        String code = smsService.generateCode();  // 生成验证码
//        String message = "您的验证码是: " + code;
//
//        try {
//            smsService.sendSMS(phoneNumber, message);
//            smsService.saveCode(phoneNumber, code);  // 保存验证码到Redis
//            return ResponseEntity.ok("SMS sent successfully.");
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to send SMS.");
//        }
//    }
//
//    // 验证验证码
//    @PostMapping("/verify")
//    public ResponseEntity<String> verifyCode(@RequestBody Map<String, String> request) {
//        String phoneNumber = request.get("phone_number");
//        String code = request.get("code");
//
//        if (smsService.verifyCode(phoneNumber, code)) {
//            return ResponseEntity.ok("Verification successful.");
//        } else {
//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Verification failed.");
//        }
//    }
