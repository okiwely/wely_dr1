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
import com.huizu.project.domain.ProOrderInfo;
import com.huizu.project.service.IProOrderInfoService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 订单信息Controller
 *
 * @author huizu
 * @date 2024-08-26
 */
@RestController
@RequestMapping("/project")
public class ProOrderInfoController extends BaseController
{
    @Autowired
    private IProOrderInfoService proOrderInfoService;

    /**
     * 查询订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('project:proOrderInfo:list')")
    @GetMapping("/proOrderInfo/list")
    public TableDataInfo list(ProOrderInfo proOrderInfo)
    {
        startPage();
        List<ProOrderInfo> list = proOrderInfoService.selectProOrderInfoList(proOrderInfo);
        return getDataTable(list);
    }
    /**
     * 查询订单信息列表(不分页)
     */
    @GetMapping("/proOrderInfo/noPage/list")
    public AjaxResult noPageList(ProOrderInfo proOrderInfo)
    {
        List<ProOrderInfo> list = proOrderInfoService.selectProOrderInfoList(proOrderInfo);
        return AjaxResult.success(list);
    }
    /**
     * 导出订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('project:proOrderInfo:export')")
    @Log(title = "订单信息", businessType = BusinessType.EXPORT)
    @PostMapping("/proOrderInfo/export")
    public void export(HttpServletResponse response, ProOrderInfo proOrderInfo)
    {
        List<ProOrderInfo> list = proOrderInfoService.selectProOrderInfoList(proOrderInfo);
        ExcelUtil<ProOrderInfo> util = new ExcelUtil<ProOrderInfo>(ProOrderInfo.class);
        util.exportExcel(response, list, "订单信息数据");
    }

    /**
     * 获取订单信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:proOrderInfo:query')")
    @GetMapping(value = "/proOrderInfo/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return success(proOrderInfoService.selectProOrderInfoById(id));
    }

    /**
     * 新增订单信息
     */
    @PreAuthorize("@ss.hasPermi('project:proOrderInfo:add')")
    @Log(title = "订单信息", businessType = BusinessType.INSERT)
    @PostMapping("/proOrderInfo")
    public AjaxResult add(@RequestBody ProOrderInfo proOrderInfo)
    {
        return toAjax(proOrderInfoService.insertProOrderInfo(proOrderInfo));
    }

    /**
     * 修改订单信息
     */
    @PreAuthorize("@ss.hasPermi('project:proOrderInfo:edit')")
    @Log(title = "订单信息", businessType = BusinessType.UPDATE)
    @PutMapping("/proOrderInfo")
    public AjaxResult edit(@RequestBody ProOrderInfo proOrderInfo)
    {
        return toAjax(proOrderInfoService.updateProOrderInfo(proOrderInfo));
    }

    /**
     * 删除订单信息
     */
    @PreAuthorize("@ss.hasPermi('project:proOrderInfo:remove')")
    @Log(title = "订单信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/proOrderInfo/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(proOrderInfoService.deleteProOrderInfoByIds(ids));
    }


    // TODO **********************************api接口********************************************************************

    // TODO 列表********************************************************************************

    /**
     * 查询订单信息列表
     */
    @PostMapping("/getProOrderInfoList")
    public AjaxResult getProOrderInfoList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return proOrderInfoService.getProOrderInfoList(jsonObject);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询订单信息详情
     */
    @PostMapping("/getProOrderInfo")
    public AjaxResult getProOrderInfo(@RequestBody JSONObject jsonObject)
    {
        return proOrderInfoService.getProOrderInfo(jsonObject);
    }

    // TODO 新增*****************************************************************************

    /**
     * 新增订单信息（提交订单）
     */
    @PostMapping("/addProOrderInfo")
    public AjaxResult addProOrderInfo(@RequestBody JSONObject jsonObject)
    {
        return proOrderInfoService.addProOrderInfo(jsonObject);
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改订单信息
     */
    @PostMapping("/editProOrderInfo")
    public AjaxResult editProOrderInfo(@RequestBody JSONObject jsonObject)
    {
        return proOrderInfoService.editProOrderInfo(jsonObject);
    }
    /**
     * 支付订单
     */
    @PostMapping("/payOrder")
    public AjaxResult payOrder(@RequestBody JSONObject jsonObject)
    {
        return proOrderInfoService.payOrder(jsonObject);
    }

    /**
     * 批量修改订单信息
     */
    @PostMapping("/batchEditProOrderInfo")
    public AjaxResult batchEditProOrderInfo(@RequestBody JSONObject jsonObject)
    {
        return proOrderInfoService.batchEditProOrderInfo(jsonObject);
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除订单信息
     */
    @PostMapping("/removeProOrderInfo")
    public AjaxResult removeProOrderInfo(@RequestBody JSONObject jsonObject)
    {
        return proOrderInfoService.removeProOrderInfo(jsonObject);
    }

    /**
     * 批量删除订单信息
     */
    @PostMapping("/removeProOrderInfos")
    public AjaxResult removeProOrderInfos(@RequestBody JSONObject jsonObject)
    {
        return proOrderInfoService.removeProOrderInfos(jsonObject);
    }
}
