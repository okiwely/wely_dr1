package com.huizu.common.utils.pay.paypal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.huizu.common.config.PayPalConfig;
import org.json.JSONObject;

import com.paypal.http.HttpResponse;
import com.paypal.http.serializer.Json;
import com.paypal.orders.AddressPortable;
import com.paypal.orders.AmountBreakdown;
import com.paypal.orders.AmountWithBreakdown;
import com.paypal.orders.ApplicationContext;
import com.paypal.orders.Item;
import com.paypal.orders.LinkDescription;
import com.paypal.orders.Money;
import com.paypal.orders.Name;
import com.paypal.orders.Order;
import com.paypal.orders.OrderRequest;
import com.paypal.orders.OrdersCreateRequest;
import com.paypal.orders.PurchaseUnitRequest;
import com.paypal.orders.ShippingDetail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 2. CreateOrder （创建订单）
 */
public class CreateOrder {

    private static final Logger log = LoggerFactory.getLogger(CreateOrder.class);
    private String clientId = PayPalConfig.getClientId();
    private String clientSecret = PayPalConfig.getClientSecret();
    private String mode = PayPalConfig.getMode();

    public static final String CAPTURE = "CAPTURE";
    /**
     * 该标签将覆盖PayPal网站上PayPal帐户中的公司名称
     */
    public static final String BRANDNAME = "Supernote";
    /**
     * LOGIN。当客户单击PayPal Checkout时，客户将被重定向到页面以登录PayPal并批准付款。
     * BILLING。当客户单击PayPal Checkout时，客户将被重定向到一个页面，以输入信用卡或借记卡以及完成购买所需的其他相关账单信息
     * NO_PREFERENCE。当客户单击“ PayPal Checkout”时，将根据其先前的交互方式将其重定向到页面以登录PayPal并批准付款，或重定向至页面以输入信用卡或借记卡以及完成购买所需的其他相关账单信息使用PayPal。
     * 默认值：NO_PREFERENCE
     */
    public static final String LANDINGPAGE = "NO_PREFERENCE";
    /**
     * CONTINUE。将客户重定向到PayPal付款页面后，将出现“ 继续”按钮。当结帐流程启动时最终金额未知时，请使用此选项，并且您想将客户重定向到商家页面而不处理付款。
     * PAY_NOW。将客户重定向到PayPal付款页面后，出现“ 立即付款”按钮。当启动结帐时知道最终金额并且您要在客户单击“ 立即付款”时立即处理付款时，请使用此选项。
     */
    public static final String USERACTION = "CONTINUE";
    /**
     * GET_FROM_FILE。使用贝宝网站上客户提供的送货地址。
     * NO_SHIPPING。从PayPal网站编辑送货地址。推荐用于数字商品
     * SET_PROVIDED_ADDRESS。使用商家提供的地址。客户无法在PayPal网站上更改此地址
     */
    public static final String SHIPPINGPREFERENCE = "GET_FROM_FILE";

