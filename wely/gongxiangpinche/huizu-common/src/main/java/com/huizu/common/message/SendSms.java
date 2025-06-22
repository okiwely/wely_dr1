package com.huizu.common.message;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.profile.DefaultProfile;
import com.google.gson.Gson;
import java.util.*;
import com.aliyuncs.dysmsapi.model.v20170525.*;
/*
pom.xml
<dependency>
  <groupId>com.aliyun</groupId>
  <artifactId>aliyun-java-sdk-core</artifactId>
  <version>4.6.0</version>
</dependency>
*/

public class SendSms {

    public static void main(String[] args) {

        // Please ensure that the environment variables ALIBABA_CLOUD_ACCESS_KEY_ID and ALIBABA_CLOUD_ACCESS_KEY_SECRET are set.
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", System.getenv("ALIBABA_CLOUD_ACCESS_KEY_ID"), System.getenv("ALIBABA_CLOUD_ACCESS_KEY_SECRET"));
        /** use STS Token
        DefaultProfile profile = DefaultProfile.getProfile(
            "<your-region-id>",           // The region ID
            System.getenv("ALIBABA_CLOUD_ACCESS_KEY_ID"),       // The AccessKey ID of the RAM account
            System.getenv("ALIBABA_CLOUD_ACCESS_KEY_SECRET"),   // The AccessKey Secret of the RAM account
            System.getenv("ALIBABA_CLOUD_SECURITY_TOKEN"));     // STS Token
        **/

        IAcsClient client = new DefaultAcsClient(profile);


        SendSmsRequest request = new SendSmsRequest();
        request.setSignName("阿里云短信测试");
        request.setTemplateCode("SMS_154950909");
        request.setPhoneNumbers("15552833781");
        request.setTemplateParam("{\"code\":\"1234\"}");

        try {
            SendSmsResponse response = client.getAcsResponse(request);
            System.out.println(new Gson().toJson(response));
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            System.out.println("ErrCode:" + e.getErrCode());
            System.out.println("ErrMsg:" + e.getErrMsg());
            System.out.println("RequestId:" + e.getRequestId());
        }

    }
}
