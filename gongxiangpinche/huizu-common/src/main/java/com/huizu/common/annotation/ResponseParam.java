package com.huizu.common.annotation;

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ResponseParam {

    /**
     * 返回参数
     */
    public String value() default "";
}
