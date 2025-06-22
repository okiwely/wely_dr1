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
import com.huizu.system.domain.SysBanner;
import com.huizu.system.service.ISysBannerService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 轮播图信息Controller
 *
 * @author huizu
 * @date 2024-07-09
 */
@RestController
@RequestMapping("/system/banner")
public class SysBannerController extends BaseController
{
    @Autowired
    private ISysBannerService sysBannerService;

    /**
     * 查询轮播图信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:banner:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysBanner sysBanner)
    {
        startPage();
        List<SysBanner> list = sysBannerService.selectSysBannerList(sysBanner);
        return getDataTable(list);
    }
    /**
     * 查询轮播图信息列表(不分页)
     */
    @GetMapping("/noPage/list")
    public TableDataInfo noPageList(SysBanner sysBanner)
    {
        List<SysBanner> list = sysBannerService.selectSysBannerList(sysBanner);
        return getDataTable(list);
    }
    /**
     * 导出轮播图信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:banner:export')")
    @Log(title = "轮播图信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysBanner sysBanner)
    {
        List<SysBanner> list = sysBannerService.selectSysBannerList(sysBanner);
        ExcelUtil<SysBanner> util = new ExcelUtil<SysBanner>(SysBanner.class);
        util.exportExcel(response, list, "轮播图信息数据");
    }

    /**
     * 获取轮播图信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:banner:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return success(sysBannerService.selectSysBannerById(id));
    }

    /**
     * 新增轮播图信息
     */
    @PreAuthorize("@ss.hasPermi('system:banner:add')")
    @Log(title = "轮播图信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysBanner sysBanner)
    {
        return toAjax(sysBannerService.insertSysBanner(sysBanner));
    }

    /**
     * 修改轮播图信息
     */
    @PreAuthorize("@ss.hasPermi('system:banner:edit')")
    @Log(title = "轮播图信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysBanner sysBanner)
    {
        return toAjax(sysBannerService.updateSysBanner(sysBanner));
    }

    /**
     * 删除轮播图信息
     */
    @PreAuthorize("@ss.hasPermi('system:banner:remove')")
    @Log(title = "轮播图信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(sysBannerService.deleteSysBannerByIds(ids));
    }
}
