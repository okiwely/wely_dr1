package com.huizu.project.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.project.domain.TbRouteDetail;

/**
 * 行程资金明细;Service接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface ITbRouteDetailService
{
    /**
     * 查询行程资金明细;
     *
     * @param id 行程资金明细;主键
     * @return 行程资金明细;
     */
    TbRouteDetail selectTbRouteDetailById(Long id);

    /**
     * 查询行程资金明细;列表
     *
     * @param tbRouteDetail 行程资金明细;
     * @return 行程资金明细;集合
     */
    List<TbRouteDetail> selectTbRouteDetailList(TbRouteDetail tbRouteDetail);

    /**
     * 新增行程资金明细;
     *
     * @param tbRouteDetail 行程资金明细;
     * @return 结果
     */
    int insertTbRouteDetail(TbRouteDetail tbRouteDetail);

    /**
     * 修改行程资金明细;
     *
     * @param tbRouteDetail 行程资金明细;
     * @return 结果
     */
    int updateTbRouteDetail(TbRouteDetail tbRouteDetail);

    /**
     * 批量删除行程资金明细;
     *
     * @param ids 需要删除的行程资金明细;主键集合
     * @return 结果
     */
    int deleteTbRouteDetailByIds(Long[] ids);

    /**
     * 删除行程资金明细;信息
     *
     * @param id 行程资金明细;主键
     * @return 结果
     */
    int deleteTbRouteDetailById(Long id);


    // TODO api接口******************************************************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询行程资金明细;列表
     *
     * @return 行程资金明细;集合
     */
    AjaxResult getTbRouteDetailList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询行程资金明细;
     *
     * @return 行程资金明细;
     */
    AjaxResult getTbRouteDetail(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增行程资金明细;
     *
     * @return 结果
     */
    AjaxResult addTbRouteDetail(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改行程资金明细;
     *
     * @return 结果
     */
    AjaxResult editTbRouteDetail(JSONObject jsonObject);

    /**
     * 批量修改行程资金明细;
     *
     * @return 结果
     */
    AjaxResult batchEditTbRouteDetail(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 删除行程资金明细;信息
     *
     * @return 结果
     */
    AjaxResult removeTbRouteDetail(JSONObject jsonObject);

    /**
     * 批量删除行程资金明细;
     *
     * @return 结果
     */
    AjaxResult removeTbRouteDetails(JSONObject jsonObject);

}
