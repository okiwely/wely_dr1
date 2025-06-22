package com.huizu.project.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.project.domain.ProOrderInfo;

/**
 * 订单信息Service接口
 *
 * @author huizu
 * @date 2024-08-26
 */
public interface IProOrderInfoService
{
    /**
     * 查询订单信息
     *
     * @param id 订单信息主键
     * @return 订单信息
     */
    ProOrderInfo selectProOrderInfoById(Integer id);

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

    /**
     * 批量删除订单信息
     *
     * @param ids 需要删除的订单信息主键集合
     * @return 结果
     */
    int deleteProOrderInfoByIds(Integer[] ids);

    /**
     * 删除订单信息信息
     *
     * @param id 订单信息主键
     * @return 结果
     */
    int deleteProOrderInfoById(Integer id);


    // TODO api接口******************************************************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询订单信息列表
     *
     * @return 订单信息集合
     */
    AjaxResult getProOrderInfoList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询订单信息
     *
     * @return 订单信息
     */
    AjaxResult getProOrderInfo(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增订单信息
     *
     * @return 结果
     */
    AjaxResult addProOrderInfo(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改订单信息
     *
     * @return 结果
     */
    AjaxResult editProOrderInfo(JSONObject jsonObject);
    AjaxResult payOrder(JSONObject jsonObject);

    /**
     * 批量修改订单信息
     *
     * @return 结果
     */
    AjaxResult batchEditProOrderInfo(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 删除订单信息信息
     *
     * @return 结果
     */
    AjaxResult removeProOrderInfo(JSONObject jsonObject);

    /**
     * 批量删除订单信息
     *
     * @return 结果
     */
    AjaxResult removeProOrderInfos(JSONObject jsonObject);

}
