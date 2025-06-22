package com.huizu.system.service;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.system.domain.SysService;

/**
 * 客服信息Service接口
 *
 * @author huizu
 * @date 2024-07-31
 */
public interface ISysServiceService
{
    /**
     * 查询客服信息
     *
     * @param id 客服信息主键
     * @return 客服信息
     */
    SysService selectSysServiceById(Long id);

    /**
     * 查询客服信息列表
     *
     * @param sysService 客服信息
     * @return 客服信息集合
     */
    List<SysService> selectSysServiceList(SysService sysService);

    /**
     * 新增客服信息
     *
     * @param sysService 客服信息
     * @return 结果
     */
    int insertSysService(SysService sysService);

    /**
     * 修改客服信息
     *
     * @param sysService 客服信息
     * @return 结果
     */
    int updateSysService(SysService sysService);

    /**
     * 批量删除客服信息
     *
     * @param ids 需要删除的客服信息主键集合
     * @return 结果
     */
    int deleteSysServiceByIds(Long[] ids);

    /**
     * 删除客服信息信息
     *
     * @param id 客服信息主键
     * @return 结果
     */
    int deleteSysServiceById(Long id);


    // TODO api接口*****************************************************************************

    /**
     * 查询客服信息列表
     *
     * @return 客服信息集合
     */
    AjaxResult getSysServiceList(JSONObject jsonObject);

    /**
     * 查询客服信息
     *
     * @return 客服信息
     */
    AjaxResult getSysService(JSONObject jsonObject);

    /**
     * 新增客服信息
     *
     * @return 结果
     */
    AjaxResult addSysService(JSONObject jsonObject);

    /**
     * 修改客服信息
     *
     * @return 结果
     */
    AjaxResult editSysService(JSONObject jsonObject);

    /**
     * 批量删除客服信息
     *
     * @return 结果
     */
    AjaxResult deleteSysServices(JSONObject jsonObject);

    /**
     * 删除客服信息信息
     *
     * @return 结果
     */
    AjaxResult deleteSysService(JSONObject jsonObject);

}
