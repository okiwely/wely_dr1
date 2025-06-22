package com.huizu.common.message;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.liantuo.front.util.HttpClientUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 网信
 */
public class SendMessageUtils {
    private static final String apikey = "674e4f860aa24ad9b866aa366ece7db5";
    private static final String url = "http://115.28.96.167:8081/";
    private static final String userId = "352135";
    private static final String autograph = "【共享拼车】";

    /**
     * 短信发送主方法
     *
     * @param msgContent
     * @param phone
     */
    public static boolean sendMessage(String msgContent, String phone) {
        Long ts = System.currentTimeMillis();
        Map<String, String> paras = new HashMap<String, String>();
        paras.put("userid", userId); // 用户id
        paras.put("ts", ts.toString());
        paras.put("sign", SecurityUtil.md5enc(userId + ts + apikey).toLowerCase());
        paras.put("mobile", phone);
        paras.put("msgcontent", msgContent);
        String result =
                HttpClientUtil.requestAsHttpPOST(
                        url + "api/sms/send", paras, "utf-8", 10000, 20000);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> resmap = null;
        try {
            resmap = mapper.readValue(result, Map.class);
            if ("0".equals(resmap.get("code"))) { // 返回成功
                return true;
            } else {
                return false;
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
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
