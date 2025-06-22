package com.huizu.common.utils.pay.paypal;

import java.io.IOException;
import java.util.List;

import com.huizu.common.config.PayPalConfig;
import org.json.JSONObject;

import com.paypal.http.HttpResponse;
import com.paypal.http.serializer.Json;
import com.paypal.orders.Capture;
import com.paypal.orders.Order;
import com.paypal.orders.OrdersGetRequest;
import com.paypal.orders.Refund;

/**
 * 5. OrdersGet（查询订单详情）
 */
public class OrdersGet extends PayPalClient {

    private String clientId = PayPalConfig.getClientId();
    private String clientSecret = PayPalConfig.getClientSecret();
    private String mode = PayPalConfig.getMode();

    public void testOrdersGetRequest(String orderId) throws IOException {

        OrdersGetRequest request = new OrdersGetRequest(orderId);

        HttpResponse<Order> response = null;
        try {
            response = client(mode, clientId, clientSecret).execute(request);
        } catch (Exception e) {
            try {
                System.out.println("调用paypal订单查询失败，链接异常1");
                response = client(mode, clientId, clientSecret).execute(request);
            } catch (Exception e2) {
                try {
                    System.out.println("调用paypal订单查询失败，链接异常2");
                    response = client(mode, clientId, clientSecret).execute(request);
                } catch (Exception e3) {
                    System.out.println("调用paypal订单查询失败，链接异常3");
                    System.out.println(e3.getMessage());
                }
            }
        }
        System.out.println("Status Code: " + response.statusCode());
        System.out.println("Status: " + response.result().status());
        System.out.println("Order id: " + response.result().id());
        if(response.result().purchaseUnits().get(0).payments() != null) {
            List<Capture> captures = response.result().purchaseUnits().get(0).payments().captures();
            if(captures != null) {
                for (Capture capture : captures) {
                    System.out.println("\t订单编号= " + capture.invoiceId() + "\tCapture Id= " + capture.id() + "\tCapture status= " + capture.status() + "\tCapture amount= " + capture.amount().currencyCode() + ":" + capture.amount().value());
                }
            }
            List<Refund> refunds = response.result().purchaseUnits().get(0).payments().refunds();
            if(refunds != null) {
                for (Refund refund : refunds) {
                    System.out.println("\t售后编号= " + refund.invoiceId() + "\tRefund Id= " + refund.id() + "\tRefund status= " + refund.status() + "\tRefund amount= " + refund.amount().currencyCode() + ":" + refund.amount().value());
                }
            }

        }
        System.out.println("Links: ");
        for (com.paypal.orders.LinkDescription link : response.result().links()) {
            System.out.println("\t" + link.rel() + ": " + link.href() + "\tCall Type: " + link.method());
        }

        System.out.println("Full response body:");
        String json = new JSONObject(new Json().serialize(response.result())).toString(4);
        System.out.println(json);
    }

     public static void main(String[] args) {
        try {
            new OrdersGet().testOrdersGetRequest("1X2757178V755402E");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
