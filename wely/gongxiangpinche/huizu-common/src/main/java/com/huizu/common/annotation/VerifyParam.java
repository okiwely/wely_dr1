package com.huizu.common.annotation;



import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface VerifyParam {

    /**
     * 传入参数验证
     */
    public String value() default "";
}
