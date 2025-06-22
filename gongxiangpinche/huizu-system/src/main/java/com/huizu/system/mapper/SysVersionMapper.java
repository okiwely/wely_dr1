package com.huizu.system.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.system.domain.SysVersion;

/**
 * 存储app版本相关信息Mapper接口
 *
 * @author huizu
 * @date 2024-07-24
 */
public interface SysVersionMapper
{
    /**
     * 查询存储app版本相关信息
     *
     * @param id 存储app版本相关信息主键
     * @return 存储app版本相关信息
     */
    SysVersion selectSysVersionById(Long id);

    /**
     * 查询存储app版本相关信息列表
     *
     * @param sysVersion 存储app版本相关信息
     * @return 存储app版本相关信息集合
     */
    List<SysVersion> selectSysVersionList(SysVersion sysVersion);

    /**
     * 新增存储app版本相关信息
     *
     * @param sysVersion 存储app版本相关信息
     * @return 结果
     */
    int insertSysVersion(SysVersion sysVersion);

    /**
     * 修改存储app版本相关信息
     *
     * @param sysVersion 存储app版本相关信息
     * @return 结果
     */
    int updateSysVersion(SysVersion sysVersion);

    /**
     * 删除存储app版本相关信息
     *
     * @param id 存储app版本相关信息主键
     * @return 结果
     */
    int deleteSysVersionById(Long id);

    /**
     * 批量删除存储app版本相关信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteSysVersionByIds(Long[] ids);



    // TODO api接口*****************************************************************************

    /**
     * 查询存储app版本相关信息列表
     *
     * @return 存储app版本相关信息集合
     */
    List<JSONObject> getSysVersionList(JSONObject jsonObject);

    /**
     * 查询存储app版本相关信息
     *
     * @return 存储app版本相关信息
     */
    JSONObject getSysVersion(JSONObject jsonObject);

    /**
     * 新增存储app版本相关信息
     *
     * @return 结果
     */
    int addSysVersion(JSONObject jsonObject);

    /**
     * 修改存储app版本相关信息
     *
     * @return 结果
     */
    int editSysVersion(JSONObject jsonObject);

    /**
     * 批量删除存储app版本相关信息
     *
     * @return 结果
     */
    int deleteSysVersions(JSONObject jsonObject);

    /**
     * 删除存储app版本相关信息
     *
     * @return 结果
     */
    int deleteSysVersion(JSONObject jsonObject);
}
