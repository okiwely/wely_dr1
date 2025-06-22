package com.huizu.common.enums;

/**
 * <p>
 * 非表字段的枚举值，比如预定好的类型
 * </p>
 *
 * @author lixueju
 * @since 2019-03-25
 */
public class CommonEunm extends EnumMethod {
    public enum VerifyCodeFlag implements IEnum {
        login(1, "登录验证码"),
        register(2, "注册验证码"),
        updatePwd(3, "修改密码验证码");

        /**
         * code码
         */
        private int code;
        /**
         * 描述
         */
        private String desc;

        private VerifyCodeFlag(int code, String desc) {
            this.code = code;
            this.desc = desc;
        }

        @Override
        public int code() {
            return code;
        }

        @Override
        public String desc() {
            return desc;
        }
    }

    public enum PayType implements IEnum {
        alipay(1, "支付宝支付"),
        weixin(2, "微信支付");

        /**
         * code码
         */
        private int code;
        /**
         * 描述
         */
        private String desc;

        private PayType(int code, String desc) {
            this.code = code;
            this.desc = desc;
        }

        @Override
        public int code() {
            return code;
        }

        @Override
        public String desc() {
            return desc;
        }
    }

}
