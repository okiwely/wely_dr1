package com.huizu.web.controller.system;

import com.alibaba.fastjson2.JSONObject;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.huizu.common.annotation.Log;
import com.huizu.common.core.controller.BaseController;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.common.enums.BusinessType;
import com.huizu.system.domain.SysService;
import com.huizu.system.service.ISysServiceService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 客服信息Controller
 *
 * @author huizu
 * @date 2024-07-31
 */
@RestController
@RequestMapping("/system")
public class SysServiceController extends BaseController
{
    @Autowired
    private ISysServiceService sysServiceService;

    /**
     * 查询客服信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:sysService:list')")
    @GetMapping("/sysService/list")
    public TableDataInfo list(SysService sysService)
    {
        startPage();
        List<SysService> list = sysServiceService.selectSysServiceList(sysService);
        return getDataTable(list);
    }
    /**
     * 查询客服信息列表(不分页)
     */
    @GetMapping("/sysService/noPage/list")
    public AjaxResult noPageList(SysService sysService)
    {
        List<SysService> list = sysServiceService.selectSysServiceList(sysService);
        return AjaxResult.success(list);
    }
    /**
     * 导出客服信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:sysService:export')")
    @Log(title = "客服信息", businessType = BusinessType.EXPORT)
    @PostMapping("/sysService/export")
    public void export(HttpServletResponse response, SysService sysService)
    {
        List<SysService> list = sysServiceService.selectSysServiceList(sysService);
        ExcelUtil<SysService> util = new ExcelUtil<SysService>(SysService.class);
        util.exportExcel(response, list, "客服信息数据");
    }

    /**
     * 获取客服信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sysService:query')")
    @GetMapping(value = "/sysService/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysServiceService.selectSysServiceById(id));
    }

    /**
     * 新增客服信息
     */
    @PreAuthorize("@ss.hasPermi('system:sysService:add')")
    @Log(title = "客服信息", businessType = BusinessType.INSERT)
    @PostMapping("/sysService")
    public AjaxResult add(@RequestBody SysService sysService)
    {
        return toAjax(sysServiceService.insertSysService(sysService));
    }

    /**
     * 修改客服信息
     */
    @PreAuthorize("@ss.hasPermi('system:sysService:edit')")
    @Log(title = "客服信息", businessType = BusinessType.UPDATE)
    @PutMapping("/sysService")
    public AjaxResult edit(@RequestBody SysService sysService)
    {
        return toAjax(sysServiceService.updateSysService(sysService));
    }

    /**
     * 删除客服信息
     */
    @PreAuthorize("@ss.hasPermi('system:sysService:remove')")
    @Log(title = "客服信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/sysService/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysServiceService.deleteSysServiceByIds(ids));
    }


    // TODO api接口*****************************************************************************

    /**
     * 查询客服信息列表
     */
    @PostMapping("/getSysServiceList")
    public AjaxResult getSysServiceList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return sysServiceService.getSysServiceList(jsonObject);
    }

    /**
     * 查询客服信息详情
     */
    @PostMapping("/getSysService")
    public AjaxResult getSysService(@RequestBody JSONObject jsonObject)
    {
        return sysServiceService.getSysService(jsonObject);
    }

    /**
     * 新增客服信息
     */
    @PostMapping("/addSysService")
    public AjaxResult addSysService(@RequestBody JSONObject jsonObject)
    {
        return sysServiceService.addSysService(jsonObject);
    }

    /**
     * 修改客服信息
     */
    @PostMapping("/editSysService")
    public AjaxResult editSysService(@RequestBody JSONObject jsonObject)
    {
        return sysServiceService.editSysService(jsonObject);
    }

    /**
     * 批量删除客服信息
     */
    @PostMapping("/deleteSysServices")
    public AjaxResult deleteSysServices(@RequestBody JSONObject jsonObject)
    {
        return sysServiceService.deleteSysServices(jsonObject);
    }

    /**
     * 删除客服信息
     */
    @PostMapping("/deleteSysService")
    public AjaxResult deleteSysService(@RequestBody JSONObject jsonObject)
    {
        return sysServiceService.deleteSysService(jsonObject);
    }


}
