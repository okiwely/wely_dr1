package com.huizu.project.controller;

import com.alibaba.fastjson2.JSONObject;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.huizu.common.utils.DateUtils;
import com.huizu.common.utils.PageUtils;
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
import com.huizu.project.domain.TbCustomerRoute;
import com.huizu.project.service.ITbCustomerRouteService;
import com.huizu.common.utils.poi.ExcelUtil;
import com.huizu.common.core.page.TableDataInfo;

/**
 * 行程管理;Controller
 *
 * @author huizu
 * @date 2024-08-12
 */
@RestController
@RequestMapping("/project")
public class TbCustomerRouteController extends BaseController
{
    @Autowired
    private ITbCustomerRouteService tbCustomerRouteService;

    /**
     * 查询行程管理;列表
     */
//    @PreAuthorize("@ss.hasPermi('project:tbCustomerRoute:list')")
    @GetMapping("/tbCustomerRoute/list")
    public TableDataInfo list(TbCustomerRoute tbCustomerRoute)
    {
        startPage();
        List<TbCustomerRoute> list = tbCustomerRouteService.selectTbCustomerRouteList(tbCustomerRoute);
        return getDataTable(list);
    }
    /**
     * 查询行程管理;列表(不分页)
     */
    @GetMapping("/tbCustomerRoute/noPage/list")
    public AjaxResult noPageList(TbCustomerRoute tbCustomerRoute)
    {
        List<TbCustomerRoute> list = tbCustomerRouteService.selectTbCustomerRouteList(tbCustomerRoute);
        return AjaxResult.success(list);
    }
    /**
     * 导出行程管理;列表
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerRoute:export')")
    @Log(title = "行程管理;", businessType = BusinessType.EXPORT)
    @PostMapping("/tbCustomerRoute/export")
    public void export(HttpServletResponse response, TbCustomerRoute tbCustomerRoute)
    {
        List<TbCustomerRoute> list = tbCustomerRouteService.selectTbCustomerRouteList(tbCustomerRoute);
        ExcelUtil<TbCustomerRoute> util = new ExcelUtil<TbCustomerRoute>(TbCustomerRoute.class);
        util.exportExcel(response, list, "行程管理;数据");
    }

    /**
     * 获取行程管理;详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerRoute:query')")
    @GetMapping(value = "/tbCustomerRoute/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tbCustomerRouteService.selectTbCustomerRouteById(id));
    }

    /**
     * 新增行程管理;
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerRoute:add')")
    @Log(title = "行程管理;", businessType = BusinessType.INSERT)
    @PostMapping("/tbCustomerRoute")
    public AjaxResult add(@RequestBody TbCustomerRoute tbCustomerRoute)
    {
        return toAjax(tbCustomerRouteService.insertTbCustomerRoute(tbCustomerRoute));
    }

    /**
     * 修改行程管理;
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerRoute:edit')")
    @Log(title = "行程管理;", businessType = BusinessType.UPDATE)
    @PutMapping("/tbCustomerRoute")
    public AjaxResult edit(@RequestBody TbCustomerRoute tbCustomerRoute)
    {
        return toAjax(tbCustomerRouteService.updateTbCustomerRoute(tbCustomerRoute));
    }

    /**
     * 删除行程管理;
     */
    @PreAuthorize("@ss.hasPermi('project:tbCustomerRoute:remove')")
    @Log(title = "行程管理;", businessType = BusinessType.DELETE)
	@DeleteMapping("/tbCustomerRoute/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tbCustomerRouteService.deleteTbCustomerRouteByIds(ids));
    }


    // TODO **********************************api接口********************************************************************

    // TODO 列表********************************************************************************

