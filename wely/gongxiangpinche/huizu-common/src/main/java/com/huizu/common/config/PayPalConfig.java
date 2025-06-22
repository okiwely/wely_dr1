package com.huizu.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "paypal")
public class PayPalConfig {


    /**id*/
    public static String clientId = "AZoZHKgmFh-kDtoy3XbpZNKQYn2imaQ3HlUDSDMuvjpID-y-imh4ALDy4a4vtkjWslwM6WKSG7cQavQF";
    /**密钥*/
    public static String clientSecret = "EH4-ja3I3iqO9ZrMVMdL0IW3UJdAwChSlZtBtQ5T6MQJTI7iA18zsFbHzWEoEJAi_DSSILpLcCcVFPIm";
    /** paypal连接环境：live表示生产，sandbox表示沙盒 */
    public static String mode = "sandbox";

    public static String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        PayPalConfig.clientId = clientId;
    }

    public static String getClientSecret() {
        return clientSecret;
    }

    public void setClientSecret(String clientSecret) {
        PayPalConfig.clientSecret = clientSecret;
    }

    public static String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        PayPalConfig.mode = mode;
    }
}
