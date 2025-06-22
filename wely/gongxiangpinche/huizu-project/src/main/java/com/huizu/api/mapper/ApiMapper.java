package com.huizu.api.mapper;

import com.alibaba.fastjson2.JSONObject;
import com.huizu.api.domain.JoggleExpress;

import java.util.List;

public interface ApiMapper {

    // TODO 会员模块

    JSONObject getCustomerInfo(JSONObject jsonObject);

    JSONObject getCustomerInfoById(Long customerId);

    JSONObject getCustomerInfoByPhone(String phone);

    JSONObject getCustomerInfoByPhone2(JSONObject jsonObject);

    JSONObject getCustomerInfoByOpenId(String openId);
    JSONObject getCustomerService(Long customerId);
    int getSpecsCnt(Long customerId);
    JSONObject getCustomerShare(Long customerId);

    int insertCustomer(JSONObject jsonObject);

    int updateCustomer(JSONObject jsonObject);
    JSONObject getCustomerById(Long customerId);

    int updateCustomerPassword(JSONObject jsonObject);

    int updateCustomerPasswordById(JSONObject jsonObject);

    // TODO 商品模块

    List<JSONObject> getHotGoodsList(JSONObject jsonObject);

    List<JSONObject> getGoodTypeList(JSONObject jsonObject);

    List<JSONObject> getGoodTypeList2(JSONObject jsonObject);

    List<JSONObject> getGoodInfoList(JSONObject jsonObject);

    JSONObject getGoodInfo(JSONObject jsonObject);

    JSONObject getGoodOrder(JSONObject jsonObject);

    String getGoodImageById(JSONObject jsonObject);

    List<String> getGoodImagesById(JSONObject jsonObject);

    List<JSONObject> getGoodSpecsByGoodsId(Long goodsId);

    JSONObject getGoodSpecsById(Long id);

    JSONObject getServiceInfo(Long id);

    // TODO 订单模块

    int updateAddressDefaultFlag(Long customerId);

    int insertAddress(JSONObject jsonObject);

    int updateAddress(JSONObject jsonObject);

    int removeAddress(JSONObject jsonObject);

    List<JSONObject> getAddressList(JSONObject jsonObject);

    JSONObject getAddressInfo(Long id);

    List<JSONObject> getOrderList(JSONObject jsonObject);

    JSONObject getOrderInfo(String orderCode);

    JSONObject getOrderInfoById(Long id);

    List<JSONObject> getOrderDetails(JSONObject jsonObject);

    int insertOrder(JSONObject jsonObject);

    int insertOrderDetail(JSONObject jsonObject);

    int updateOrder(JSONObject jsonObject);

    int updateOrderStatus(JSONObject jsonObject);

    int updateOrderStatus2(JSONObject jsonObject);

    int updateOrderStatus3(JSONObject jsonObject);

    int deleteOrder(String orderCode);

    int deleteOrderDetail(String orderCode);

    int updateOrderCode(JSONObject jsonObject);

    int updateOrderEndTime(JSONObject jsonObject);

    int updateOrderDetailCode(JSONObject jsonObject);

    int insertEvaluate(JSONObject jsonObject);

    List<JSONObject> getEvaluateList(List<String> list);

    // TODO 系统模块

    List<JSONObject> getBannerList(JSONObject jsonObject);

    JSONObject getBannerInfo(JSONObject jsonObject);

    List<JSONObject> getNoticeList(JSONObject jsonObject);

    JSONObject getNotice(Long noticeId);

    int updatePricePool(JSONObject jsonObject);

    // TODO 工具模块

    JSONObject getShareInfo();

    Long getUpId(Long id);

    Long getCustomerIdByCode(String code);

    int updateCustomerMoney(JSONObject jsonObject);

    int insertShareLog(JSONObject jsonObject);

    List<JSONObject> getFansList(Long customerId);

    List<JSONObject> getTwoFansList(Long customerId);

    JSONObject getVersion();

    List<JSONObject> getShareList(JSONObject jsonObject);

    int insertOrderCar(JSONObject jsonObject);

    int updateOrderCar(JSONObject jsonObject);

    int deleteOrderCar(Long id);

    int removeOrderCar(Long id);

    int removeOrderCarByIds(List<Long> ids);

    List<JSONObject> getOrderCarListById(Long customerId);

    List<JoggleExpress> getExpressList(JSONObject jsonObject);

    JoggleExpress getExpressById(Long id);

    JSONObject getBond();

    JSONObject getConceal();

    JSONObject getAgreement(JSONObject jsonObject);

    JSONObject getWe();

    JSONObject getService();

    int insertIdea(JSONObject jsonObject);

