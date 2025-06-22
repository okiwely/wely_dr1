package com.huizu.common.utils.pay.paypal;

import java.io.IOException;

import com.huizu.common.config.PayPalConfig;
import com.paypal.orders.*;

import org.json.JSONObject;

import com.paypal.http.HttpResponse;
import com.paypal.http.serializer.Json;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 3. CaptureOrder（执行扣款）
 *
 * 用户通过CreateOrder生成 approveUrl 跳转paypal支付成功后，只是授权，并没有将用户的钱打入我们的paypal账户，我们需要通过 CaptureOrder接口，将钱打入我的PayPal账户　
 */
public class CaptureOrder extends PayPalClient {
    private static final Logger log = LoggerFactory.getLogger(CaptureOrder.class);
    private String clientId = PayPalConfig.getClientId();
    private String clientSecret = PayPalConfig.getClientSecret();
    private String mode = PayPalConfig.getMode();

    public OrderRequest buildRequestBody() {
        return new OrderRequest();
    }

    /**
     * 用户授权支付成功，进行扣款操作
     */
    public HttpResponse<Order> captureOrder(String orderId) throws IOException {
        OrdersCaptureRequest request = new OrdersCaptureRequest(orderId);
        request.requestBody(new OrderRequest());
        PayPalClient payPalClient = new PayPalClient();
        HttpResponse<Order> response = null;
        try {
            response = payPalClient.client(mode, clientId, clientSecret).execute(request);
        } catch (IOException e1) {
            try {
                log.error("第1次调用paypal扣款失败");
                response = payPalClient.client(mode, clientId, clientSecret).execute(request);
            } catch (Exception e) {
                try {
                    log.error("第2次调用paypal扣款失败");
                    response = payPalClient.client(mode, clientId, clientSecret).execute(request);
                } catch (Exception e2) {
                    log.error("第3次调用paypal扣款失败，失败原因 {}", e2.getMessage() );
                }
            }
        }
        log.info("Status Code = {}, Status = {}, OrderID = {}", response.statusCode(), response.result().status(), response.result().id());
        for (LinkDescription link : response.result().links()) {
            log.info("Links-{}: {}    \tCall Type: {}", link.rel(), link.href(), link.method());
        }
        for (PurchaseUnit purchaseUnit : response.result().purchaseUnits()) {
            for (Capture capture : purchaseUnit.payments().captures()) {
                log.info("Capture id: {}", capture.id());
                log.info("status: {}", capture.status());
                log.info("invoice_id: {}", capture.invoiceId());
                if("COMPLETED".equals(capture.status())) {
                    //进行数据库操作，修改订单状态为已支付成功，尽快发货（配合回调和CapturesGet查询确定成功）
                    log.info("支付成功,状态为=COMPLETED");
                }
                if("PENDING".equals(capture.status())) {
                    log.info("status_details: {}", capture.captureStatusDetails().reason());
                    String reason = "PENDING";
                    if(capture.captureStatusDetails() != null && capture.captureStatusDetails().reason() != null) {
                        reason = capture.captureStatusDetails().reason();
                    }
                    //进行数据库操作，修改订单状态为已支付成功，但触发了人工审核，请审核通过后再发货（配合回调和CapturesGet查询确定成功）
                    log.info("支付成功,状态为=PENDING : {}", reason);
                }
            }
        }
        Payer buyer = response.result().payer();
        log.info("Buyer Email Address: {}", buyer.email());
        log.info("Buyer Name: {} {}", buyer.name().givenName(), buyer.name().surname());
        String json = new JSONObject(new Json().serialize(response.result())).toString(4);
        log.info("captureOrder response body: {}", json);
        return response;
    }


    public static void main(String[] args) {
        try {
            new CaptureOrder().captureOrder("1X2757178V755402E");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
