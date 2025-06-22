package com.huizu.api.service;

import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ApiService {

    // TODO 会员模块

    AjaxResult register(JSONObject jsonObject);

    AjaxResult wxRegister(JSONObject jsonObject);

    AjaxResult wxPhone(JSONObject jsonObject);

    AjaxResult login(JSONObject jsonObject);

    AjaxResult loginBySms(JSONObject jsonObject);

    AjaxResult userAudit(JSONObject jsonObject);
    AjaxResult getCustomerStatus(JSONObject jsonObject);

    AjaxResult updatePassword(JSONObject jsonObject);

    AjaxResult modifyPassword(JSONObject jsonObject);

    AjaxResult updateCustomer(JSONObject jsonObject);

    AjaxResult createCustomerSign(JSONObject jsonObject);

    AjaxResult updateContractFlag(JSONObject jsonObject);

    AjaxResult getCustomer(JSONObject jsonObject);
    AjaxResult getCustomerInfo(JSONObject jsonObject);
    AjaxResult customerAuth(JSONObject jsonObject);
    JSONObject getCustomerService(JSONObject jsonObject);
    AjaxResult getSpecsCnt(JSONObject jsonObject);
    JSONObject addCustomer(JSONObject jsonObject);
    JSONObject getCustomerShare(JSONObject jsonObject);

    AjaxResult getFans(JSONObject jsonObject);

    AjaxResult getTwoFans(JSONObject jsonObject);

    AjaxResult openPromoter(JSONObject jsonObject);

    // TODO 商品模块

    AjaxResult getHotGoodsList(JSONObject jsonObject);

    AjaxResult getGoodTypeList(JSONObject jsonObject);

    AjaxResult getGoodTypeList2(JSONObject jsonObject);

    AjaxResult getGoodInfoListByHomePage(JSONObject jsonObject);

    AjaxResult getShowGoodInfoList(JSONObject jsonObject);

    AjaxResult getGoodInfoList(JSONObject jsonObject);

    AjaxResult getGoodInfoListByName(JSONObject jsonObject);

    AjaxResult getGoodInfo(JSONObject jsonObject);
    AjaxResult getGoodOrder(JSONObject jsonObject);

    AjaxResult insertCoupon(JSONObject jsonObject);

    AjaxResult getSysCouponList();

    AjaxResult getCouponList(JSONObject jsonObject);

    AjaxResult getCouponCnt(JSONObject jsonObject);

    // TODO 订单模块

    AjaxResult addAddress(JSONObject jsonObject);

    AjaxResult updateAddress(JSONObject jsonObject);

    AjaxResult removeAddress(JSONObject jsonObject);

    AjaxResult getAddressList(JSONObject jsonObject);

    AjaxResult getAddressInfo(JSONObject jsonObject);

    AjaxResult getOrderList(JSONObject jsonObject);

    AjaxResult getOrderInfo(JSONObject jsonObject);

    AjaxResult addOrder(JSONObject jsonObject);
    AjaxResult addOrderPayPal(JSONObject jsonObject);

    AjaxResult payOrder(JSONObject jsonObject);

    AjaxResult payOrder2(JSONObject jsonObject);

    AjaxResult getGroupList(JSONObject jsonObject);

    AjaxResult getSuccessGroupList(JSONObject jsonObject);

    AjaxResult updateOrder(JSONObject jsonObject);

    AjaxResult updateOrderStatus(JSONObject jsonObject);

    AjaxResult cancelOrder(JSONObject jsonObject) throws Exception;

    AjaxResult removeOrder(JSONObject jsonObject);

    AjaxResult insertEvaluate(JSONObject jsonObject);

    AjaxResult getEvaluateList(JSONObject jsonObject);

    AjaxResult getOrderCar(JSONObject jsonObject);

    AjaxResult addOrderCar(JSONObject jsonObject);

    AjaxResult updateOrderCar(JSONObject jsonObject);

    AjaxResult deleteOrderCar(JSONObject jsonObject);

    AjaxResult removeOrderCar(JSONObject jsonObject);

    AjaxResult getOrderExpressList(JSONObject jsonObject);

    AjaxResult getOrderExpress(JSONObject jsonObject);

    AjaxResult insertCollectGood(JSONObject jsonObject);

    AjaxResult deleteCollectGood(JSONObject jsonObject);

    AjaxResult getCollectGoodList(JSONObject jsonObject);

    AjaxResult getExchangeGoodList(JSONObject jsonObject);

    AjaxResult getExchangeLogList(JSONObject jsonObject);

    AjaxResult rechargeMoney(JSONObject jsonObject);

    AjaxResult getRechargeLogList(JSONObject jsonObject);

    AjaxResult getFootprintList(JSONObject jsonObject);

    AjaxResult getTurntableGoodsList(JSONObject jsonObject);

    AjaxResult getTurntableRule(JSONObject jsonObject);

    AjaxResult getTurntableLogList(JSONObject jsonObject);

    AjaxResult getWinGoodsInfo(JSONObject jsonObject);

    AjaxResult getCutList(JSONObject jsonObject);

    AjaxResult getSuccessCutList(JSONObject jsonObject);

    AjaxResult getPartakeCutList(JSONObject jsonObject);

    AjaxResult inviteFriendsCut(JSONObject jsonObject);

    AjaxResult insertFriendsCut(JSONObject jsonObject);

    AjaxResult getRepairOrderList(JSONObject jsonObject);

    AjaxResult addRepairOrder(JSONObject jsonObject);

    AjaxResult updateRepairOrder(JSONObject jsonObject);

    AjaxResult deleteRepairOrder(JSONObject jsonObject);

    AjaxResult deleteFriendsCut(JSONObject jsonObject);

    AjaxResult withdrawCustomerMoney(JSONObject jsonObject);

    AjaxResult getWithdrawLog(JSONObject jsonObject);



    AjaxResult getDictItem();

    // TODO 系统模块

    AjaxResult getBannerList(JSONObject jsonObject);

    AjaxResult getBannerInfo(JSONObject jsonObject);

    AjaxResult getNoticeList(JSONObject jsonObject);

    AjaxResult getNotice(JSONObject jsonObject);

    AjaxResult getBond();

    AjaxResult getConceal();

    AjaxResult getAgreement(JSONObject jsonObject);

    AjaxResult getWe();

    AjaxResult getService();

    AjaxResult insertIdea(JSONObject jsonObject);

    AjaxResult getCutRule();

    AjaxResult getInviteRule();

    AjaxResult getBuyNotice();

    AjaxResult getFreight(JSONObject jsonObject);

    AjaxResult getFreightByProvince(JSONObject jsonObject);

    AjaxResult getVersion();

    AjaxResult getGoodsSpecs(JSONObject jsonObject);

    AjaxResult cancelOrderSubscribe(JSONObject jsonObject);

    // TODO 回调模块

    String wxOrderNotifyUrl(HttpServletRequest request, HttpServletResponse response)
            throws Exception;

    String wxRechargeNotifyUrl(HttpServletRequest request, HttpServletResponse response)
            throws Exception;

    String wxRechargeNotifyUrl2(HttpServletRequest request, HttpServletResponse response)
            throws Exception;

    String aliOrderNotifyUrl(HttpServletRequest request);

    String aliRechargeNotifyUrl(HttpServletRequest request);

    void ryLogistics();

    void ryMature();

    AjaxResult getMessage(JSONObject jsonObject);
}
