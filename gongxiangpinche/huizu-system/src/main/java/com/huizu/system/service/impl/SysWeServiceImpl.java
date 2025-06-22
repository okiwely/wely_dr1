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
import com.huizu.system.mapper.SysWeMapper;
import com.huizu.system.domain.SysWe;
import com.huizu.system.service.ISysWeService;

/**
 * 关于我们Service业务层处理
 *
 * @author huizu
 * @date 2024-07-27
 */
@Service
public class SysWeServiceImpl implements ISysWeService
{
    @Autowired
    private SysWeMapper sysWeMapper;

    /**
     * 查询关于我们
     *
     * @param id 关于我们主键
     * @return 关于我们
     */
    @Override
    public SysWe selectSysWeById(Long id)
    {
        return sysWeMapper.selectSysWeById(id);
    }

    /**
     * 查询关于我们列表
     *
     * @param sysWe 关于我们
     * @return 关于我们
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<SysWe> selectSysWeList(SysWe sysWe)
    {
        return sysWeMapper.selectSysWeList(sysWe);
    }

    /**
     * 新增关于我们
     *
     * @param sysWe 关于我们
     * @return 结果
     */
    @Override
    public int insertSysWe(SysWe sysWe)
    {

        //设置启用状态
        sysWe.setStatus("1");
        //设置创建人
        sysWe.setCreateBy(SecurityUtils.getUsername());
        //设置创建时间
        sysWe.setCreateTime(DateUtils.getNowDate());
        //设置删除标记
        sysWe.setDelFlag("0");
        return sysWeMapper.insertSysWe(sysWe);
    }

    /**
     * 修改关于我们
     *
     * @param sysWe 关于我们
     * @return 结果
     */
    @Override
    public int updateSysWe(SysWe sysWe)
    {
        //设置修改人
        sysWe.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        sysWe.setUpdateTime(DateUtils.getNowDate());
        return sysWeMapper.updateSysWe(sysWe);
    }

    /**
     * 批量删除关于我们
     *
     * @param ids 需要删除的关于我们主键
     * @return 结果
     */
    @Override
    public int deleteSysWeByIds(Long[] ids)
    {
        return sysWeMapper.deleteSysWeByIds(ids);
    }

    /**
     * 删除关于我们信息
     *
     * @param id 关于我们主键
     * @return 结果
     */
    @Override
    public int deleteSysWeById(Long id)
    {
        return sysWeMapper.deleteSysWeById(id);
    }


    // TODO api接口*****************************************************************************


    /**
     * 查询关于我们列表
     *
     * @return 关于我们
     */
    @Override
    @VerifyParam("id")
    public AjaxResult getSysWeList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = sysWeMapper.getSysWeList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }
    /**
     * 查询关于我们
     *
     * @return 关于我们
     */
    @Override
    @VerifyParam("id")
    @ResponseParam("id,image,name,address,content,status,createBy,createTime,updateBy,updateTime,remark,delFlag")
    public AjaxResult getSysWe(JSONObject jsonObject)
    {
        JSONObject object = sysWeMapper.getSysWe(jsonObject);
        return AjaxResult.success(object);
    }


    /**
     * 新增关于我们
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,image,name,address,content,status,createBy,createTime,updateBy,updateTime,remark,delFlag")
    public AjaxResult addSysWe(JSONObject jsonObject)
    {
        //设置创建人
        jsonObject.put("status","1");
        //设置创建人
        jsonObject.put("createBy",SecurityUtils.getUsername());
        //设置创建时间
        jsonObject.put("createTime",DateUtils.getNowDate());
        //设置创建人
        jsonObject.put("delFlag","0");
        int i = sysWeMapper.addSysWe(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 修改关于我们
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,image,name,address,content,status,createBy,createTime,updateBy,updateTime,remark,delFlag")
    public AjaxResult editSysWe(JSONObject jsonObject)
    {
        //设置修改人
        jsonObject.put("updateBy",SecurityUtils.getUsername());
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        int i = sysWeMapper.editSysWe(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除关于我们
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult deleteSysWes(JSONObject jsonObject)
    {
        int i = sysWeMapper.deleteSysWes(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 删除关于我们信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult deleteSysWe(JSONObject jsonObject)
    {
        int i = sysWeMapper.deleteSysWe(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }
}
