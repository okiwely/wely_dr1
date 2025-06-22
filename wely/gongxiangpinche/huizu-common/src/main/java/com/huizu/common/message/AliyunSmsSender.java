package com.huizu.common.message;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;

public class AliyunSmsSender {

    private final String codeParameterKey = "code";
    // 设置AccessKeyId，AccessKeySecret（在阿里云控制台获取）
    private static String accessKeyId = "LTAI5tPVtH1F5Bb5dzL7zTE4";
    private static String accessKeySecret = "你的AccessKeySecret";
    private static String endpoint;
    private static String signName = "阿里云短信测试";
    private static String code = "SMS_154950909";
    private static String data;

    public static void main(String[] args) {
        new AliyunSmsSender().sendMessage("1234","15552833781");
    }
    public static void sendMessage(String code,String phone) {
        // 创建DefaultAcsClient实例并初始化
//        DefaultProfile profile = DefaultProfile.getProfile("ap-northeast-1", accessKeyId, accessKeySecret);
        DefaultProfile profile = DefaultProfile.getProfile("cn-beijing", accessKeyId, accessKeySecret);
        IAcsClient client = new DefaultAcsClient(profile);

        // 创建API请求并设置参数
        SendSmsRequest request = new SendSmsRequest();
        request.setPhoneNumbers(phone);
        request.setSignName(signName);
        request.setTemplateCode(code);
        // 设置模板变量, 假设模板中只有一个变量${code}
        String message = "{\"code\":\"${code}\"}".replace("${code}", code);
        request.setTemplateParam(message);
        // 发起请求并获取响应
        try {
            SendSmsResponse response = client.getAcsResponse(request);
            System.out.println("短信发送成功。MessageId：" + response);
        } catch (ClientException e) {
            e.printStackTrace();
            System.out.println("短信发送失败");
        }
    }
}
