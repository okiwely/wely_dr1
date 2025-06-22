package com.huizu.project.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.project.domain.TbCustomerAppraise;

/**
 * 评价;Service接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface ITbCustomerAppraiseService
{
    /**
     * 查询评价;
     *
     * @param id 评价;主键
     * @return 评价;
     */
    TbCustomerAppraise selectTbCustomerAppraiseById(Long id);

    /**
     * 查询评价;列表
     *
     * @param tbCustomerAppraise 评价;
     * @return 评价;集合
     */
    List<TbCustomerAppraise> selectTbCustomerAppraiseList(TbCustomerAppraise tbCustomerAppraise);

    /**
     * 新增评价;
     *
     * @param tbCustomerAppraise 评价;
     * @return 结果
     */
    int insertTbCustomerAppraise(TbCustomerAppraise tbCustomerAppraise);

    /**
     * 修改评价;
     *
     * @param tbCustomerAppraise 评价;
     * @return 结果
     */
    int updateTbCustomerAppraise(TbCustomerAppraise tbCustomerAppraise);

    /**
     * 批量删除评价;
     *
     * @param ids 需要删除的评价;主键集合
     * @return 结果
     */
    int deleteTbCustomerAppraiseByIds(Long[] ids);

    /**
     * 删除评价;信息
     *
     * @param id 评价;主键
     * @return 结果
     */
    int deleteTbCustomerAppraiseById(Long id);


    // TODO api接口******************************************************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询评价;列表
     *
     * @return 评价;集合
     */
    AjaxResult getTbCustomerAppraiseList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询评价;
     *
     * @return 评价;
     */
    AjaxResult getTbCustomerAppraise(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增评价;
     *
     * @return 结果
     */
    AjaxResult addTbCustomerAppraise(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改评价;
     *
     * @return 结果
     */
    AjaxResult editTbCustomerAppraise(JSONObject jsonObject);

    /**
     * 批量修改评价;
     *
     * @return 结果
     */
    AjaxResult batchEditTbCustomerAppraise(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 删除评价;信息
     *
     * @return 结果
     */
    AjaxResult removeTbCustomerAppraise(JSONObject jsonObject);

    /**
     * 批量删除评价;
     *
     * @return 结果
     */
    AjaxResult removeTbCustomerAppraises(JSONObject jsonObject);

}
