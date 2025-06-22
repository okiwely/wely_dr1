package com.huizu.project.controller;

import com.alibaba.fastjson2.JSONObject;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huizu.project.utils.RouteCalculator;
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
import com.huizu.project.domain.ProCustomer;
import com.huizu.project.service.IProCustomerService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 会员信息Controller
 *
 * @author huizu
 * @date 2024-08-12
 */
@RestController
@RequestMapping("/project")
public class ProCustomerController extends BaseController
{
    @Autowired
    private IProCustomerService proCustomerService;

    /**
     * 查询会员信息列表
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomer:list')")
    @GetMapping("/proCustomer/list")
    public TableDataInfo list(ProCustomer proCustomer) throws IOException {
        startPage();
        List<ProCustomer> list = proCustomerService.selectProCustomerList(proCustomer);
        return getDataTable(list);
    }
    /**
     * 查询会员信息列表(不分页)
     */
    @GetMapping("/proCustomer/noPage/list")
    public AjaxResult noPageList(ProCustomer proCustomer)
    {
        List<ProCustomer> list = proCustomerService.selectProCustomerList(proCustomer);
        return AjaxResult.success(list);
    }
    /**
     * 导出会员信息列表
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomer:export')")
    @Log(title = "会员信息", businessType = BusinessType.EXPORT)
    @PostMapping("/proCustomer/export")
    public void export(HttpServletResponse response, ProCustomer proCustomer)
    {
        List<ProCustomer> list = proCustomerService.selectProCustomerList(proCustomer);
        ExcelUtil<ProCustomer> util = new ExcelUtil<ProCustomer>(ProCustomer.class);
        util.exportExcel(response, list, "会员信息数据");
    }

    /**
     * 获取会员信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomer:query')")
    @GetMapping(value = "/proCustomer/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(proCustomerService.selectProCustomerById(id));
    }

    /**
     * 新增会员信息
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomer:add')")
    @Log(title = "会员信息", businessType = BusinessType.INSERT)
    @PostMapping("/proCustomer")
    public AjaxResult add(@RequestBody ProCustomer proCustomer)
    {
        return toAjax(proCustomerService.insertProCustomer(proCustomer));
    }

    /**
     * 修改会员信息
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomer:edit')")
    @Log(title = "会员信息", businessType = BusinessType.UPDATE)
    @PutMapping("/proCustomer")
    public AjaxResult edit(@RequestBody ProCustomer proCustomer)
    {
        return toAjax(proCustomerService.updateProCustomer(proCustomer));
    }

    @PutMapping("/customerWithdraw")
    public AjaxResult customerWithdraw(@RequestBody ProCustomer proCustomer)
    {
        return toAjax(proCustomerService.customerWithdraw(proCustomer));
    }

    @PutMapping("/auditCustomer")
    public AjaxResult auditCustomer(@RequestBody ProCustomer proCustomer)
    {
        return toAjax(proCustomerService.auditCustomer(proCustomer));
    }

    /**
     * 删除会员信息
     */
    @PreAuthorize("@ss.hasPermi('project:proCustomer:remove')")
    @Log(title = "会员信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/proCustomer/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(proCustomerService.deleteProCustomerByIds(ids));
    }


    // TODO **********************************api接口********************************************************************

    // TODO 列表********************************************************************************

    /**
     * 查询会员信息列表
     */
    @PostMapping("/getProCustomerList")
    public AjaxResult getProCustomerList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return proCustomerService.getProCustomerList(jsonObject);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询会员信息详情（个人信息）
     */
    @PostMapping("/getProCustomer")
    public AjaxResult getProCustomer(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.getProCustomer(jsonObject);
    }
    /**
     * 查询会员信息详情（个人信息）
     */
    @PostMapping("/getProCustomerInfo")
    public AjaxResult getProCustomerInfo(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.getProCustomerInfo(jsonObject);
    }
    /**
     * 查询会员信息详情（简介页）
     */
    @PostMapping("/getCustomerIntroduce")
    public AjaxResult getCustomerIntroduce(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.getCustomerIntroduce(jsonObject);
    }
    /**
     * 登录
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.login(jsonObject);
    }

    // TODO 新增*****************************************************************************

    /**
     * 新增会员信息
     */
    @PostMapping("/addProCustomer")
    public AjaxResult addProCustomer(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.addProCustomer(jsonObject);
    }
    /**
     * 注册
     */
    @PostMapping("/register")
    public AjaxResult register(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.register(jsonObject);
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改会员信息
     */
    @PostMapping("/editProCustomer")
    public AjaxResult editProCustomer(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.editProCustomer(jsonObject);
    }
    /**
     * 修改会员信息（认证手机号）
     */
    @PostMapping("/authPhone")
    public AjaxResult authPhone(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.authPhone(jsonObject);
    }
    /**
     * 修改会员信息（提交身份认证）
     */
    @PostMapping("/submitAudit")
    public AjaxResult submitAudit(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.submitAudit(jsonObject);
    }
    /**
     * 提现申请
     */
    @PostMapping("/withdraw")
    public AjaxResult withdraw(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.withdraw(jsonObject);
    }

    /**
     * 批量修改会员信息
     */
    @PostMapping("/batchEditProCustomer")
    public AjaxResult batchEditProCustomer(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.batchEditProCustomer(jsonObject);
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除会员信息
     */
    @PostMapping("/deleteProCustomer")
    public AjaxResult removeProCustomer(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.removeProCustomer(jsonObject);
    }

    /**
     * 批量删除会员信息
     */
    @PostMapping("/deleteProCustomers")
    public AjaxResult removeProCustomers(@RequestBody JSONObject jsonObject)
    {
        return proCustomerService.removeProCustomers(jsonObject);
    }
}
