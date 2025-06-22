package com.huizu.common.utils.pay.paypal;

import com.huizu.common.config.PayPalConfig;
import com.paypal.http.HttpResponse;
import com.paypal.http.serializer.Json;
import com.paypal.payments.LinkDescription;
import com.paypal.payments.Refund;
import com.paypal.payments.RefundsGetRequest;

import org.json.JSONObject;

import java.io.IOException;

/**
 * 7. RefundsGet（查询退款详情）
 */
public class RefundsGet extends PayPalClient  {

    private String clientId = PayPalConfig.getClientId();
    private String clientSecret = PayPalConfig.getClientSecret();
    private String mode = PayPalConfig.getMode();

    public void testRefundsGetRequest() throws IOException {
        RefundsGetRequest request = new RefundsGetRequest("退款id RefundOrder生成");
        HttpResponse<Refund> response = client(mode, clientId, clientSecret).execute(request);
        System.out.println("Status Code: " + response.statusCode());
        System.out.println("Status: " + response.result().status());
        System.out.println("Refund Id: " + response.result().id());
        System.out.println("Links: ");
        for (LinkDescription link : response.result().links()) {
            System.out.println("\t" + link.rel() + ": " + link.href() + "\tCall Type: " + link.method());
        }
        System.out.println("Full response body:");
        System.out.println(new JSONObject(new Json().serialize(response.result())).toString(4));
    }

     public static void main(String[] args) {
        try {
            new RefundsGet().testRefundsGetRequest();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
