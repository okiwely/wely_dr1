package com.huizu.project.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.project.domain.ProOrderInfo;

/**
 * 订单信息Mapper接口
 *
 * @author huizu
 * @date 2024-08-26
 */
public interface ProOrderInfoMapper
{
    /**
     * 查询订单信息
     *
     * @param id 订单信息主键
     * @return 订单信息
     */
    ProOrderInfo selectProOrderInfoById(Integer id);
    ProOrderInfo selectProOrderInfoByCode(String code);

    /**
     * 查询订单信息列表
     *
     * @param proOrderInfo 订单信息
     * @return 订单信息集合
     */
    List<ProOrderInfo> selectProOrderInfoList(ProOrderInfo proOrderInfo);

    /**
     * 新增订单信息
     *
     * @param proOrderInfo 订单信息
     * @return 结果
     */
    int insertProOrderInfo(ProOrderInfo proOrderInfo);

    /**
     * 修改订单信息
     *
     * @param proOrderInfo 订单信息
     * @return 结果
     */
    int updateProOrderInfo(ProOrderInfo proOrderInfo);
    int updateProOrderInfoByCode(ProOrderInfo proOrderInfo);

    /**
     * 删除订单信息
     *
     * @param id 订单信息主键
     * @return 结果
     */
    int deleteProOrderInfoById(Integer id);

    /**
     * 批量删除订单信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteProOrderInfoByIds(Integer[] ids);


    /*
{
    "id": "",
    "customerId": "",
    "driverId": "",
    "routeId": "",
    "orderType": "",
    "orderCode": "",
    "totalNum": "",
    "totalPrice": "",
    "discountPrice": "",
    "actualPrice": "",
    "bondPrice": "",
    "couponId": "",
    "integral": "",
    "freight": "",
    "packageId": "",
    "sendTime": "",
    "sendCnt": "",
    "people": "",
    "phone": "",
    "address": "",
    "payType": "",
    "payTime": "",
    "pushPeople": "",
    "orderStatus": "",
    "takeType": "",
    "storehouse": "",
    "startAddress": "",
    "endAddress": "",
    "startTime": "",
    "endTime": "",
    "createTime": "",
    "delFlag": ""
}
     */


    // TODO *************************************api接口*****************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询订单信息列表
     *
     * @return 订单信息集合
     */
    List<JSONObject> getProOrderInfoList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询订单信息
     *
     * @return 订单信息
     */
    JSONObject getProOrderInfo(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增订单信息
     *
     * @return 结果
     */
    int addProOrderInfo(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改订单信息
     *
     * @return 结果
     */
    int editProOrderInfo(JSONObject jsonObject);
    int editOrderPriceByRouteId(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 批量删除订单信息
     *
     * @return 结果
     */
    int removeProOrderInfos(JSONObject jsonObject);

    /**
     * 删除订单信息
     *
     * @return 结果
     */
    int removeProOrderInfo(JSONObject jsonObject);

    // TODO 其他*****************************************************************************

    /**
     * 批量删除
     *
     * @return 结果
     */
    int batchRemoveProOrderInfo(JSONObject jsonObject);
}
