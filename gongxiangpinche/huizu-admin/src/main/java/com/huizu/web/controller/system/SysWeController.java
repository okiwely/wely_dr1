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
import com.huizu.system.domain.SysWe;
import com.huizu.system.service.ISysWeService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 关于我们Controller
 *
 * @author huizu
 * @date 2024-07-27
 */
@RestController
@RequestMapping("/system")
public class SysWeController extends BaseController
{
    @Autowired
    private ISysWeService sysWeService;

    /**
     * 查询关于我们列表
     */
    @PreAuthorize("@ss.hasPermi('system:sysWe:list')")
    @GetMapping("/sysWe/list")
    public TableDataInfo list(SysWe sysWe)
    {
        startPage();
        List<SysWe> list = sysWeService.selectSysWeList(sysWe);
        return getDataTable(list);
    }
    /**
     * 查询关于我们列表(不分页)
     */
    @GetMapping("/sysWe/noPage/list")
    public AjaxResult noPageList(SysWe sysWe)
    {
        List<SysWe> list = sysWeService.selectSysWeList(sysWe);
        return AjaxResult.success(list);
    }
    /**
     * 导出关于我们列表
     */
    @PreAuthorize("@ss.hasPermi('system:sysWe:export')")
    @Log(title = "关于我们", businessType = BusinessType.EXPORT)
    @PostMapping("/sysWe/export")
    public void export(HttpServletResponse response, SysWe sysWe)
    {
        List<SysWe> list = sysWeService.selectSysWeList(sysWe);
        ExcelUtil<SysWe> util = new ExcelUtil<SysWe>(SysWe.class);
        util.exportExcel(response, list, "关于我们数据");
    }

    /**
     * 获取关于我们详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sysWe:query')")
    @GetMapping(value = "/sysWe/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysWeService.selectSysWeById(id));
    }

    /**
     * 新增关于我们
     */
    @PreAuthorize("@ss.hasPermi('system:sysWe:add')")
    @Log(title = "关于我们", businessType = BusinessType.INSERT)
    @PostMapping("/sysWe")
    public AjaxResult add(@RequestBody SysWe sysWe)
    {
        return toAjax(sysWeService.insertSysWe(sysWe));
    }

    /**
     * 修改关于我们
     */
    @PreAuthorize("@ss.hasPermi('system:sysWe:edit')")
    @Log(title = "关于我们", businessType = BusinessType.UPDATE)
    @PutMapping("/sysWe")
    public AjaxResult edit(@RequestBody SysWe sysWe)
    {
        return toAjax(sysWeService.updateSysWe(sysWe));
    }

    /**
     * 删除关于我们
     */
    @PreAuthorize("@ss.hasPermi('system:sysWe:remove')")
    @Log(title = "关于我们", businessType = BusinessType.DELETE)
	@DeleteMapping("/sysWe/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysWeService.deleteSysWeByIds(ids));
    }


    // TODO api接口*****************************************************************************

    /**
     * 查询关于我们列表
     */
    @PostMapping("/getSysWeList")
    public AjaxResult getSysWeList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return sysWeService.getSysWeList(jsonObject);
    }

    /**
     * 查询关于我们详情
     */
    @PostMapping("/getSysWe")
    public AjaxResult getSysWe(@RequestBody JSONObject jsonObject)
    {
        return sysWeService.getSysWe(jsonObject);
    }

    /**
     * 新增关于我们
     */
    @PostMapping("/addSysWe")
    public AjaxResult addSysWe(@RequestBody JSONObject jsonObject)
    {
        return sysWeService.addSysWe(jsonObject);
    }

    /**
     * 修改关于我们
     */
    @PostMapping("/editSysWe")
    public AjaxResult editSysWe(@RequestBody JSONObject jsonObject)
    {
        return sysWeService.editSysWe(jsonObject);
    }

    /**
     * 批量删除关于我们
     */
    @PostMapping("/deleteSysWes")
    public AjaxResult deleteSysWes(@RequestBody JSONObject jsonObject)
    {
        return sysWeService.deleteSysWes(jsonObject);
    }

    /**
     * 删除关于我们
     */
    @PostMapping("/deleteSysWe")
    public AjaxResult deleteSysWe(@RequestBody JSONObject jsonObject)
    {
        return sysWeService.deleteSysWe(jsonObject);
    }


}
