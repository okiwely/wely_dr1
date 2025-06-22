package com.huizu.common.utils.pay.paypal;


import java.io.IOException;

import com.huizu.common.config.PayPalConfig;
import org.json.JSONObject;

import com.paypal.http.HttpResponse;
import com.paypal.http.serializer.Json;
import com.paypal.payments.Capture;
import com.paypal.payments.CapturesGetRequest;
import com.paypal.payments.LinkDescription;

/**
 * 6. CapturesGet（查询扣款详情）
 */
public class CapturesGet extends PayPalClient {

    private String clientId = PayPalConfig.getClientId();
    private String clientSecret = PayPalConfig.getClientSecret();
    private String mode = PayPalConfig.getMode();

    public void testCapturesGetRequest(String captureId) throws IOException {
           CapturesGetRequest request = new CapturesGetRequest(captureId);

           HttpResponse<Capture> response = client(mode, clientId, clientSecret).execute(request);
           System.out.println("Status Code: " + response.statusCode());
           System.out.println("Status: " + response.result().status());
           System.out.println("Capture ids: " + response.result().id());
           System.out.println("Links: ");
           for (LinkDescription link : response.result().links()) {
               System.out.println("\t" + link.rel() + ": " + link.href() + "\tCall Type: " + link.method());
           }
           System.out.println("Full response body:");
           System.out.println(new JSONObject(new Json().serialize(response.result())).toString(4));
       }
    public static void main(String[] args) {
       try {
           new CapturesGet().testCapturesGetRequest("扣款id， CaptureOrder生成");
       } catch (IOException e) {
           e.printStackTrace();
       }
   }
}
