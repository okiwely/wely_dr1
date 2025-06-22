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
import com.huizu.system.domain.SysIdea;
import com.huizu.system.service.ISysIdeaService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 意见反馈Controller
 *
 * @author huizu
 * @date 2024-07-10
 */
@RestController
@RequestMapping("/system/idea")
public class SysIdeaController extends BaseController
{
    @Autowired
    private ISysIdeaService sysIdeaService;

    /**
     * 查询意见反馈列表
     */
    @PreAuthorize("@ss.hasPermi('system:idea:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysIdea sysIdea)
    {
        startPage();
        List<SysIdea> list = sysIdeaService.selectSysIdeaList(sysIdea);
        return getDataTable(list);
    }
    /**
     * 查询意见反馈列表(不分页)
     */
    @GetMapping("/noPage/list")
    public TableDataInfo noPageList(SysIdea sysIdea)
    {
        List<SysIdea> list = sysIdeaService.selectSysIdeaList(sysIdea);
        return getDataTable(list);
    }
    /**
     * 导出意见反馈列表
     */
    @PreAuthorize("@ss.hasPermi('system:idea:export')")
    @Log(title = "意见反馈", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysIdea sysIdea)
    {
        List<SysIdea> list = sysIdeaService.selectSysIdeaList(sysIdea);
        ExcelUtil<SysIdea> util = new ExcelUtil<SysIdea>(SysIdea.class);
        util.exportExcel(response, list, "意见反馈数据");
    }

    /**
     * 获取意见反馈详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:idea:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return success(sysIdeaService.selectSysIdeaById(id));
    }

    /**
     * 新增意见反馈
     */
    @PreAuthorize("@ss.hasPermi('system:idea:add')")
    @Log(title = "意见反馈", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysIdea sysIdea)
    {
        return toAjax(sysIdeaService.insertSysIdea(sysIdea));
    }

    /**
     * 修改意见反馈
     */
    @PreAuthorize("@ss.hasPermi('system:idea:edit')")
    @Log(title = "意见反馈", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysIdea sysIdea)
    {
        return toAjax(sysIdeaService.updateSysIdea(sysIdea));
    }

    /**
     * 删除意见反馈
     */
    @PreAuthorize("@ss.hasPermi('system:idea:remove')")
    @Log(title = "意见反馈", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(sysIdeaService.deleteSysIdeaByIds(ids));
    }
}
