package com.huizu.system.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.system.domain.SysWe;

/**
 * 关于我们Service接口
 *
 * @author huizu
 * @date 2024-07-27
 */
public interface ISysWeService
{
    /**
     * 查询关于我们
     *
     * @param id 关于我们主键
     * @return 关于我们
     */
    SysWe selectSysWeById(Long id);

    /**
     * 查询关于我们列表
     *
     * @param sysWe 关于我们
     * @return 关于我们集合
     */
    List<SysWe> selectSysWeList(SysWe sysWe);

    /**
     * 新增关于我们
     *
     * @param sysWe 关于我们
     * @return 结果
     */
    int insertSysWe(SysWe sysWe);

    /**
     * 修改关于我们
     *
     * @param sysWe 关于我们
     * @return 结果
     */
    int updateSysWe(SysWe sysWe);

    /**
     * 批量删除关于我们
     *
     * @param ids 需要删除的关于我们主键集合
     * @return 结果
     */
    int deleteSysWeByIds(Long[] ids);

    /**
     * 删除关于我们信息
     *
     * @param id 关于我们主键
     * @return 结果
     */
    int deleteSysWeById(Long id);


    // TODO api接口*****************************************************************************

    /**
     * 查询关于我们列表
     *
     * @return 关于我们集合
     */
    AjaxResult getSysWeList(JSONObject jsonObject);

    /**
     * 查询关于我们
     *
     * @return 关于我们
     */
    AjaxResult getSysWe(JSONObject jsonObject);

    /**
     * 新增关于我们
     *
     * @return 结果
     */
    AjaxResult addSysWe(JSONObject jsonObject);

    /**
     * 修改关于我们
     *
     * @return 结果
     */
    AjaxResult editSysWe(JSONObject jsonObject);

    /**
     * 批量删除关于我们
     *
     * @return 结果
     */
    AjaxResult deleteSysWes(JSONObject jsonObject);

    /**
     * 删除关于我们信息
     *
     * @return 结果
     */
    AjaxResult deleteSysWe(JSONObject jsonObject);

}
