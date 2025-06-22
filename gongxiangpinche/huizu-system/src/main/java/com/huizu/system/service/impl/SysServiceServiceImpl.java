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
import com.huizu.system.mapper.SysServiceMapper;
import com.huizu.system.domain.SysService;
import com.huizu.system.service.ISysServiceService;

/**·
 * 客服信息Service业务层处理
 *
 * @author huizu
 * @date 2024-07-31
 */
@Service
public class SysServiceServiceImpl implements ISysServiceService
{
    @Autowired
    private SysServiceMapper sysServiceMapper;

    /**
     * 查询客服信息
     *
     * @param id 客服信息主键
     * @return 客服信息
     */
    @Override
    public SysService selectSysServiceById(Long id)
    {
        return sysServiceMapper.selectSysServiceById(id);
    }

    /**
     * 查询客服信息列表
     *
     * @param sysService 客服信息
     * @return 客服信息
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<SysService> selectSysServiceList(SysService sysService)
    {
        return sysServiceMapper.selectSysServiceList(sysService);
    }

    /**
     * 新增客服信息
     *
     * @param sysService 客服信息
     * @return 结果
     */
    @Override
    public int insertSysService(SysService sysService)
    {

        //设置启用状态
        sysService.setStatus("1");
        //设置创建人
        sysService.setCreateBy(SecurityUtils.getUsername());
        //设置创建时间
        sysService.setCreateTime(DateUtils.getNowDate());
        //设置删除标记
        sysService.setDelFlag("0");
        return sysServiceMapper.insertSysService(sysService);
    }

    /**
     * 修改客服信息
     *
     * @param sysService 客服信息
     * @return 结果
     */
    @Override
    public int updateSysService(SysService sysService)
    {
        //设置修改人
        sysService.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        sysService.setUpdateTime(DateUtils.getNowDate());
        return sysServiceMapper.updateSysService(sysService);
    }

    /**
     * 批量删除客服信息
     *
     * @param ids 需要删除的客服信息主键
     * @return 结果
     */
    @Override
    public int deleteSysServiceByIds(Long[] ids)
    {
        return sysServiceMapper.deleteSysServiceByIds(ids);
    }

    /**
     * 删除客服信息信息
     *
     * @param id 客服信息主键
     * @return 结果
     */
    @Override
    public int deleteSysServiceById(Long id)
    {
        return sysServiceMapper.deleteSysServiceById(id);
    }


    // TODO api接口*****************************************************************************


    /**
     * 查询客服信息列表
     *
     * @return 客服信息
     */
    @Override
    @VerifyParam("id")
    public AjaxResult getSysServiceList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = sysServiceMapper.getSysServiceList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }
    /**
     * 查询客服信息
     *
     * @return 客服信息
     */
    @Override
    @VerifyParam("id")
    @ResponseParam("id,phone,image,status,createBy,createTime,updateBy,updateTime,remark,delFlag")
    public AjaxResult getSysService(JSONObject jsonObject)
    {
        JSONObject object = sysServiceMapper.getSysService(jsonObject);
        return AjaxResult.success(object);
    }


    /**
     * 新增客服信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,phone,image,status,createBy,createTime,updateBy,updateTime,remark,delFlag")
    public AjaxResult addSysService(JSONObject jsonObject)
    {
        //设置创建人
        jsonObject.put("status","1");
        //设置创建人
        jsonObject.put("createBy",SecurityUtils.getUsername());
        //设置创建时间
        jsonObject.put("createTime",DateUtils.getNowDate());
        //设置创建人
        jsonObject.put("delFlag","0");
        int i = sysServiceMapper.addSysService(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 修改客服信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,phone,image,status,createBy,createTime,updateBy,updateTime,remark,delFlag")
    public AjaxResult editSysService(JSONObject jsonObject)
    {
        //设置修改人
        jsonObject.put("updateBy",SecurityUtils.getUsername());
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        int i = sysServiceMapper.editSysService(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除客服信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult deleteSysServices(JSONObject jsonObject)
    {
        int i = sysServiceMapper.deleteSysServices(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 删除客服信息信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult deleteSysService(JSONObject jsonObject)
    {
        int i = sysServiceMapper.deleteSysService(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }
}
