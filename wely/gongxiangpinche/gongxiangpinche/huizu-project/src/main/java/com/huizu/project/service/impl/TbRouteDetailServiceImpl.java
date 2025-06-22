package com.huizu.project.service.impl;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.annotation.ResponseParam;
import com.huizu.common.annotation.VerifyParam;
import com.huizu.common.utils.DictUtils;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.common.annotation.VerifyParam;
import com.huizu.common.utils.DateUtils;
import com.huizu.common.annotation.DataScope;
import com.huizu.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.project.mapper.TbRouteDetailMapper;
import com.huizu.project.domain.TbRouteDetail;
import com.huizu.project.service.ITbRouteDetailService;

/**
 * 行程资金明细;Service业务层处理
 *
 * @author huizu
 * @date 2024-08-12
 */
@Service
public class TbRouteDetailServiceImpl implements ITbRouteDetailService
{
    @Autowired
    private TbRouteDetailMapper tbRouteDetailMapper;

    /**
     * 查询行程资金明细;
     *
     * @param id 行程资金明细;主键
     * @return 行程资金明细;
     */
    @Override
    public TbRouteDetail selectTbRouteDetailById(Long id)
    {
        return tbRouteDetailMapper.selectTbRouteDetailById(id);
    }

    /**
     * 查询行程资金明细;列表
     *
     * @param tbRouteDetail 行程资金明细;
     * @return 行程资金明细;
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<TbRouteDetail> selectTbRouteDetailList(TbRouteDetail tbRouteDetail)
    {
        return tbRouteDetailMapper.selectTbRouteDetailList(tbRouteDetail);
    }

    /**
     * 新增行程资金明细;
     *
     * @param tbRouteDetail 行程资金明细;
     * @return 结果
     */
    @Override
    public int insertTbRouteDetail(TbRouteDetail tbRouteDetail)
    {
        //设置启用状态
        tbRouteDetail.setStatus("1");
        //设置创建人
        tbRouteDetail.setCreateBy(SecurityUtils.getUsername());
        //设置创建时间
        tbRouteDetail.setCreateTime(DateUtils.getNowDate());
        //设置删除标记
        tbRouteDetail.setDelFlag("0");
        return tbRouteDetailMapper.insertTbRouteDetail(tbRouteDetail);
    }

    /**
     * 修改行程资金明细;
     *
     * @param tbRouteDetail 行程资金明细;
     * @return 结果
     */
    @Override
    public int updateTbRouteDetail(TbRouteDetail tbRouteDetail)
    {
        //设置修改人
        tbRouteDetail.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        tbRouteDetail.setUpdateTime(DateUtils.getNowDate());
        return tbRouteDetailMapper.updateTbRouteDetail(tbRouteDetail);
    }

    /**
     * 批量删除行程资金明细;
     *
     * @param ids 需要删除的行程资金明细;主键
     * @return 结果
     */
    @Override
    public int deleteTbRouteDetailByIds(Long[] ids)
    {
        return tbRouteDetailMapper.deleteTbRouteDetailByIds(ids);
    }

    /**
     * 删除行程资金明细;信息
     *
     * @param id 行程资金明细;主键
     * @return 结果
     */
    @Override
    public int deleteTbRouteDetailById(Long id)
    {
        return tbRouteDetailMapper.deleteTbRouteDetailById(id);
    }


    // TODO ********************************api接口**********************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询行程资金明细;列表
     *
     * @return 行程资金明细;
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getTbRouteDetailList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = tbRouteDetailMapper.getTbRouteDetailList(jsonObject);
        for (JSONObject json : jsonObjectList){
            json.put("status",DictUtils.getDictLabel("sys_open_status",json.getString("status")));
        }
        return AjaxResult.success(jsonObjectList);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询行程资金明细;
     *
     * @return 行程资金明细;
     */
    @Override
    @VerifyParam("id")
    @ResponseParam("id,routeId,total,price,status,createBy,createTime,updateBy,updateTime,remark,delFlag,standby1,standby2,standby3")
    public AjaxResult getTbRouteDetail(JSONObject jsonObject)
    {
        JSONObject object = tbRouteDetailMapper.getTbRouteDetail(jsonObject);
        return AjaxResult.success(object);
    }


    // TODO 新增*****************************************************************************

    /**
     * 新增行程资金明细;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,routeId,total,price,status,createBy,createTime,updateBy,updateTime,remark,delFlag,standby1,standby2,standby3")
    public AjaxResult addTbRouteDetail(JSONObject jsonObject)
    {
        //设置启用状态
        jsonObject.put("status","1");
        //设置创建时间
        jsonObject.put("createTime",DateUtils.getNowDate());
        //设置删除标记
        jsonObject.put("delFlag","0");
        int i = tbRouteDetailMapper.addTbRouteDetail(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改行程资金明细;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,routeId,total,price,status,createBy,createTime,updateBy,updateTime,remark,delFlag,standby1,standby2,standby3")
    public AjaxResult editTbRouteDetail(JSONObject jsonObject)
    {
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        int i = tbRouteDetailMapper.editTbRouteDetail(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量修改行程资金明细;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult batchEditTbRouteDetail(JSONObject jsonObject)
    {
        //批量删除
        this.batchRemoveTbRouteDetail(jsonObject);
        //批量添加
        this.batchAddTbRouteDetail(jsonObject);
        return AjaxResult.success();
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除行程资金明细;信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult removeTbRouteDetail(JSONObject jsonObject)
    {
        int i = tbRouteDetailMapper.removeTbRouteDetail(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除行程资金明细;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult removeTbRouteDetails(JSONObject jsonObject)
    {
        int i = tbRouteDetailMapper.removeTbRouteDetails(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 其他*****************************************************************************

    /**
       * 批量删除
       *
       * @return 结果
       */
    public int batchRemoveTbRouteDetail(JSONObject jsonObject) {
        return tbRouteDetailMapper.batchRemoveTbRouteDetail(jsonObject);
    }

    /**
     * 批量添加
     *
     * @return 结果
     */
    public void batchAddTbRouteDetail(JSONObject jsonObject) {

        Long id = jsonObject.getLong("customerId");
        List<JSONObject> list = jsonObject.getList("list", JSONObject.class);

        for(JSONObject obj : list) {
            obj.put("customerId",id);
            //设置启用状态
            obj.put("status","1");
            //设置创建时间
            obj.put("createTime",DateUtils.getNowDate());
            //设置删除标记
            obj.put("delFlag","0");
            int i = tbRouteDetailMapper.addTbRouteDetail(obj);
        }
    }

}
