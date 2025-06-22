package com.huizu.common.message;

import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.utils.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

/**
 * 奇讯云
 */
public class SendMessageUtils2 {
    private static final String appkey = "1Lh6Y3";
    private static final String appsecret = "OAUYCX";
    private static final String url = "http://sms.qxcioud.com:9090/sms/batch/v1";
    private static final String appcode = "1000";
    private static final String autograph = "【齐东商城】";

    /**
     * 短信发送主方法
     *
     * @param msgContent
     * @param phone
     */
    public static boolean sendMessage(String msgContent, String phone) {
        HttpClient httpClient = null;
        HttpPost httppost = null;
        try {
            httpClient = new DefaultHttpClient();
            httppost = new HttpPost(url);

            Map<String, String> map = new HashMap<>();
            map.put("appkey", appkey);
            map.put("appcode", appcode);
            String timestamp = System.currentTimeMillis() + "";
            map.put("timestamp", timestamp);
            map.put("phone", phone);
            map.put("msg", msgContent);
            String sign = md5(appkey + appsecret + timestamp);
            map.put("sign", sign);
            map.put("extend", "");
            String json = JSONObject.toJSONString(map);
            StringEntity formEntity = new StringEntity(json, "utf-8");
            httppost.setEntity(formEntity);
            HttpResponse httpresponse = null;
            httpresponse = httpClient.execute(httppost);
            HttpEntity httpEntity = httpresponse.getEntity();
            String response = EntityUtils.toString(httpEntity, "utf-8");
            System.out.println(response);
            if (StringUtils.isNotBlank(response)) {
                JSONObject jsonObject = JSONObject.parseObject(response, JSONObject.class);
                return "00000".equals(jsonObject.getString("code"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private static String md5(String param) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        byte[] md5Byte = md5.digest(param.getBytes(StandardCharsets.UTF_8));
        String result = byteToHex(md5Byte);
        return result;
    }

    private static String byteToHex(byte[] md5Byte) {
        String result = "";
        StringBuilder sb = new StringBuilder();
        for (byte each : md5Byte) {
            int value = each & 0xff;
            String hex = Integer.toHexString(value);
            if (value < 16) {
                sb.append("0");
            }
            sb.append(hex);
        }
        result = sb.toString();
        return result;
    }

    public static int byte4ToInteger(byte[] b, int offset) {
        return (0xff & b[offset]) << 24 | (0xff & b[offset + 1]) << 16 |
                (0xff & b[offset + 2]) << 8 | (0xff & b[offset + 3]);
    }

    /**
     * 发送用户登陆
     *
     * @param code
     * @return
     */
    public static boolean sendLoginCode(String code, String phoneNumber) {
        String message = autograph + "验证码${code}，五分钟内有效。您正在登录，若非本人操作，请勿泄露。";
        message = message.replace("${code}", code);
        return sendMessage(message, phoneNumber);
    }

    /**
     * 发送用户注册
     *
     * @param code
     * @return
     */
    public static boolean sendRegisterCode(String code, String phoneNumber) {
        String message = autograph + "验证码${code}，五分钟内有效。您正在注册成为新用户，感谢您的支持！";
        message = message.replace("${code}", code);
        return sendMessage(message, phoneNumber);
    }

    /**
     * 发送修改密码
     *
     * @param code
     * @return
     */
    public static boolean sendUpdatePwdCode(String code, String phoneNumber) {
        String message = autograph + "验证码${code}，五分钟内有效。您正在修改密码，感谢您的支持！";
        message = message.replace("${code}", code);
        return sendMessage(message, phoneNumber);
    }

}
