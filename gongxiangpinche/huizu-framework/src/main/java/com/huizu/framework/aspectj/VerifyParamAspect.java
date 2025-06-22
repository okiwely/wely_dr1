package com.huizu.framework.aspectj;


import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.annotation.VerifyParam;
import com.huizu.common.constant.HttpStatus;
import com.huizu.common.exception.ServiceException;
import com.huizu.common.utils.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class VerifyParamAspect {

    @Before("@annotation(verifyParam)")
    public void doBefore(JoinPoint point, VerifyParam verifyParam) throws Throwable {
        if (point.getArgs() == null){
            throw new ServiceException("要求体欠損です", HttpStatus.ERROR);
        }

        JSONObject jsonObject = (JSONObject) point.getArgs()[0];
        if (jsonObject == null){
            throw new ServiceException("まずはログインをお願いします", HttpStatus.ERROR);
        }

        String value = verifyParam.value();
        if ("".equals(value)){
            return;
        }
        String[] split = value.split(",");

        StringBuilder stringBuilder = null;
        for (String s : split) {
            if (StringUtils.isEmpty(jsonObject.getString(s))){
                if (stringBuilder == null){
                    stringBuilder = new StringBuilder();
                }
                if ("customerId".equals(s)){
                    stringBuilder.append("登録をお願いします");
                }else {
                    stringBuilder.append("参数不能为空:'").append(s).append("',");
                }
            }
        }
        if (stringBuilder != null){
            throw new ServiceException(stringBuilder.substring(0,stringBuilder.length() - 1), HttpStatus.ERROR);
        }
    }
}
