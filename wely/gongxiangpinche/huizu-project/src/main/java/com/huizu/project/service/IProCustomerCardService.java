package com.huizu.project.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.project.domain.ProCustomerCard;

/**
 * 信用卡管理Service接口
 *
 * @author huizu
 * @date 2024-09-20
 */
public interface IProCustomerCardService
{
    /**
     * 查询信用卡管理
     *
     * @param id 信用卡管理主键
     * @return 信用卡管理
     */
    ProCustomerCard selectProCustomerCardById(Integer id);

    /**
     * 查询信用卡管理列表
     *
     * @param proCustomerCard 信用卡管理
     * @return 信用卡管理集合
     */
    List<ProCustomerCard> selectProCustomerCardList(ProCustomerCard proCustomerCard);

    /**
     * 新增信用卡管理
     *
     * @param proCustomerCard 信用卡管理
     * @return 结果
     */
    int insertProCustomerCard(ProCustomerCard proCustomerCard);

    /**
     * 修改信用卡管理
     *
     * @param proCustomerCard 信用卡管理
     * @return 结果
     */
    int updateProCustomerCard(ProCustomerCard proCustomerCard);

    /**
     * 批量删除信用卡管理
     *
     * @param ids 需要删除的信用卡管理主键集合
     * @return 结果
     */
    int deleteProCustomerCardByIds(Integer[] ids);

    /**
     * 删除信用卡管理信息
     *
     * @param id 信用卡管理主键
     * @return 结果
     */
    int deleteProCustomerCardById(Integer id);


    // TODO api接口******************************************************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询信用卡管理列表
     *
     * @return 信用卡管理集合
     */
    AjaxResult getProCustomerCardList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询信用卡管理
     *
     * @return 信用卡管理
     */
    AjaxResult getProCustomerCard(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增信用卡管理
     *
     * @return 结果
     */
    AjaxResult addProCustomerCard(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改信用卡管理
     *
     * @return 结果
     */
    AjaxResult editProCustomerCard(JSONObject jsonObject);

    /**
     * 批量修改信用卡管理
     *
     * @return 结果
     */
    AjaxResult batchEditProCustomerCard(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 删除信用卡管理信息
     *
     * @return 结果
     */
    AjaxResult removeProCustomerCard(JSONObject jsonObject);

    /**
     * 批量删除信用卡管理
     *
     * @return 结果
     */
    AjaxResult removeProCustomerCards(JSONObject jsonObject);

}
