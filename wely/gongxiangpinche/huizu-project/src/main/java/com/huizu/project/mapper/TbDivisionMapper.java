package com.huizu.project.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.project.domain.TbDivision;

/**
 * 行政区划Mapper接口
 *
 * @author huizu
 * @date 2024-08-14
 */
public interface TbDivisionMapper
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
     * 删除行政区划
     *
     * @param id 行政区划主键
     * @return 结果
     */
    int deleteTbDivisionById(Long id);

    /**
     * 批量删除行政区划
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteTbDivisionByIds(Long[] ids);


    /*
{
    "id": "",
    "code": "",
    "city": "",
    "area": "",
    "isMain": ""
}
     */


    // TODO *************************************api接口*****************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询行政区划列表
     *
     * @return 行政区划集合
     */
    List<JSONObject> getTbDivisionList(JSONObject jsonObject);
    List<JSONObject> getCityList(JSONObject jsonObject);
    List<JSONObject> getAreaList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询行政区划
     *
     * @return 行政区划
     */
    JSONObject getTbDivision(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增行政区划
     *
     * @return 结果
     */
    int addTbDivision(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改行政区划
     *
     * @return 结果
     */
    int editTbDivision(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 批量删除行政区划
     *
     * @return 结果
     */
    int removeTbDivisions(JSONObject jsonObject);

    /**
     * 删除行政区划
     *
     * @return 结果
     */
    int removeTbDivision(JSONObject jsonObject);

    // TODO 其他*****************************************************************************

    /**
     * 批量删除
     *
     * @return 结果
     */
    int batchRemoveTbDivision(JSONObject jsonObject);
}
