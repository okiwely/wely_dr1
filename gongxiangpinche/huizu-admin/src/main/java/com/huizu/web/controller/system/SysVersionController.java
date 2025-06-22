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
import com.huizu.system.domain.SysVersion;
import com.huizu.system.service.ISysVersionService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 存储app版本相关信息Controller
 *
 * @author huizu
 * @date 2024-07-24
 */
@RestController
@RequestMapping("/system")
public class SysVersionController extends BaseController
{
    @Autowired
    private ISysVersionService sysVersionService;

    /**
     * 查询存储app版本相关信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:version:list')")
    @GetMapping("/version/list")
    public TableDataInfo list(SysVersion sysVersion)
    {
        startPage();
        List<SysVersion> list = sysVersionService.selectSysVersionList(sysVersion);
        return getDataTable(list);
    }
    /**
     * 查询存储app版本相关信息列表(不分页)
     */
    @GetMapping("/version/noPage/list")
    public AjaxResult noPageList(SysVersion sysVersion)
    {
        List<SysVersion> list = sysVersionService.selectSysVersionList(sysVersion);
        return AjaxResult.success(list);
    }
    /**
     * 导出存储app版本相关信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:version:export')")
    @Log(title = "存储app版本相关信息", businessType = BusinessType.EXPORT)
    @PostMapping("/version/export")
    public void export(HttpServletResponse response, SysVersion sysVersion)
    {
        List<SysVersion> list = sysVersionService.selectSysVersionList(sysVersion);
        ExcelUtil<SysVersion> util = new ExcelUtil<SysVersion>(SysVersion.class);
        util.exportExcel(response, list, "存储app版本相关信息数据");
    }

    /**
     * 获取存储app版本相关信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:version:query')")
    @GetMapping(value = "/version/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysVersionService.selectSysVersionById(id));
    }

    /**
     * 新增存储app版本相关信息
     */
    @PreAuthorize("@ss.hasPermi('system:version:add')")
    @Log(title = "存储app版本相关信息", businessType = BusinessType.INSERT)
    @PostMapping("/version")
    public AjaxResult add(@RequestBody SysVersion sysVersion)
    {
        return toAjax(sysVersionService.insertSysVersion(sysVersion));
    }

    /**
     * 修改存储app版本相关信息
     */
    @PreAuthorize("@ss.hasPermi('system:version:edit')")
    @Log(title = "存储app版本相关信息", businessType = BusinessType.UPDATE)
    @PutMapping("/version")
    public AjaxResult edit(@RequestBody SysVersion sysVersion)
    {
        return toAjax(sysVersionService.updateSysVersion(sysVersion));
    }

    /**
     * 删除存储app版本相关信息
     */
    @PreAuthorize("@ss.hasPermi('system:version:remove')")
    @Log(title = "存储app版本相关信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/version/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysVersionService.deleteSysVersionByIds(ids));
    }


    // TODO api接口*****************************************************************************

    /**
     * 查询存储app版本相关信息列表
     */
    @PostMapping("/getSysVersionList")
    public AjaxResult getSysVersionList(@RequestBody JSONObject jsonObject)
    {
        return sysVersionService.getSysVersionList(jsonObject);
    }

    /**
     * 查询存储app版本相关信息详情
     */
    @PostMapping("/getSysVersion")
    public AjaxResult getSysVersion(@RequestBody JSONObject jsonObject)
    {
        return sysVersionService.getSysVersion(jsonObject);
    }

    /**
     * 新增存储app版本相关信息
     */
    @PostMapping("/addSysVersion")
    public AjaxResult addSysVersion(@RequestBody JSONObject jsonObject)
    {
        return sysVersionService.addSysVersion(jsonObject);
    }

    /**
     * 修改存储app版本相关信息
     */
    @PostMapping("/editSysVersion")
    public AjaxResult editSysVersion(@RequestBody JSONObject jsonObject)
    {
        return sysVersionService.editSysVersion(jsonObject);
    }

    /**
     * 批量删除存储app版本相关信息
     */
    @PostMapping("/deleteSysVersions")
    public AjaxResult deleteSysVersions(@RequestBody JSONObject jsonObject)
    {
        return sysVersionService.deleteSysVersions(jsonObject);
    }

    /**
     * 删除存储app版本相关信息
     */
    @PostMapping("/deleteSysVersion")
    public AjaxResult deleteSysVersion(@RequestBody JSONObject jsonObject)
    {
        return sysVersionService.deleteSysVersion(jsonObject);
    }


}
