package com.huizu.common.enums;

/**
 * <p>
 * 定义所有枚举类的接口类型
 * 所有枚举类必须实现此接口
 * </p>
 *
 * @author lixueju
 * @since 2019/3/14 0:21
 */

public interface IEnum {
    /**
     * 定义枚举码
     */
    public int code();

    /**
     * 定义枚举描述
     */
    public String desc();
}
