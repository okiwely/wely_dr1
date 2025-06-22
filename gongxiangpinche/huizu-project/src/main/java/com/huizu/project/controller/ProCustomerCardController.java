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
import com.huizu.project.domain.ProCustomerCard;
import com.huizu.project.service.IProCustomerCardService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 信用卡管理Controller
 *
 * @author huizu
 * @date 2024-09-20
 */
@RestController
@RequestMapping("/project")
public class ProCustomerCardController extends BaseController
{
    @Autowired
    private IProCustomerCardService proCustomerCardService;

    /**
     * 查询信用卡管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomerCard:list')")
    @GetMapping("/proCustomerCard/list")
    public TableDataInfo list(ProCustomerCard proCustomerCard)
    {
        startPage();
        List<ProCustomerCard> list = proCustomerCardService.selectProCustomerCardList(proCustomerCard);
        return getDataTable(list);
    }
    /**
     * 查询信用卡管理列表(不分页)
     */
    @GetMapping("/proCustomerCard/noPage/list")
    public AjaxResult noPageList(ProCustomerCard proCustomerCard)
    {
        List<ProCustomerCard> list = proCustomerCardService.selectProCustomerCardList(proCustomerCard);
        return AjaxResult.success(list);
    }
    /**
     * 导出信用卡管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomerCard:export')")
    @Log(title = "信用卡管理", businessType = BusinessType.EXPORT)
    @PostMapping("/proCustomerCard/export")
    public void export(HttpServletResponse response, ProCustomerCard proCustomerCard)
    {
        List<ProCustomerCard> list = proCustomerCardService.selectProCustomerCardList(proCustomerCard);
        ExcelUtil<ProCustomerCard> util = new ExcelUtil<ProCustomerCard>(ProCustomerCard.class);
        util.exportExcel(response, list, "信用卡管理数据");
    }

    /**
     * 获取信用卡管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomerCard:query')")
    @GetMapping(value = "/proCustomerCard/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return success(proCustomerCardService.selectProCustomerCardById(id));
    }

    /**
     * 新增信用卡管理
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomerCard:add')")
    @Log(title = "信用卡管理", businessType = BusinessType.INSERT)
    @PostMapping("/proCustomerCard")
    public AjaxResult add(@RequestBody ProCustomerCard proCustomerCard)
    {
        return toAjax(proCustomerCardService.insertProCustomerCard(proCustomerCard));
    }

    /**
     * 修改信用卡管理
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomerCard:edit')")
    @Log(title = "信用卡管理", businessType = BusinessType.UPDATE)
    @PutMapping("/proCustomerCard")
    public AjaxResult edit(@RequestBody ProCustomerCard proCustomerCard)
    {
        return toAjax(proCustomerCardService.updateProCustomerCard(proCustomerCard));
    }

    /**
     * 删除信用卡管理
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomerCard:remove')")
    @Log(title = "信用卡管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/proCustomerCard/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(proCustomerCardService.deleteProCustomerCardByIds(ids));
    }


    // TODO **********************************api接口********************************************************************

    // TODO 列表********************************************************************************

    /**
     * 查询信用卡管理列表
     */
    @PostMapping("/getProCustomerCardList")
    public AjaxResult getProCustomerCardList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return proCustomerCardService.getProCustomerCardList(jsonObject);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询信用卡管理详情
     */
    @PostMapping("/getProCustomerCard")
    public AjaxResult getProCustomerCard(@RequestBody JSONObject jsonObject)
    {
        return proCustomerCardService.getProCustomerCard(jsonObject);
    }

    // TODO 新增*****************************************************************************

    /**
     * 新增信用卡管理
     */
    @PostMapping("/addProCustomerCard")
    public AjaxResult addProCustomerCard(@RequestBody JSONObject jsonObject)
    {
        return proCustomerCardService.addProCustomerCard(jsonObject);
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改信用卡管理
     */
    @PostMapping("/editProCustomerCard")
    public AjaxResult editProCustomerCard(@RequestBody JSONObject jsonObject)
    {
        return proCustomerCardService.editProCustomerCard(jsonObject);
    }

    /**
     * 批量修改信用卡管理
     */
    @PostMapping("/batchEditProCustomerCard")
    public AjaxResult batchEditProCustomerCard(@RequestBody JSONObject jsonObject)
    {
        return proCustomerCardService.batchEditProCustomerCard(jsonObject);
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除信用卡管理
     */
    @PostMapping("/removeProCustomerCard")
    public AjaxResult removeProCustomerCard(@RequestBody JSONObject jsonObject)
    {
        return proCustomerCardService.removeProCustomerCard(jsonObject);
    }

    /**
     * 批量删除信用卡管理
     */
    @PostMapping("/removeProCustomerCards")
    public AjaxResult removeProCustomerCards(@RequestBody JSONObject jsonObject)
    {
        return proCustomerCardService.removeProCustomerCards(jsonObject);
    }
}
