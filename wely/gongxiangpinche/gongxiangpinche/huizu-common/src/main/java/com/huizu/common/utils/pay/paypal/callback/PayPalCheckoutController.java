//package com.huizu.common.utils.pay.paypal.callback;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.validation.Valid;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RestController;
//import com.ratta.service.PayPalCheckoutService;
//import com.ratta.util.RequestToMapUtil;
//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiImplicitParam;
//import io.swagger.annotations.ApiOperation;
//
//@RestController
//@Api(description = "PayPalCheckout接口")
//public class PayPalCheckoutController {
//
//    @Autowired
//    private PayPalCheckoutService payPalCheckoutService;
//
//    @ApiOperation(value = "ipn异步回调")
//    @PostMapping(value = "/paypal/ipn/back")
//    public String callback(HttpServletRequest request, HttpServletResponse response) {
//        return payPalCheckoutService.callback(RequestToMapUtil.getParameterMap(request));
//    }
//}
