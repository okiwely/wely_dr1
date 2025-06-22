package com.huizu.project.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.project.domain.TbRouteDetail;

/**
 * 行程资金明细;Mapper接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface TbRouteDetailMapper
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
     * 删除行程资金明细;
     *
     * @param id 行程资金明细;主键
     * @return 结果
     */
    int deleteTbRouteDetailById(Long id);

    /**
     * 批量删除行程资金明细;
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteTbRouteDetailByIds(Long[] ids);


    /*
{
    "id": "",
    "routeId": "",
    "total": "",
    "price": "",
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
     * 查询行程资金明细;列表
     *
     * @return 行程资金明细;集合
     */
    List<JSONObject> getTbRouteDetailList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询行程资金明细;
     *
     * @return 行程资金明细;
     */
    JSONObject getTbRouteDetail(JSONObject jsonObject);
    List<JSONObject> getTbRouteDetail1(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增行程资金明细;
     *
     * @return 结果
     */
    int addTbRouteDetail(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改行程资金明细;
     *
     * @return 结果
     */
    int editTbRouteDetail(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 批量删除行程资金明细;
     *
     * @return 结果
     */
    int removeTbRouteDetails(JSONObject jsonObject);

    /**
     * 删除行程资金明细;
     *
     * @return 结果
     */
    int removeTbRouteDetail(JSONObject jsonObject);

    // TODO 其他*****************************************************************************

    /**
     * 批量删除
     *
     * @return 结果
     */
    int batchRemoveTbRouteDetail(JSONObject jsonObject);
}
