package com.huizu.project.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.project.domain.TbCustomerChat;

/**
 * 聊天信息Service接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface ITbCustomerChatService
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
     * 批量删除聊天信息
     *
     * @param ids 需要删除的聊天信息主键集合
     * @return 结果
     */
    int deleteTbCustomerChatByIds(Long[] ids);

    /**
     * 删除聊天信息信息
     *
     * @param id 聊天信息主键
     * @return 结果
     */
    int deleteTbCustomerChatById(Long id);


    // TODO api接口******************************************************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询聊天信息列表
     *
     * @return 聊天信息集合
     */
    AjaxResult getTbCustomerChatList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询聊天信息
     *
     * @return 聊天信息
     */
    AjaxResult getTbCustomerChat(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增聊天信息
     *
     * @return 结果
     */
    AjaxResult addTbCustomerChat(JSONObject jsonObject);
    AjaxResult consentRoute(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改聊天信息
     *
     * @return 结果
     */
    AjaxResult editTbCustomerChat(JSONObject jsonObject);

    /**
     * 批量修改聊天信息
     *
     * @return 结果
     */
    AjaxResult batchEditTbCustomerChat(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 删除聊天信息信息
     *
     * @return 结果
     */
    AjaxResult removeTbCustomerChat(JSONObject jsonObject);

    /**
     * 批量删除聊天信息
     *
     * @return 结果
     */
    AjaxResult removeTbCustomerChats(JSONObject jsonObject);

}
