package com.huizu.project.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.project.domain.ProCustomerCard;

/**
 * 信用卡管理Mapper接口
 *
 * @author huizu
 * @date 2024-09-20
 */
public interface ProCustomerCardMapper
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
     * 删除信用卡管理
     *
     * @param id 信用卡管理主键
     * @return 结果
     */
    int deleteProCustomerCardById(Integer id);

    /**
     * 批量删除信用卡管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteProCustomerCardByIds(Integer[] ids);


    /*
{
    "id": "",
    "customerId": "",
    "cardNo": "",
    "securityCode": "",
    "expire": "",
    "isDefault": "",
    "name": "",
    "status": "",
    "createBy": "",
    "createTime": "",
    "updateBy": "",
    "updateTime": "",
    "remark": "",
    "delFlag": "",
    "standby1": "",
    "standby2": "",
    "standby3": "",
    "standby4": "",
    "standby5": ""
}
     */


    // TODO *************************************api接口*****************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询信用卡管理列表
     *
     * @return 信用卡管理集合
     */
    List<JSONObject> getProCustomerCardList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询信用卡管理
     *
     * @return 信用卡管理
     */
    JSONObject getProCustomerCard(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增信用卡管理
     *
     * @return 结果
     */
    int addProCustomerCard(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改信用卡管理
     *
     * @return 结果
     */
    int editProCustomerCard(JSONObject jsonObject);
    int editProCustomerCardNotDefault(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 批量删除信用卡管理
     *
     * @return 结果
     */
    int removeProCustomerCards(JSONObject jsonObject);

    /**
     * 删除信用卡管理
     *
     * @return 结果
     */
    int removeProCustomerCard(JSONObject jsonObject);

    // TODO 其他*****************************************************************************

    /**
     * 批量删除
     *
     * @return 结果
     */
    int batchRemoveProCustomerCard(JSONObject jsonObject);
}
