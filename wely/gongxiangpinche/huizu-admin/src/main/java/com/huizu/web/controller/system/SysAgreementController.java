package com.huizu.web.controller.system;

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
import com.huizu.system.domain.SysAgreement;
import com.huizu.system.service.ISysAgreementService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 协议管理Controller
 *
 * @author huizu
 * @date 2024-07-09
 */
@RestController
@RequestMapping("/system/agreement")
public class SysAgreementController extends BaseController
{
    @Autowired
    private ISysAgreementService sysAgreementService;

    /**
     * 查询协议管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:agreement:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysAgreement sysAgreement)
    {
        startPage();
        List<SysAgreement> list = sysAgreementService.selectSysAgreementList(sysAgreement);
        return getDataTable(list);
    }

    /**
     * 导出协议管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:agreement:export')")
    @Log(title = "协议管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysAgreement sysAgreement)
    {
        List<SysAgreement> list = sysAgreementService.selectSysAgreementList(sysAgreement);
        ExcelUtil<SysAgreement> util = new ExcelUtil<SysAgreement>(SysAgreement.class);
        util.exportExcel(response, list, "协议管理数据");
    }

    /**
     * 获取协议管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:agreement:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return success(sysAgreementService.selectSysAgreementById(id));
    }

    /**
     * 新增协议管理
     */
    @PreAuthorize("@ss.hasPermi('system:agreement:add')")
    @Log(title = "协议管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysAgreement sysAgreement)
    {
        return toAjax(sysAgreementService.insertSysAgreement(sysAgreement));
    }

    /**
     * 修改协议管理
     */
    @PreAuthorize("@ss.hasPermi('system:agreement:edit')")
    @Log(title = "协议管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysAgreement sysAgreement)
    {
        return toAjax(sysAgreementService.updateSysAgreement(sysAgreement));
    }

    /**
     * 删除协议管理
     */
    @PreAuthorize("@ss.hasPermi('system:agreement:remove')")
    @Log(title = "协议管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(sysAgreementService.deleteSysAgreementByIds(ids));
    }
}
