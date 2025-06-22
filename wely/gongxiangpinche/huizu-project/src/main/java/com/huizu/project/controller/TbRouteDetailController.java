package com.huizu.project.controller;

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
import com.huizu.project.domain.TbRouteDetail;
import com.huizu.project.service.ITbRouteDetailService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 行程资金明细;Controller
 *
 * @author huizu
 * @date 2024-08-12
 */
@RestController
@RequestMapping("/project")
public class TbRouteDetailController extends BaseController
{
    @Autowired
    private ITbRouteDetailService tbRouteDetailService;

    /**
     * 查询行程资金明细;列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbRouteDetail:list')")
    @GetMapping("/tbRouteDetail/list")
    public TableDataInfo list(TbRouteDetail tbRouteDetail)
    {
        startPage();
        List<TbRouteDetail> list = tbRouteDetailService.selectTbRouteDetailList(tbRouteDetail);
        return getDataTable(list);
    }
    /**
     * 查询行程资金明细;列表(不分页)
     */
    @GetMapping("/tbRouteDetail/noPage/list")
    public AjaxResult noPageList(TbRouteDetail tbRouteDetail)
    {
        List<TbRouteDetail> list = tbRouteDetailService.selectTbRouteDetailList(tbRouteDetail);
        return AjaxResult.success(list);
    }
    /**
     * 导出行程资金明细;列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbRouteDetail:export')")
    @Log(title = "行程资金明细;", businessType = BusinessType.EXPORT)
    @PostMapping("/tbRouteDetail/export")
    public void export(HttpServletResponse response, TbRouteDetail tbRouteDetail)
    {
        List<TbRouteDetail> list = tbRouteDetailService.selectTbRouteDetailList(tbRouteDetail);
        ExcelUtil<TbRouteDetail> util = new ExcelUtil<TbRouteDetail>(TbRouteDetail.class);
        util.exportExcel(response, list, "行程资金明细;数据");
    }

    /**
     * 获取行程资金明细;详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:tbRouteDetail:query')")
    @GetMapping(value = "/tbRouteDetail/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tbRouteDetailService.selectTbRouteDetailById(id));
    }

    /**
     * 新增行程资金明细;
     */
    @PreAuthorize("@ss.hasPermi('project:tbRouteDetail:add')")
    @Log(title = "行程资金明细;", businessType = BusinessType.INSERT)
    @PostMapping("/tbRouteDetail")
    public AjaxResult add(@RequestBody TbRouteDetail tbRouteDetail)
    {
        return toAjax(tbRouteDetailService.insertTbRouteDetail(tbRouteDetail));
    }

    /**
     * 修改行程资金明细;
     */
    @PreAuthorize("@ss.hasPermi('project:tbRouteDetail:edit')")
    @Log(title = "行程资金明细;", businessType = BusinessType.UPDATE)
    @PutMapping("/tbRouteDetail")
    public AjaxResult edit(@RequestBody TbRouteDetail tbRouteDetail)
    {
        return toAjax(tbRouteDetailService.updateTbRouteDetail(tbRouteDetail));
    }

    /**
     * 删除行程资金明细;
     */
    @PreAuthorize("@ss.hasPermi('project:tbRouteDetail:remove')")
    @Log(title = "行程资金明细;", businessType = BusinessType.DELETE)
	@DeleteMapping("/tbRouteDetail/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tbRouteDetailService.deleteTbRouteDetailByIds(ids));
    }


    // TODO **********************************api接口********************************************************************

    // TODO 列表********************************************************************************

    /**
     * 查询行程资金明细;列表
     */
    @PostMapping("/getTbRouteDetailList")
    public AjaxResult getTbRouteDetailList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return tbRouteDetailService.getTbRouteDetailList(jsonObject);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询行程资金明细;详情
     */
    @PostMapping("/getTbRouteDetail")
    public AjaxResult getTbRouteDetail(@RequestBody JSONObject jsonObject)
    {
        return tbRouteDetailService.getTbRouteDetail(jsonObject);
    }

    // TODO 新增*****************************************************************************

    /**
     * 新增行程资金明细;
     */
    @PostMapping("/addTbRouteDetail")
    public AjaxResult addTbRouteDetail(@RequestBody JSONObject jsonObject)
    {
        return tbRouteDetailService.addTbRouteDetail(jsonObject);
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改行程资金明细;
     */
    @PostMapping("/editTbRouteDetail")
    public AjaxResult editTbRouteDetail(@RequestBody JSONObject jsonObject)
    {
        return tbRouteDetailService.editTbRouteDetail(jsonObject);
    }

    /**
     * 批量修改行程资金明细;
     */
    @PostMapping("/batchEditTbRouteDetail")
    public AjaxResult batchEditTbRouteDetail(@RequestBody JSONObject jsonObject)
    {
        return tbRouteDetailService.batchEditTbRouteDetail(jsonObject);
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除行程资金明细;
     */
    @PostMapping("/deleteTbRouteDetail")
    public AjaxResult removeTbRouteDetail(@RequestBody JSONObject jsonObject)
    {
        return tbRouteDetailService.removeTbRouteDetail(jsonObject);
    }

    /**
     * 批量删除行程资金明细;
     */
    @PostMapping("/deleteTbRouteDetails")
    public AjaxResult removeTbRouteDetails(@RequestBody JSONObject jsonObject)
    {
        return tbRouteDetailService.removeTbRouteDetails(jsonObject);
    }
}
