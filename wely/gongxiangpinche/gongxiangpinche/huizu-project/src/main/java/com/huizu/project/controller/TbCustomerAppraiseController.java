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
import com.huizu.project.domain.TbCustomerAppraise;
import com.huizu.project.service.ITbCustomerAppraiseService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 评价;Controller
 *
 * @author huizu
 * @date 2024-08-12
 */
@RestController
@RequestMapping("/project")
public class TbCustomerAppraiseController extends BaseController
{
    @Autowired
    private ITbCustomerAppraiseService tbCustomerAppraiseService;

    /**
     * 查询评价;列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerAppraise:list')")
    @GetMapping("/tbCustomerAppraise/list")
    public TableDataInfo list(TbCustomerAppraise tbCustomerAppraise)
    {
        startPage();
        List<TbCustomerAppraise> list = tbCustomerAppraiseService.selectTbCustomerAppraiseList(tbCustomerAppraise);
        return getDataTable(list);
    }
    /**
     * 查询评价;列表(不分页)
     */
    @GetMapping("/tbCustomerAppraise/noPage/list")
    public AjaxResult noPageList(TbCustomerAppraise tbCustomerAppraise)
    {
        List<TbCustomerAppraise> list = tbCustomerAppraiseService.selectTbCustomerAppraiseList(tbCustomerAppraise);
        return AjaxResult.success(list);
    }
    /**
     * 导出评价;列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerAppraise:export')")
    @Log(title = "评价;", businessType = BusinessType.EXPORT)
    @PostMapping("/tbCustomerAppraise/export")
    public void export(HttpServletResponse response, TbCustomerAppraise tbCustomerAppraise)
    {
        List<TbCustomerAppraise> list = tbCustomerAppraiseService.selectTbCustomerAppraiseList(tbCustomerAppraise);
        ExcelUtil<TbCustomerAppraise> util = new ExcelUtil<TbCustomerAppraise>(TbCustomerAppraise.class);
        util.exportExcel(response, list, "评价;数据");
    }

    /**
     * 获取评价;详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerAppraise:query')")
    @GetMapping(value = "/tbCustomerAppraise/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tbCustomerAppraiseService.selectTbCustomerAppraiseById(id));
    }

    /**
     * 新增评价;
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerAppraise:add')")
    @Log(title = "评价;", businessType = BusinessType.INSERT)
    @PostMapping("/tbCustomerAppraise")
    public AjaxResult add(@RequestBody TbCustomerAppraise tbCustomerAppraise)
    {
        return toAjax(tbCustomerAppraiseService.insertTbCustomerAppraise(tbCustomerAppraise));
    }

    /**
     * 修改评价;
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerAppraise:edit')")
    @Log(title = "评价;", businessType = BusinessType.UPDATE)
    @PutMapping("/tbCustomerAppraise")
    public AjaxResult edit(@RequestBody TbCustomerAppraise tbCustomerAppraise)
    {
        return toAjax(tbCustomerAppraiseService.updateTbCustomerAppraise(tbCustomerAppraise));
    }

    /**
     * 删除评价;
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerAppraise:remove')")
    @Log(title = "评价;", businessType = BusinessType.DELETE)
	@DeleteMapping("/tbCustomerAppraise/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tbCustomerAppraiseService.deleteTbCustomerAppraiseByIds(ids));
    }


    // TODO **********************************api接口********************************************************************

    // TODO 列表********************************************************************************

    /**
     * 查询评价;列表
     */
    @PostMapping("/getTbCustomerAppraiseList")
    public AjaxResult getTbCustomerAppraiseList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return tbCustomerAppraiseService.getTbCustomerAppraiseList(jsonObject);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询评价;详情
     */
    @PostMapping("/getTbCustomerAppraise")
    public AjaxResult getTbCustomerAppraise(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerAppraiseService.getTbCustomerAppraise(jsonObject);
    }

    // TODO 新增*****************************************************************************

    /**
     * 新增评价;
     */
    @PostMapping("/addTbCustomerAppraise")
    public AjaxResult addTbCustomerAppraise(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerAppraiseService.addTbCustomerAppraise(jsonObject);
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改评价;
     */
    @PostMapping("/editTbCustomerAppraise")
    public AjaxResult editTbCustomerAppraise(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerAppraiseService.editTbCustomerAppraise(jsonObject);
    }

    /**
     * 批量修改评价;
     */
    @PostMapping("/batchEditTbCustomerAppraise")
    public AjaxResult batchEditTbCustomerAppraise(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerAppraiseService.batchEditTbCustomerAppraise(jsonObject);
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除评价;
     */
    @PostMapping("/deleteTbCustomerAppraise")
    public AjaxResult removeTbCustomerAppraise(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerAppraiseService.removeTbCustomerAppraise(jsonObject);
    }

    /**
     * 批量删除评价;
     */
    @PostMapping("/deleteTbCustomerAppraises")
    public AjaxResult removeTbCustomerAppraises(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerAppraiseService.removeTbCustomerAppraises(jsonObject);
    }
}
