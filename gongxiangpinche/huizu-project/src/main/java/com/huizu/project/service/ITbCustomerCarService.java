package com.huizu.project.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.project.domain.TbCustomerCar;

/**
 * 汽车管理Service接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface ITbCustomerCarService
{
    /**
     * 查询汽车管理
     *
     * @param id 汽车管理主键
     * @return 汽车管理
     */
    TbCustomerCar selectTbCustomerCarById(Long id);
    TbCustomerCar getCarByCustomerId(Long id);

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
     * 批量删除汽车管理
     *
     * @param ids 需要删除的汽车管理主键集合
     * @return 结果
     */
    int deleteTbCustomerCarByIds(Long[] ids);

    /**
     * 删除汽车管理信息
     *
     * @param id 汽车管理主键
     * @return 结果
     */
    int deleteTbCustomerCarById(Long id);


    // TODO api接口******************************************************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询汽车管理列表
     *
     * @return 汽车管理集合
     */
    AjaxResult getTbCustomerCarList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询汽车管理
     *
     * @return 汽车管理
     */
    AjaxResult getTbCustomerCar(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增汽车管理
     *
     * @return 结果
     */
    AjaxResult addTbCustomerCar(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改汽车管理
     *
     * @return 结果
     */
    AjaxResult editTbCustomerCar(JSONObject jsonObject);

    /**
     * 批量修改汽车管理
     *
     * @return 结果
     */
    AjaxResult batchEditTbCustomerCar(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 删除汽车管理信息
     *
     * @return 结果
     */
    AjaxResult removeTbCustomerCar(JSONObject jsonObject);

    /**
     * 批量删除汽车管理
     *
     * @return 结果
     */
    AjaxResult removeTbCustomerCars(JSONObject jsonObject);

}
