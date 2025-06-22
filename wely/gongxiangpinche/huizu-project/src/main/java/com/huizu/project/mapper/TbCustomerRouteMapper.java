package com.huizu.project.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.project.domain.TbCustomerRoute;

/**
 * 行程管理;Mapper接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface TbCustomerRouteMapper
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
    int updateTbCustomerRouteSub(TbCustomerRoute tbCustomerRoute);

    /**
     * 删除行程管理;
     *
     * @param id 行程管理;主键
     * @return 结果
     */
    int deleteTbCustomerRouteById(Long id);

    /**
     * 批量删除行程管理;
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteTbCustomerRouteByIds(Long[] ids);


    /*
{
    "id": "",
    "customerId": "",
    "type": "",
    "describe": "",
    "startTime": "",
    "endTime": "",
    "startAddress": "",
    "endAddress": "",
    "startLonLat": "",
    "endLonLat": "",
    "model": "",
    "number": "",
    "price": "",
    "total": "",
    "already
Total": "",
    "attention": "",
    "comment": "",
    "viewTotal": "",
    "state": "",
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
     * 查询行程管理;列表
     *
     * @return 行程管理;集合
     */
    List<JSONObject> getTbCustomerRouteList(JSONObject jsonObject);
    List<JSONObject> getTbCustomerRouteListNow(JSONObject jsonObject);
    List<JSONObject> getTbCustomerRouteListOld(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询行程管理;
     *
     * @return 行程管理;
     */
    JSONObject getTbCustomerRoute(JSONObject jsonObject);
    JSONObject getLastRoute(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增行程管理;
     *
     * @return 结果
     */
    int addTbCustomerRoute(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改行程管理;
     *
     * @return 结果
     */
    int editTbCustomerRoute(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 批量删除行程管理;
     *
     * @return 结果
     */
    int removeTbCustomerRoutes(JSONObject jsonObject);

    /**
     * 删除行程管理;
     *
     * @return 结果
     */
    int removeTbCustomerRoute(JSONObject jsonObject);

    // TODO 其他*****************************************************************************

    /**
     * 批量删除
     *
     * @return 结果
     */
    int batchRemoveTbCustomerRoute(JSONObject jsonObject);
}
