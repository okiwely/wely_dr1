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
import com.huizu.project.domain.TbCustomerChat;
import com.huizu.project.service.ITbCustomerChatService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 聊天信息Controller
 *
 * @author huizu
 * @date 2024-08-12
 */
@RestController
@RequestMapping("/project")
public class TbCustomerChatController extends BaseController
{
    @Autowired
    private ITbCustomerChatService tbCustomerChatService;

    /**
     * 查询聊天信息列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerChat:list')")
    @GetMapping("/tbCustomerChat/list")
    public TableDataInfo list(TbCustomerChat tbCustomerChat)
    {
        startPage();
        List<TbCustomerChat> list = tbCustomerChatService.selectTbCustomerChatList(tbCustomerChat);
        return getDataTable(list);
    }
    /**
     * 查询聊天信息列表(不分页)
     */
    @GetMapping("/tbCustomerChat/noPage/list")
    public AjaxResult noPageList(TbCustomerChat tbCustomerChat)
    {
        List<TbCustomerChat> list = tbCustomerChatService.selectTbCustomerChatList(tbCustomerChat);
        return AjaxResult.success(list);
    }
    /**
     * 导出聊天信息列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerChat:export')")
    @Log(title = "聊天信息", businessType = BusinessType.EXPORT)
    @PostMapping("/tbCustomerChat/export")
    public void export(HttpServletResponse response, TbCustomerChat tbCustomerChat)
    {
        List<TbCustomerChat> list = tbCustomerChatService.selectTbCustomerChatList(tbCustomerChat);
        ExcelUtil<TbCustomerChat> util = new ExcelUtil<TbCustomerChat>(TbCustomerChat.class);
        util.exportExcel(response, list, "聊天信息数据");
    }

    /**
     * 获取聊天信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerChat:query')")
    @GetMapping(value = "/tbCustomerChat/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tbCustomerChatService.selectTbCustomerChatById(id));
    }

    /**
     * 新增聊天信息
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerChat:add')")
    @Log(title = "聊天信息", businessType = BusinessType.INSERT)
    @PostMapping("/tbCustomerChat")
    public AjaxResult add(@RequestBody TbCustomerChat tbCustomerChat)
    {
        return toAjax(tbCustomerChatService.insertTbCustomerChat(tbCustomerChat));
    }

    /**
     * 修改聊天信息
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerChat:edit')")
    @Log(title = "聊天信息", businessType = BusinessType.UPDATE)
    @PutMapping("/tbCustomerChat")
    public AjaxResult edit(@RequestBody TbCustomerChat tbCustomerChat)
    {
        return toAjax(tbCustomerChatService.updateTbCustomerChat(tbCustomerChat));
    }

    /**
     * 删除聊天信息
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerChat:remove')")
    @Log(title = "聊天信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/tbCustomerChat/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tbCustomerChatService.deleteTbCustomerChatByIds(ids));
    }


    // TODO **********************************api接口********************************************************************

    // TODO 列表********************************************************************************

    /**
     * 查询聊天信息列表
     */
    @PostMapping("/getTbCustomerChatList")
    public AjaxResult getTbCustomerChatList(@RequestBody(required = false) JSONObject jsonObject)
    {
        return tbCustomerChatService.getTbCustomerChatList(jsonObject);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询聊天信息详情
     */
    @PostMapping("/getTbCustomerChat")
    public AjaxResult getTbCustomerChat(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerChatService.getTbCustomerChat(jsonObject);
    }

    // TODO 新增*****************************************************************************

    /**
     * 新增聊天信息
     */
    @PostMapping("/addTbCustomerChat")
    public AjaxResult addTbCustomerChat(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerChatService.addTbCustomerChat(jsonObject);
    }
    /**
     * 同意加入拼车
     */
    @PostMapping("/consentRoute")
    public AjaxResult consentRoute(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerChatService.consentRoute(jsonObject);
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改聊天信息
     */
    @PostMapping("/editTbCustomerChat")
    public AjaxResult editTbCustomerChat(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerChatService.editTbCustomerChat(jsonObject);
    }

    /**
     * 批量修改聊天信息
     */
    @PostMapping("/batchEditTbCustomerChat")
    public AjaxResult batchEditTbCustomerChat(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerChatService.batchEditTbCustomerChat(jsonObject);
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除聊天信息
     */
    @PostMapping("/deleteTbCustomerChat")
    public AjaxResult removeTbCustomerChat(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerChatService.removeTbCustomerChat(jsonObject);
    }

    /**
     * 批量删除聊天信息
     */
    @PostMapping("/deleteTbCustomerChats")
    public AjaxResult removeTbCustomerChats(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerChatService.removeTbCustomerChats(jsonObject);
    }
}