    /**
     * 查询行程管理;列表
     */
    @PostMapping("/getTbCustomerRouteListS")
    public TableDataInfo getTbCustomerRouteListS(@RequestBody(required = false) JSONObject jsonObject)
    {
        Integer pageNum = jsonObject.getInteger("pageNum");
        Integer pageSize = jsonObject.getInteger("pageSize");
        if (pageNum != null && pageSize != null){
            PageUtils.startPage(pageNum,pageSize);
        }else {
            PageUtils.startPage(1,9999);
        }
        return getDataTable(tbCustomerRouteService.getTbCustomerRouteListS(jsonObject));
    }
    /**
     * 查询行程管理;列表
     */
    @PostMapping("/getTbCustomerRouteListU")
    public AjaxResult getTbCustomerRouteListU(@RequestBody(required = false) JSONObject jsonObject)
    {
        return tbCustomerRouteService.getTbCustomerRouteListU(jsonObject);
    }
    /**
     * 查询行程管理 现在
     */
    @PostMapping("/getTbCustomerRouteListNow")
    public AjaxResult getTbCustomerRouteListNow(@RequestBody(required = false) JSONObject jsonObject)
    {
        return tbCustomerRouteService.getTbCustomerRouteListNow(jsonObject);
    }
    /**
     * 查询行程管理 过期
     */
    @PostMapping("/getTbCustomerRouteListOld")
    public AjaxResult getTbCustomerRouteListOld(@RequestBody(required = false) JSONObject jsonObject)
    {
        return tbCustomerRouteService.getTbCustomerRouteListOld(jsonObject);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询行程管理;详情(司机拼车详情)
     */
    @PostMapping("/getTbCustomerRouteS")
    public AjaxResult getTbCustomerRouteS(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerRouteService.getTbCustomerRouteS(jsonObject);
    }
    /**
     * 查询行程管理;详情(用户拼车详情)
     */
    @PostMapping("/getTbCustomerRouteU")
    public AjaxResult getTbCustomerRouteU(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerRouteService.getTbCustomerRouteU(jsonObject);
    }
    /**
     * 查询行程管理;详情(个人查看详情)
     */
    @PostMapping("/getTbCustomerRoute")
    public AjaxResult getTbCustomerRoute(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerRouteService.getTbCustomerRoute(jsonObject);
    }
    /**
     * 查询行程管理;详情(个人查看详情)
     */
    @PostMapping("/getLastRoute")
    public AjaxResult getLastRoute(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerRouteService.getLastRoute(jsonObject);
    }

    // TODO 新增*****************************************************************************

    /**
     * 新增行程管理;
     */
    @PostMapping("/addTbCustomerRoute")
    public AjaxResult addTbCustomerRoute(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerRouteService.addTbCustomerRoute(jsonObject);
    }
    /**
     * 计算价格
     */
    @PostMapping("/calculatePrice")
    public AjaxResult calculatePrice(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerRouteService.calculatePrice(jsonObject);
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改行程管理;
     */
    @PostMapping("/editTbCustomerRoute")
    public AjaxResult editTbCustomerRoute(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerRouteService.editTbCustomerRoute(jsonObject);
    }

    /**
     * 批量修改行程管理;
     */
    @PostMapping("/batchEditTbCustomerRoute")
    public AjaxResult batchEditTbCustomerRoute(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerRouteService.batchEditTbCustomerRoute(jsonObject);
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除行程管理;
     */
    @PostMapping("/deleteTbCustomerRoute")
    public AjaxResult removeTbCustomerRoute(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerRouteService.removeTbCustomerRoute(jsonObject);
    }

    /**
     * 批量删除行程管理;
     */
    @PostMapping("/deleteTbCustomerRoutes")
    public AjaxResult removeTbCustomerRoutes(@RequestBody JSONObject jsonObject)
    {
        return tbCustomerRouteService.removeTbCustomerRoutes(jsonObject);
    }

    /**
     * 定时生成拼车
     */
    public void taskAddRoute() {
        //获取今日周几
        int dayOfWeekInt = this.getTodayWeek();
        // 输出结果
        System.out.println(dayOfWeekInt);
        //查询所有今天需要生成得数据
        TbCustomerRoute tbCustomerRoute = new TbCustomerRoute();
        tbCustomerRoute.setState("2");
        tbCustomerRoute.setCreateTime(getBeforeData());
        tbCustomerRoute.setWeek(dayOfWeekInt + "");
        List<TbCustomerRoute> tbCustomerRoutes = tbCustomerRouteService.selectTbCustomerRouteList1(tbCustomerRoute);

        //生成数据
        for (TbCustomerRoute item : tbCustomerRoutes) {
            item.setState("1");
            item.setCreateTime(DateUtils.getNowDate());
            item.setStartTime(getNowDate(item.getStartTime()));
            item.setEndTime(getNowDate(item.getEndTime()));
            tbCustomerRouteService.insertTbCustomerRoute(item);
        }
    }

    public int getTodayWeek(){
        // 创建一个Calendar实例，初始化为当前时间
        Calendar calendar = Calendar.getInstance();
        // 获取当前日期是一周中的第几天，注意Java中周日是一周的第一天，值为1，周一为2，依此类推
        int dayOfWeekInt = calendar.get(Calendar.DAY_OF_WEEK);
        // 调整为国际通用的一周开始于周一，如果需要
        dayOfWeekInt -= 1;
        if (dayOfWeekInt == 0) {
            dayOfWeekInt = 7;
        }
        return dayOfWeekInt;
    }
    public Date getBeforeData(){
        // 创建一个Calendar实例，初始化为当前时间
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.MONTH, -3);
        return calendar.getTime();
    }
    public Date getNowDate(Date date){
        // 创建一个Calendar实例，初始化为当前时间
        Calendar nowCalendar = Calendar.getInstance();
        nowCalendar.setTime(new Date());
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(nowCalendar.get(Calendar.YEAR), nowCalendar.get(Calendar.MONTH), nowCalendar.get(Calendar.DAY_OF_MONTH));
        return calendar.getTime();
    }
}
