package com.huizu.common.message;

import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.redis.RedisCache;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 发送手机短信工具类
 * <p>
 * 1、发送验证码前校验 2、发送验证码之后操作
 *
 * @version 1.0.0
 * @date 2017年2月6日
 */
public class SendSmsUtil {
    public static final String SMS_CODE_KEY = "sms_code_key_%s";
    protected static final Logger logger = LoggerFactory.getLogger(SendSmsUtil.class);

    /**
     * 发送手机验证码之前执行
     *
     * @param mobile
     * @return
     */
    public static JSONObject sendSmsBeforeExecute(String mobile) {
        JSONObject result = new JSONObject();
        if (StringUtils.isBlank(mobile)) {
            result.put("isSuccess", false);
            result.put("msg", "手机号不能为空");
            return result;
        }
        if (!MatcherUtil.isMobile(mobile)) {
            result.put("isSuccess", false);
            result.put("msg", "请输入正确的手机号");
            return result;
        }
        result.put("isSuccess", true);
        result.put("msg", "校验成功!");
        return result;
    }

    /**
     * 发短信验证码之后执行
     *
     * @return
     */
    public static JSONObject sendSmsAfterExecute() {
        JSONObject result = new JSONObject();
        result.put("isSuccess", true);
        result.put("msg", "设置成功!");
        return result;
    }

    /**
     * 校验手机验证码
     */
    public static boolean verifyCode(RedisCache redis, String mobile, String code) {
        String redisCode = redis.getCacheObject(String.format(SendSmsUtil.SMS_CODE_KEY, mobile));
        if (StringUtils.isBlank(redisCode)) {
            return false;
        }
        if (!redisCode.equals(code.trim())) {
            return false;
        }
        redis.deleteObject(String.format(SendSmsUtil.SMS_CODE_KEY, mobile));
        return true;
    }

}