    /**
     * 生成订单主体信息
     */
    private OrderRequest buildRequestBody(String orderCode,String money,String currencyCode) {
        OrderRequest orderRequest = new OrderRequest();
        orderRequest.checkoutPaymentIntent(CAPTURE);

        ApplicationContext applicationContext = new ApplicationContext()
                .brandName(BRANDNAME)
                .landingPage(LANDINGPAGE)
                .cancelUrl("https://www.example.com").returnUrl("https://www.example.com")
                .userAction(USERACTION)
                .shippingPreference(SHIPPINGPREFERENCE);
        orderRequest.applicationContext(applicationContext);

        List<PurchaseUnitRequest> purchaseUnitRequests = new ArrayList<PurchaseUnitRequest>();
        @SuppressWarnings("serial")
        PurchaseUnitRequest purchaseUnitRequest = new PurchaseUnitRequest()
                .description("PayPal支付")
                .customId(orderCode)
                .invoiceId(orderCode)
                .amountWithBreakdown(new AmountWithBreakdown()
                        .currencyCode(currencyCode)
                        .value(money)// value = itemTotal + shipping + handling + taxTotal + shippingDiscount;
//                        .amountBreakdown(new AmountBreakdown()
//                                .itemTotal(new Money().currencyCode("USD").value("220.00")) // itemTotal = Item[Supernote A6](value × quantity) + Item[帆布封套](value × quantity)
//                                .shipping(new Money().currencyCode("USD").value("0.00"))
//                                .handling(new Money().currencyCode("USD").value("0.00"))
//                                .taxTotal(new Money().currencyCode("USD").value("0.00"))
//                                .shippingDiscount(new Money().currencyCode("USD").value("0.00")))
                );
//                .items(new ArrayList<Item>() {
//                    {
//                        add(new Item().name("Supernote A6").description("丝滑般流畅的书写体验")
//                                .unitAmount(new Money()
//                                        .currencyCode("USD")
//                                        .value("200.00"))
//                                .quantity("1"));
//                        add(new Item().name("帆布封套").description("黑色帆布保护封套")
//                                .unitAmount(new Money()
//                                        .currencyCode("USD")
//                                        .value("20.00"))
//                                .quantity("1"));
//                    }
//                })
//                .shippingDetail(new ShippingDetail()
//                        .name(new Name().fullName("RATTA"))
//                        .addressPortable(new AddressPortable()
//                                .addressLine1("梅陇镇")
//                                .addressLine2("集心路168号")
//                                .adminArea2("闵行区")
//                                .adminArea1("上海市")
//                                .postalCode("20000")
//                                .countryCode("CN")));
        purchaseUnitRequests.add(purchaseUnitRequest);
        orderRequest.purchaseUnits(purchaseUnitRequests);
        return orderRequest;
    }

    /**
     * 创建订单的方法
     */
    public String createOrder(String orderCode,String money,String currencyCode) throws IOException {
        OrdersCreateRequest request = new OrdersCreateRequest();
        request.header("prefer","return=representation");
        request.requestBody(buildRequestBody(orderCode,money,currencyCode));
        PayPalClient payPalClient = new PayPalClient();
        HttpResponse<Order> response = null;
        try {
            response = payPalClient.client(mode, clientId, clientSecret).execute(request);
        } catch (IOException e1) {
            try {
                log.error("第1次调用paypal订单创建失败");
                response = payPalClient.client(mode, clientId, clientSecret).execute(request);
            } catch (Exception e) {
                try {
                    log.error("第2次调用paypal订单创建失败");
                    response = payPalClient.client(mode, clientId, clientSecret).execute(request);
                } catch (Exception e2) {
                    log.error("第3次调用paypal订单创建失败，失败原因：{}", e2.getMessage());
                }
            }
        }
        String approve = "";
        if (response.statusCode() == 201) {
            log.info("Status Code = {}, Status = {}, OrderID = {}, Intent = {}", response.statusCode(), response.result().status(), response.result().id(), response.result().checkoutPaymentIntent());
            for (LinkDescription link : response.result().links()) {
                log.info("Links-{}: {}    \tCall Type: {}", link.rel(), link.href(), link.method());
                if(link.rel().equals("approve")) {
                    approve = link.href();
                }
            }
            String totalAmount = response.result().purchaseUnits().get(0).amountWithBreakdown().currencyCode() + ":" + response.result().purchaseUnits().get(0).amountWithBreakdown().value();
            log.info("Total Amount: {}", totalAmount);
            String json= new JSONObject(new Json().serialize(response.result())).toString(4);
            log.info("createOrder response body: {}", json);
        }
        return approve;
    }


    public static void main(String args[]) {
        try {
            String approveUrl = new CreateOrder().createOrder("DD345362334326","220.00","JPY");
            System.out.println("approveUrl = "+ approveUrl);
        } catch (com.paypal.http.exceptions.HttpException e) {
            System.out.println(e.getLocalizedMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
