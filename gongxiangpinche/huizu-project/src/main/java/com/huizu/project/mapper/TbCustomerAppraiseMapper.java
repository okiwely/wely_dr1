package com.huizu.project.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.project.domain.TbCustomerAppraise;

/**
 * 评价;Mapper接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface TbCustomerAppraiseMapper
{
    /**
     * 查询评价;
     *
     * @param id 评价;主键
     * @return 评价;
     */
    TbCustomerAppraise selectTbCustomerAppraiseById(Long id);
    double selectScopeBySubId(Long id);

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
     * 删除评价;
     *
     * @param id 评价;主键
     * @return 结果
     */
    int deleteTbCustomerAppraiseById(Long id);

    /**
     * 批量删除评价;
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteTbCustomerAppraiseByIds(Long[] ids);


    /*
{
    "id": "",
    "customerId": "",
    "subId": "",
    "level": "",
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
     * 查询评价;列表
     *
     * @return 评价;集合
     */
    List<JSONObject> getTbCustomerAppraiseList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询评价;
     *
     * @return 评价;
     */
    JSONObject getTbCustomerAppraise(JSONObject jsonObject);

    List<JSONObject> getTbCustomerAppraiseD(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增评价;
     *
     * @return 结果
     */
    int addTbCustomerAppraise(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改评价;
     *
     * @return 结果
     */
    int editTbCustomerAppraise(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 批量删除评价;
     *
     * @return 结果
     */
    int removeTbCustomerAppraises(JSONObject jsonObject);

    /**
     * 删除评价;
     *
     * @return 结果
     */
    int removeTbCustomerAppraise(JSONObject jsonObject);

    // TODO 其他*****************************************************************************

    /**
     * 批量删除
     *
     * @return 结果
     */
    int batchRemoveTbCustomerAppraise(JSONObject jsonObject);
}
