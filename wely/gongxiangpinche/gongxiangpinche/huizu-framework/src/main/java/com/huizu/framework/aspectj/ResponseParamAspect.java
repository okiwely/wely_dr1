package com.huizu.framework.aspectj;

import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.annotation.ResponseParam;
import com.huizu.common.constant.HttpStatus;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.common.utils.bean.BeanUtils;
import net.sf.json.util.JSONUtils;
import org.apache.commons.lang.ArrayUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.Iterator;
import java.util.Set;

@Aspect
@Component
public class ResponseParamAspect {

    @Around("@annotation(responseParam)")
    public Object after(ProceedingJoinPoint point, ResponseParam responseParam) throws Throwable {

        AjaxResult result = (AjaxResult) point.proceed();

        if (result == null){
            return AjaxResult.error();
        }

        if (!result.get(AjaxResult.CODE_TAG).equals(HttpStatus.SUCCESS)){
            return result;
        }

        JSONObject jsonObject = (JSONObject)result.get(AjaxResult.DATA_TAG);
        if (jsonObject.isEmpty()){
            return result;
        }

        String value = responseParam.value();
        if ("".equals(value)) {
            return result;
        }

        String[] split = value.split(",");
        Iterator<String> keys = jsonObject.keySet().iterator();
        while (keys.hasNext()) {
            String key = keys.next();
            if (!ArrayUtils.contains(split,key)){
                keys.remove();
            }
        }

        for (String s: split){
            if (jsonObject.get(s) == null){
                jsonObject.put(s,"");
            }
        }
        return result;
    }
}
