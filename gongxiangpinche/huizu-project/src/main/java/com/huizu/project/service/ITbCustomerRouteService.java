package com.huizu.project.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.project.domain.TbCustomerRoute;

/**
 * 行程管理;Service接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface ITbCustomerRouteService
{
    /**
     * 查询行程管理;
     *
     * @param id 行程管理;主键
     * @return 行程管理;
     */
    TbCustomerRoute selectTbCustomerRouteById(Long id);

    /**
     * 查询行程管理;列表
     *
     * @param tbCustomerRoute 行程管理;
     * @return 行程管理;集合
     */
    List<TbCustomerRoute> selectTbCustomerRouteList(TbCustomerRoute tbCustomerRoute);
    List<TbCustomerRoute> selectTbCustomerRouteList1(TbCustomerRoute tbCustomerRoute);

    /**
     * 新增行程管理;
     *
     * @param tbCustomerRoute 行程管理;
     * @return 结果
     */
    int insertTbCustomerRoute(TbCustomerRoute tbCustomerRoute);

    /**
     * 修改行程管理;
     *
     * @param tbCustomerRoute 行程管理;
     * @return 结果
     */
    int updateTbCustomerRoute(TbCustomerRoute tbCustomerRoute);

    /**
     * 批量删除行程管理;
     *
     * @param ids 需要删除的行程管理;主键集合
     * @return 结果
     */
    int deleteTbCustomerRouteByIds(Long[] ids);

    /**
     * 删除行程管理;信息
     *
     * @param id 行程管理;主键
     * @return 结果
     */
    int deleteTbCustomerRouteById(Long id);


    // TODO api接口******************************************************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询行程管理;列表
     *
     * @return 行程管理;集合
     */
    List<JSONObject> getTbCustomerRouteListS(JSONObject jsonObject);
    AjaxResult getTbCustomerRouteListU(JSONObject jsonObject);
    AjaxResult getTbCustomerRouteListNow(JSONObject jsonObject);
    AjaxResult getTbCustomerRouteListOld(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询行程管理;
     *
     * @return 行程管理;
     */
    AjaxResult getTbCustomerRouteS(JSONObject jsonObject);
    AjaxResult getTbCustomerRouteU(JSONObject jsonObject);
    AjaxResult getTbCustomerRoute(JSONObject jsonObject);
    AjaxResult getLastRoute(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增行程管理;
     *
     * @return 结果
     */
    AjaxResult addTbCustomerRoute(JSONObject jsonObject);
    AjaxResult calculatePrice(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改行程管理;
     *
     * @return 结果
     */
    AjaxResult editTbCustomerRoute(JSONObject jsonObject);

    /**
     * 批量修改行程管理;
     *
     * @return 结果
     */
    AjaxResult batchEditTbCustomerRoute(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 删除行程管理;信息
     *
     * @return 结果
     */
    AjaxResult removeTbCustomerRoute(JSONObject jsonObject);

    /**
     * 批量删除行程管理;
     *
     * @return 结果
     */
    AjaxResult removeTbCustomerRoutes(JSONObject jsonObject);

}
