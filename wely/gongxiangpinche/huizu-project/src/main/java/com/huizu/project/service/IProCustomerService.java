package com.huizu.project.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.project.domain.ProCustomer;

/**
 * 会员信息Service接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface IProCustomerService
{
    /**
     * 查询会员信息
     *
     * @param id 会员信息主键
     * @return 会员信息
     */
    ProCustomer selectProCustomerById(Long id);

    /**
     * 查询会员信息列表
     *
     * @param proCustomer 会员信息
     * @return 会员信息集合
     */
    List<ProCustomer> selectProCustomerList(ProCustomer proCustomer);

    /**
     * 新增会员信息
     *
     * @param proCustomer 会员信息
     * @return 结果
     */
    int insertProCustomer(ProCustomer proCustomer);

    /**
     * 修改会员信息
     *
     * @param proCustomer 会员信息
     * @return 结果
     */
    int updateProCustomer(ProCustomer proCustomer);
    int customerWithdraw(ProCustomer proCustomer);
    int auditCustomer(ProCustomer proCustomer);

    /**
     * 批量删除会员信息
     *
     * @param ids 需要删除的会员信息主键集合
     * @return 结果
     */
    int deleteProCustomerByIds(Long[] ids);

    /**
     * 删除会员信息信息
     *
     * @param id 会员信息主键
     * @return 结果
     */
    int deleteProCustomerById(Long id);


    // TODO api接口******************************************************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询会员信息列表
     *
     * @return 会员信息集合
     */
    AjaxResult getProCustomerList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询会员信息
     *
     * @return 会员信息
     */
    AjaxResult getProCustomer(JSONObject jsonObject);
    AjaxResult getProCustomerInfo(JSONObject jsonObject);
    AjaxResult getCustomerIntroduce(JSONObject jsonObject);
    AjaxResult login(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增会员信息
     *
     * @return 结果
     */
    AjaxResult addProCustomer(JSONObject jsonObject);
    AjaxResult register(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改会员信息
     *
     * @return 结果
     */
    AjaxResult editProCustomer(JSONObject jsonObject);
    AjaxResult authPhone(JSONObject jsonObject);
    AjaxResult submitAudit(JSONObject jsonObject);
    AjaxResult withdraw(JSONObject jsonObject);

    /**
     * 批量修改会员信息
     *
     * @return 结果
     */
    AjaxResult batchEditProCustomer(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 删除会员信息信息
     *
     * @return 结果
     */
    AjaxResult removeProCustomer(JSONObject jsonObject);

    /**
     * 批量删除会员信息
     *
     * @return 结果
     */
    AjaxResult removeProCustomers(JSONObject jsonObject);

}
