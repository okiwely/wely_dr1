package com.huizu.project.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.project.domain.TbDivision;

/**
 * 行政区划Service接口
 *
 * @author huizu
 * @date 2024-08-14
 */
public interface ITbDivisionService
{
    /**
     * 查询行政区划
     *
     * @param id 行政区划主键
     * @return 行政区划
     */
    TbDivision selectTbDivisionById(Long id);

    /**
     * 查询行政区划列表
     *
     * @param tbDivision 行政区划
     * @return 行政区划集合
     */
    List<TbDivision> selectTbDivisionList(TbDivision tbDivision);

    /**
     * 新增行政区划
     *
     * @param tbDivision 行政区划
     * @return 结果
     */
    int insertTbDivision(TbDivision tbDivision);

    /**
     * 修改行政区划
     *
     * @param tbDivision 行政区划
     * @return 结果
     */
    int updateTbDivision(TbDivision tbDivision);

    /**
     * 批量删除行政区划
     *
     * @param ids 需要删除的行政区划主键集合
     * @return 结果
     */
    int deleteTbDivisionByIds(Long[] ids);

    /**
     * 删除行政区划信息
     *
     * @param id 行政区划主键
     * @return 结果
     */
    int deleteTbDivisionById(Long id);


    // TODO api接口******************************************************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询行政区划列表
     *
     * @return 行政区划集合
     */
    AjaxResult getTbDivisionList(JSONObject jsonObject);
    AjaxResult getCityList(JSONObject jsonObject);
    AjaxResult getAreaList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询行政区划
     *
     * @return 行政区划
     */
    AjaxResult getTbDivision(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增行政区划
     *
     * @return 结果
     */
    AjaxResult addTbDivision(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改行政区划
     *
     * @return 结果
     */
    AjaxResult editTbDivision(JSONObject jsonObject);

    /**
     * 批量修改行政区划
     *
     * @return 结果
     */
    AjaxResult batchEditTbDivision(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 删除行政区划信息
     *
     * @return 结果
     */
    AjaxResult removeTbDivision(JSONObject jsonObject);

    /**
     * 批量删除行政区划
     *
     * @return 结果
     */
    AjaxResult removeTbDivisions(JSONObject jsonObject);

}
