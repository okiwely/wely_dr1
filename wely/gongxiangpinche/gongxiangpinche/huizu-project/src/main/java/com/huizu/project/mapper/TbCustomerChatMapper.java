package com.huizu.project.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.project.domain.TbCustomerChat;

/**
 * 聊天信息Mapper接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface TbCustomerChatMapper
{
    /**
     * 查询聊天信息
     *
     * @param id 聊天信息主键
     * @return 聊天信息
     */
    TbCustomerChat selectTbCustomerChatById(Long id);

    /**
     * 查询聊天信息列表
     *
     * @param tbCustomerChat 聊天信息
     * @return 聊天信息集合
     */
    List<TbCustomerChat> selectTbCustomerChatList(TbCustomerChat tbCustomerChat);

    /**
     * 新增聊天信息
     *
     * @param tbCustomerChat 聊天信息
     * @return 结果
     */
    int insertTbCustomerChat(TbCustomerChat tbCustomerChat);

    /**
     * 修改聊天信息
     *
     * @param tbCustomerChat 聊天信息
     * @return 结果
     */
    int updateTbCustomerChat(TbCustomerChat tbCustomerChat);

    /**
     * 删除聊天信息
     *
     * @param id 聊天信息主键
     * @return 结果
     */
    int deleteTbCustomerChatById(Long id);

    /**
     * 批量删除聊天信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteTbCustomerChatByIds(Long[] ids);


    /*
{
    "id": "",
    "customerId": "",
    "subId": "",
    "content": "",
    "status": "",
    "createBy": "",
    "createTime": "",
    "updateBy": "",
    "updateTime": "",
    "remark": "",
    "delFlag": "",
    "standby1": "",
    "standby2": "",
    "standby3": ""
}
     */


    // TODO *************************************api接口*****************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询聊天信息列表
     *
     * @return 聊天信息集合
     */
    List<JSONObject> getTbCustomerChatList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询聊天信息
     *
     * @return 聊天信息
     */
    JSONObject getTbCustomerChat(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增聊天信息
     *
     * @return 结果
     */
    int addTbCustomerChat(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改聊天信息
     *
     * @return 结果
     */
    int editTbCustomerChat(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 批量删除聊天信息
     *
     * @return 结果
     */
    int removeTbCustomerChats(JSONObject jsonObject);

    /**
     * 删除聊天信息
     *
     * @return 结果
     */
    int removeTbCustomerChat(JSONObject jsonObject);

    // TODO 其他*****************************************************************************

    /**
     * 批量删除
     *
     * @return 结果
     */
    int batchRemoveTbCustomerChat(JSONObject jsonObject);
}
