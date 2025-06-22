package com.huizu.project.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.project.domain.TbCustomerCar;

/**
 * 汽车管理Mapper接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface TbCustomerCarMapper
{
    /**
     * 查询汽车管理
     *
     * @param id 汽车管理主键
     * @return 汽车管理
     */
    TbCustomerCar selectTbCustomerCarById(Long id);
    TbCustomerCar selectTbCustomerCarByCustomerId(Long id);

    /**
     * 查询汽车管理列表
     *
     * @param tbCustomerCar 汽车管理
     * @return 汽车管理集合
     */
    List<TbCustomerCar> selectTbCustomerCarList(TbCustomerCar tbCustomerCar);

    /**
     * 新增汽车管理
     *
     * @param tbCustomerCar 汽车管理
     * @return 结果
     */
    int insertTbCustomerCar(TbCustomerCar tbCustomerCar);

    /**
     * 修改汽车管理
     *
     * @param tbCustomerCar 汽车管理
     * @return 结果
     */
    int updateTbCustomerCar(TbCustomerCar tbCustomerCar);

    /**
     * 删除汽车管理
     *
     * @param id 汽车管理主键
     * @return 结果
     */
    int deleteTbCustomerCarById(Long id);

    /**
     * 批量删除汽车管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteTbCustomerCarByIds(Long[] ids);


    /*
{
    "id": "",
    "customerId": "",
    "info": "",
    "gasoline": "",
    "carCc": "",
    "total": "",
    "isEtc": "",
    "manufacturer": "",
    "model": "",
    "color": "",
    "decade": "",
    "grade": "",
    "isNavigation": "",
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
     * 查询汽车管理列表
     *
     * @return 汽车管理集合
     */
    List<JSONObject> getTbCustomerCarList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询汽车管理
     *
     * @return 汽车管理
     */
    JSONObject getTbCustomerCar(JSONObject jsonObject);
    JSONObject getTbCustomerCar1(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增汽车管理
     *
     * @return 结果
     */
    int addTbCustomerCar(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改汽车管理
     *
     * @return 结果
     */
    int editTbCustomerCar(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 批量删除汽车管理
     *
     * @return 结果
     */
    int removeTbCustomerCars(JSONObject jsonObject);

    /**
     * 删除汽车管理
     *
     * @return 结果
     */
    int removeTbCustomerCar(JSONObject jsonObject);

    // TODO 其他*****************************************************************************

    /**
     * 批量删除
     *
     * @return 结果
     */
    int batchRemoveTbCustomerCar(JSONObject jsonObject);
}
