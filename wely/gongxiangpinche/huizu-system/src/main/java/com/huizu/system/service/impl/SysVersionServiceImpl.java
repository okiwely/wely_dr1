package com.huizu.system.service.impl;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.annotation.ResponseParam;
import com.huizu.common.annotation.VerifyParam;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.common.annotation.VerifyParam;
import com.huizu.common.utils.DateUtils;
import com.huizu.common.annotation.DataScope;
import com.huizu.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.system.mapper.SysVersionMapper;
import com.huizu.system.domain.SysVersion;
import com.huizu.system.service.ISysVersionService;

/**
 * 存储app版本相关信息Service业务层处理
 *
 * @author huizu
 * @date 2024-07-24
 */
@Service
public class SysVersionServiceImpl implements ISysVersionService
{
    @Autowired
    private SysVersionMapper sysVersionMapper;

    /**
     * 查询存储app版本相关信息
     *
     * @param id 存储app版本相关信息主键
     * @return 存储app版本相关信息
     */
    @Override
    public SysVersion selectSysVersionById(Long id)
    {
        return sysVersionMapper.selectSysVersionById(id);
    }

    /**
     * 查询存储app版本相关信息列表
     *
     * @param sysVersion 存储app版本相关信息
     * @return 存储app版本相关信息
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<SysVersion> selectSysVersionList(SysVersion sysVersion)
    {
        return sysVersionMapper.selectSysVersionList(sysVersion);
    }

    /**
     * 新增存储app版本相关信息
     *
     * @param sysVersion 存储app版本相关信息
     * @return 结果
     */
    @Override
    public int insertSysVersion(SysVersion sysVersion)
    {

        //设置创建人
        sysVersion.setStatus("1");
        //设置创建时间
        sysVersion.setCreateTime(DateUtils.getNowDate());
        //设置创建人
        sysVersion.setDelFlag("0");
        return sysVersionMapper.insertSysVersion(sysVersion);
    }

    /**
     * 修改存储app版本相关信息
     *
     * @param sysVersion 存储app版本相关信息
     * @return 结果
     */
    @Override
    public int updateSysVersion(SysVersion sysVersion)
    {
        //设置修改时间
        sysVersion.setUpdateTime(DateUtils.getNowDate());
        return sysVersionMapper.updateSysVersion(sysVersion);
    }

    /**
     * 批量删除存储app版本相关信息
     *
     * @param ids 需要删除的存储app版本相关信息主键
     * @return 结果
     */
    @Override
    public int deleteSysVersionByIds(Long[] ids)
    {
        return sysVersionMapper.deleteSysVersionByIds(ids);
    }

    /**
     * 删除存储app版本相关信息信息
     *
     * @param id 存储app版本相关信息主键
     * @return 结果
     */
    @Override
    public int deleteSysVersionById(Long id)
    {
        return sysVersionMapper.deleteSysVersionById(id);
    }


    // TODO api接口*****************************************************************************


    /**
     * 查询存储app版本相关信息列表
     *
     * @return 存储app版本相关信息
     */
    @Override
    @VerifyParam("id")
    public AjaxResult getSysVersionList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = sysVersionMapper.getSysVersionList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }
    /**
     * 查询存储app版本相关信息
     *
     * @return 存储app版本相关信息
     */
    @Override
    @VerifyParam("id")
    @ResponseParam("id,storeType,systemType,resUrl,versionCode,versionName,content,upFlag,description,status,createTime,updateTime,delFlag")
    public AjaxResult getSysVersion(JSONObject jsonObject)
    {
        JSONObject object = sysVersionMapper.getSysVersion(jsonObject);
        return AjaxResult.success(object);
    }


    /**
     * 新增存储app版本相关信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,storeType,systemType,resUrl,versionCode,versionName,content,upFlag,description,status,createTime,updateTime,delFlag")
    public AjaxResult addSysVersion(JSONObject jsonObject)
    {
        //设置创建人
        jsonObject.put("status","1");
        //设置创建时间
        jsonObject.put("createTime",DateUtils.getNowDate());
        //设置创建人
        jsonObject.put("delFlag","0");
        int i = sysVersionMapper.addSysVersion(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 修改存储app版本相关信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,storeType,systemType,resUrl,versionCode,versionName,content,upFlag,description,status,createTime,updateTime,delFlag")
    public AjaxResult editSysVersion(JSONObject jsonObject)
    {
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        int i = sysVersionMapper.editSysVersion(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除存储app版本相关信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult deleteSysVersions(JSONObject jsonObject)
    {
        int i = sysVersionMapper.deleteSysVersions(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 删除存储app版本相关信息信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult deleteSysVersion(JSONObject jsonObject)
    {
        int i = sysVersionMapper.deleteSysVersion(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }
}
