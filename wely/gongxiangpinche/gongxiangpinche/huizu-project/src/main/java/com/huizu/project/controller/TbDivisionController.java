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
import com.huizu.project.domain.TbDivision;
import com.huizu.project.service.ITbDivisionService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 行政区划Controller
 *
 * @author huizu
 * @date 2024-08-14
 */
@RestController
@RequestMapping("/project")
public class TbDivisionController extends BaseController
{
    @Autowired
    private ITbDivisionService tbDivisionService;

    /**
     * 查询行政区划列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbDivision:list')")
    @GetMapping("/tbDivision/list")
    public TableDataInfo list(TbDivision tbDivision)
    {
        startPage();
        List<TbDivision> list = tbDivisionService.selectTbDivisionList(tbDivision);
        return getDataTable(list);
    }
    /**
     * 查询行政区划列表(不分页)
     */
    @GetMapping("/tbDivision/noPage/list")
    public AjaxResult noPageList(TbDivision tbDivision)
    {
        List<TbDivision> list = tbDivisionService.selectTbDivisionList(tbDivision);
        return AjaxResult.success(list);
    }
    /**
     * 导出行政区划列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbDivision:export')")
    @Log(title = "行政区划", businessType = BusinessType.EXPORT)
    @PostMapping("/tbDivision/export")
    public void export(HttpServletResponse response, TbDivision tbDivision)
    {
        List<TbDivision> list = tbDivisionService.selectTbDivisionList(tbDivision);
        ExcelUtil<TbDivision> util = new ExcelUtil<TbDivision>(TbDivision.class);
        util.exportExcel(response, list, "行政区划数据");
    }

    /**
     * 获取行政区划详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:tbDivision:query')")
    @GetMapping(value = "/tbDivision/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tbDivisionService.selectTbDivisionById(id));
    }

    /**
     * 新增行政区划
     */
    @PreAuthorize("@ss.hasPermi('project:tbDivision:add')")
    @Log(title = "行政区划", businessType = BusinessType.INSERT)
    @PostMapping("/tbDivision")
    public AjaxResult add(@RequestBody TbDivision tbDivision)
    {
        return toAjax(tbDivisionService.insertTbDivision(tbDivision));
    }

    /**
     * 修改行政区划
     */
    @PreAuthorize("@ss.hasPermi('project:tbDivision:edit')")
    @Log(title = "行政区划", businessType = BusinessType.UPDATE)
    @PutMapping("/tbDivision")
    public AjaxResult edit(@RequestBody TbDivision tbDivision)
    {
        return toAjax(tbDivisionService.updateTbDivision(tbDivision));
    }

    /**
     * 删除行政区划
     */
    @PreAuthorize("@ss.hasPermi('project:tbDivision:remove')")
    @Log(title = "行政区划", businessType = BusinessType.DELETE)
	@DeleteMapping("/tbDivision/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tbDivisionService.deleteTbDivisionByIds(ids));
    }


    // TODO **********************************api接口********************************************************************

    // TODO 列表********************************************************************************

    /**
     * 查询行政区划列表
     */
    @PostMapping("/getTbDivisionList")
    public AjaxResult getTbDivisionList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return tbDivisionService.getTbDivisionList(jsonObject);
    }
    @PostMapping("/getCityList")
    public AjaxResult getCityList()
    {
        JSONObject object = new JSONObject();
        return tbDivisionService.getCityList(object);
    }
    @PostMapping("/getAreaList")
    public AjaxResult getAreaList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return tbDivisionService.getAreaList(jsonObject);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询行政区划详情
     */
    @PostMapping("/getTbDivision")
    public AjaxResult getTbDivision(@RequestBody JSONObject jsonObject)
    {
        return tbDivisionService.getTbDivision(jsonObject);
    }

    // TODO 新增*****************************************************************************

    /**
     * 新增行政区划
     */
    @PostMapping("/addTbDivision")
    public AjaxResult addTbDivision(@RequestBody JSONObject jsonObject)
    {
        return tbDivisionService.addTbDivision(jsonObject);
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改行政区划
     */
    @PostMapping("/editTbDivision")
    public AjaxResult editTbDivision(@RequestBody JSONObject jsonObject)
    {
        return tbDivisionService.editTbDivision(jsonObject);
    }

    /**
     * 批量修改行政区划
     */
    @PostMapping("/batchEditTbDivision")
    public AjaxResult batchEditTbDivision(@RequestBody JSONObject jsonObject)
    {
        return tbDivisionService.batchEditTbDivision(jsonObject);
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除行政区划
     */
    @PostMapping("/removeTbDivision")
    public AjaxResult removeTbDivision(@RequestBody JSONObject jsonObject)
    {
        return tbDivisionService.removeTbDivision(jsonObject);
    }

    /**
     * 批量删除行政区划
     */
    @PostMapping("/removeTbDivisions")
    public AjaxResult removeTbDivisions(@RequestBody JSONObject jsonObject)
    {
        return tbDivisionService.removeTbDivisions(jsonObject);
    }
}
