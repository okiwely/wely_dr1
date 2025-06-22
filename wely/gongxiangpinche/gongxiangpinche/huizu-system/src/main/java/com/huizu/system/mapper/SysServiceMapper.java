package com.huizu.system.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.system.domain.SysService;

/**
 * 客服信息Mapper接口
 *
 * @author huizu
 * @date 2024-07-31
 */
public interface SysServiceMapper
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
     * 删除客服信息
     *
     * @param id 客服信息主键
     * @return 结果
     */
    int deleteSysServiceById(Long id);

    /**
     * 批量删除客服信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteSysServiceByIds(Long[] ids);



    // TODO api接口*****************************************************************************

    /**
     * 查询客服信息列表
     *
     * @return 客服信息集合
     */
    List<JSONObject> getSysServiceList(JSONObject jsonObject);

    /**
     * 查询客服信息
     *
     * @return 客服信息
     */
    JSONObject getSysService(JSONObject jsonObject);

    /**
     * 新增客服信息
     *
     * @return 结果
     */
    int addSysService(JSONObject jsonObject);

    /**
     * 修改客服信息
     *
     * @return 结果
     */
    int editSysService(JSONObject jsonObject);

    /**
     * 批量删除客服信息
     *
     * @return 结果
     */
    int deleteSysServices(JSONObject jsonObject);

    /**
     * 删除客服信息
     *
     * @return 结果
     */
    int deleteSysService(JSONObject jsonObject);
}