    JSONObject getCutRule();

    JSONObject getInviteRule();

    JSONObject getBuyNotice();

    List<JSONObject> getFreight(Long goodsId);

    int getCollectGoodCnt(JSONObject jsonObject);

    int insertCollectGood(JSONObject jsonObject);

    int deleteCollectGood(JSONObject jsonObject);

    List<JSONObject> getCollectGoodList(JSONObject jsonObject);

    List<JSONObject> getExchangeGoodList(JSONObject jsonObject);

    List<JSONObject> getExchangeLogList(JSONObject jsonObject);

    List<JSONObject> getRechargeLogList(JSONObject jsonObject);

    List<JSONObject> getFootprintList(JSONObject jsonObject);

    List<JSONObject> getTurntableGoodsList(JSONObject jsonObject);

    JSONObject getTurntableRule(JSONObject jsonObject);

    List<JSONObject> getTurntableLogList(JSONObject jsonObject);

    int insertWinGoodsInfo(JSONObject jsonObject);

    int updateOrderIntegral(JSONObject jsonObject);

    int insertRechargeLog(JSONObject jsonObject);

    int updateRechargeStatus(JSONObject jsonObject);

    JSONObject getRechargeInfo(String orderCode);

    Integer getFootprintCnt(JSONObject jsonObject);

    int insertFootprint(JSONObject jsonObject);

    int updateFootprint(JSONObject jsonObject);

    int addGroup(JSONObject jsonObject);

    List<JSONObject> getGroupList(JSONObject jsonObject);

    List<JSONObject> getSuccessGroupList(JSONObject jsonObject);

    Integer getGoodsGruopCnt(Long id);

    Integer getGroupCnt(String groupCode);

    int updateOrderGroup(JSONObject jsonObject);

    int updateGroupStatus(JSONObject jsonObject);

    int updateOrderGroupStatus(JSONObject jsonObject);

    int getCutCnt(JSONObject jsonObject);

    int getCutCnt2(JSONObject jsonObject);

    int insertFriendsCut(JSONObject jsonObject);

    int getPartakeCnt(JSONObject jsonObject);

    List<JSONObject> getCutList(JSONObject jsonObject);

    List<JSONObject> getSuccessCutList(JSONObject jsonObject);

    List<JSONObject> getPartakeCutList(JSONObject jsonObject);

    List<JSONObject> getSysCouponList();

    JSONObject getSysCouponInfo(JSONObject jsonObject);

    List<JSONObject> getCouponList(JSONObject jsonObject);

    int getCouponCnt(JSONObject jsonObject);

    int deleteFriendsCut(JSONObject jsonObject);

    int updateCutStatus(JSONObject jsonObject);

    int insertCoupon(JSONObject jsonObject);

    int updateCouponUseStatus(JSONObject jsonObject);

    List<String> getOrderCodesByGoodsId(Long goodsId);

    Long getCustomerByGroupCode(String groupCode);

    Integer getProductStock(Long productId);

    Integer getProductSpecsStock(Long id);

    int updateGoodsCnt(JSONObject jsonObject);

    int updateCustomerIntegral(JSONObject jsonObject);

    List<Long> getGoodsTypeIdById(Long id);

    int updateOrderReason(JSONObject jsonObject);

    int removeOrder(String orderCode);

    int insertCustomerSign(JSONObject jsonObject);

    int updateCustomerSignStatus(JSONObject jsonObject);

    int updateCustomerSignFlag(JSONObject jsonObject);

    int updateCustomerContractFlag(JSONObject jsonObject);

    JSONObject getCustomerSignInfo(String orderCode);

    int insertCustomerPromoter(JSONObject jsonObject);

    int updateCustomerMoneyPromoterFlag(JSONObject jsonObject);

    int insertWithdraw(JSONObject jsonObject);

    List<JSONObject> getWithdrawLog(JSONObject jsonObject);

    List<JSONObject> getDictByType(String dictType);

    JSONObject getFreightByProvince(String province);

    Integer getCustomerShareCnt(JSONObject jsonObject);

    String getSharePrice();

    List<JSONObject> getOrderCodeList();

    List<JSONObject> getOrderCodeList2();

    List<JSONObject> getRepairOrderList(JSONObject jsonObject);

    JSONObject getRepairOrderInfo(Long id);

    int addRepairOrder(JSONObject jsonObject);

    int updateRepairOrder(JSONObject jsonObject);

    int deleteRepairOrder(Long id);

    JSONObject getOrderInfoByWx(String orderCode);

    List<JSONObject> getMessage(String customerId);

    JSONObject getFreightById(Long freightId);
}
