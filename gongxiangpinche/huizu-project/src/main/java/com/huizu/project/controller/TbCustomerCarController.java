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
import com.huizu.project.domain.TbCustomerCar;
import com.huizu.project.service.ITbCustomerCarService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 汽车管理Controller
 *
 * @author huizu
 * @date 2024-08-12
 */
@RestController
@RequestMapping("/project")
public class TbCustomerCarController extends BaseController
{
    @Autowired
    private ITbCustomerCarService tbCustomerCarService;

    /**
     * 查询汽车管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerCar:list')")
    @GetMapping("/tbCustomerCar/list")
    public TableDataInfo list(TbCustomerCar tbCustomerCar)
    {
        startPage();
        List<TbCustomerCar> list = tbCustomerCarService.selectTbCustomerCarList(tbCustomerCar);
        return getDataTable(list);
    }
    /**
     * 查询汽车管理列表(不分页)
     */
    @GetMapping("/tbCustomerCar/noPage/list")
    public AjaxResult noPageList(TbCustomerCar tbCustomerCar)
    {
        List<TbCustomerCar> list = tbCustomerCarService.selectTbCustomerCarList(tbCustomerCar);
        return AjaxResult.success(list);
    }
    /**
     * 导出汽车管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerCar:export')")
    @Log(title = "汽车管理", businessType = BusinessType.EXPORT)
    @PostMapping("/tbCustomerCar/export")
    public void export(HttpServletResponse response, TbCustomerCar tbCustomerCar)
    {
        List<TbCustomerCar> list = tbCustomerCarService.selectTbCustomerCarList(tbCustomerCar);
        ExcelUtil<TbCustomerCar> util = new ExcelUtil<TbCustomerCar>(TbCustomerCar.class);
        util.exportExcel(response, list, "汽车管理数据");
    }

    /**
     * 获取汽车管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerCar:query')")
    @GetMapping(value = "/tbCustomerCar/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tbCustomerCarService.selectTbCustomerCarById(id));
    }
    /**
     * 获取汽车管理详细信息
     */
    @GetMapping(value = "/tbCustomerCar/getCarByCustomerId/{id}")
    public AjaxResult getCarByCustomerId(@PathVariable("id") Long id)
    {
        return success(tbCustomerCarService.getCarByCustomerId(id));
    }

    /**
     * 新增汽车管理
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerCar:add')")
    @Log(title = "汽车管理", businessType = BusinessType.INSERT)
    @PostMapping("/tbCustomerCar")
    public AjaxResult add(@RequestBody TbCustomerCar tbCustomerCar)
    {
        return toAjax(tbCustomerCarService.insertTbCustomerCar(tbCustomerCar));
    }

    /**
     * 修改汽车管理
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerCar:edit')")
    @Log(title = "汽车管理", businessType = BusinessType.UPDATE)
    @PutMapping("/tbCustomerCar")
    public AjaxResult edit(@RequestBody TbCustomerCar tbCustomerCar)
    {
        return toAjax(tbCustomerCarService.updateTbCustomerCar(tbCustomerCar));
    }

    /**
     * 删除汽车管理
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerCar:remove')")
    @Log(title = "汽车管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/tbCustomerCar/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tbCustomerCarService.deleteTbCustomerCarByIds(ids));
    }


    // TODO **********************************api接口********************************************************************

    // TODO 列表********************************************************************************

    /**
     * 查询汽车管理列表
     */
    @PostMapping("/getTbCustomerCarList")
    public AjaxResult getTbCustomerCarList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return tbCustomerCarService.getTbCustomerCarList(jsonObject);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询汽车管理详情
     */
    @PostMapping("/getTbCustomerCar")
    public AjaxResult getTbCustomerCar(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerCarService.getTbCustomerCar(jsonObject);
    }

    // TODO 新增*****************************************************************************

    /**
     * 新增汽车管理
     */
    @PostMapping("/addTbCustomerCar")
    public AjaxResult addTbCustomerCar(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerCarService.addTbCustomerCar(jsonObject);
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改汽车管理
     */
    @PostMapping("/editTbCustomerCar")
    public AjaxResult editTbCustomerCar(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerCarService.editTbCustomerCar(jsonObject);
    }

    /**
     * 批量修改汽车管理
     */
    @PostMapping("/batchEditTbCustomerCar")
    public AjaxResult batchEditTbCustomerCar(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerCarService.batchEditTbCustomerCar(jsonObject);
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除汽车管理
     */
    @PostMapping("/deleteTbCustomerCar")
    public AjaxResult removeTbCustomerCar(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerCarService.removeTbCustomerCar(jsonObject);
    }

    /**
     * 批量删除汽车管理
     */
    @PostMapping("/deleteTbCustomerCars")
    public AjaxResult removeTbCustomerCars(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerCarService.removeTbCustomerCars(jsonObject);
    }
}
