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
import com.huizu.common.utils.MessageUtils;
import com.huizu.common.utils.SecurityUtils;
import com.huizu.project.domain.ProCustomer;
import com.huizu.project.domain.ProOrderInfo;
import com.huizu.project.mapper.ProCustomerMapper;
import com.huizu.project.mapper.ProOrderInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.project.mapper.TbCustomerAppraiseMapper;
import com.huizu.project.domain.TbCustomerAppraise;
import com.huizu.project.service.ITbCustomerAppraiseService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 评价;Service业务层处理
 *
 * @author huizu
 * @date 2024-08-12
 */
@Service
public class TbCustomerAppraiseServiceImpl implements ITbCustomerAppraiseService
{
    @Autowired
    private TbCustomerAppraiseMapper tbCustomerAppraiseMapper;
    @Autowired
    private ProCustomerMapper customerMapper;
    @Autowired
    private ProOrderInfoMapper orderInfoMapper;

    /**
     * 查询评价;
     *
     * @param id 评价;主键
     * @return 评价;
     */
    @Override
    public TbCustomerAppraise selectTbCustomerAppraiseById(Long id)
    {
        return tbCustomerAppraiseMapper.selectTbCustomerAppraiseById(id);
    }

    /**
     * 查询评价;列表
     *
     * @param tbCustomerAppraise 评价;
     * @return 评价;
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<TbCustomerAppraise> selectTbCustomerAppraiseList(TbCustomerAppraise tbCustomerAppraise)
    {
        return tbCustomerAppraiseMapper.selectTbCustomerAppraiseList(tbCustomerAppraise);
    }

    /**
     * 新增评价;
     *
     * @param tbCustomerAppraise 评价;
     * @return 结果
     */
    @Override
    public int insertTbCustomerAppraise(TbCustomerAppraise tbCustomerAppraise)
    {
        //设置启用状态
        tbCustomerAppraise.setStatus("1");
        //设置创建人
        tbCustomerAppraise.setCreateBy(SecurityUtils.getUsername());
        //设置创建时间
        tbCustomerAppraise.setCreateTime(DateUtils.getNowDate());
        //设置删除标记
        tbCustomerAppraise.setDelFlag("0");
        return tbCustomerAppraiseMapper.insertTbCustomerAppraise(tbCustomerAppraise);
    }

    /**
     * 修改评价;
     *
     * @param tbCustomerAppraise 评价;
     * @return 结果
     */
    @Override
    public int updateTbCustomerAppraise(TbCustomerAppraise tbCustomerAppraise)
    {
        //设置修改人
        tbCustomerAppraise.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        tbCustomerAppraise.setUpdateTime(DateUtils.getNowDate());
        return tbCustomerAppraiseMapper.updateTbCustomerAppraise(tbCustomerAppraise);
    }

    /**
     * 批量删除评价;
     *
     * @param ids 需要删除的评价;主键
     * @return 结果
     */
    @Override
    public int deleteTbCustomerAppraiseByIds(Long[] ids)
    {
        return tbCustomerAppraiseMapper.deleteTbCustomerAppraiseByIds(ids);
    }

    /**
     * 删除评价;信息
     *
     * @param id 评价;主键
     * @return 结果
     */
    @Override
    public int deleteTbCustomerAppraiseById(Long id)
    {
        return tbCustomerAppraiseMapper.deleteTbCustomerAppraiseById(id);
    }


    // TODO ********************************api接口**********************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询评价;列表
     *
     * @return 评价;
     */
    @Override
    @VerifyParam("customerId,orderCode")
    public AjaxResult getTbCustomerAppraiseList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = tbCustomerAppraiseMapper.getTbCustomerAppraiseList(jsonObject);
        for (JSONObject json : jsonObjectList){
        }
        return AjaxResult.success(jsonObjectList);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询评价;
     *
     * @return 评价;
     */
    @Override
    @VerifyParam("id")
    @ResponseParam("id,customerId,subId,level,content,status,createBy,createTime,updateBy,updateTime,remark,delFlag,standby1,standby2,standby3")
    public AjaxResult getTbCustomerAppraise(JSONObject jsonObject)
    {
        JSONObject object = tbCustomerAppraiseMapper.getTbCustomerAppraise(jsonObject);
        return AjaxResult.success(object);
    }


    // TODO 新增*****************************************************************************

    /**
     * 新增评价;
     *
     * @return 结果
     */
    // @Override
    // @VerifyParam("customerId,subId,level,content,orderCode")
    // @Transactional
    // public AjaxResult addTbCustomerAppraise(JSONObject jsonObject)
    // {
    //     //判断是否已评论
    //     /*List<JSONObject> tbCustomerAppraiseList = tbCustomerAppraiseMapper.getTbCustomerAppraiseList(jsonObject);
    //     if (tbCustomerAppraiseList != null && tbCustomerAppraiseList.size()>0){
    //         return AjaxResult.error(MessageUtils.message("appraise.customer.already"));
    //     }*/

    //     //更新被评论人评分
    //     double scope = tbCustomerAppraiseMapper.selectScopeBySubId(jsonObject.getLong("subId"));

    //     ProCustomer proCustomer = new ProCustomer();
    //     proCustomer.setId(jsonObject.getLong("subId"));
    //     proCustomer.setScore(Double.toString(scope));
    //     customerMapper.updateProCustomer(proCustomer);

    //     //修改订单状态
    //     ProOrderInfo proOrderInfo = new ProOrderInfo();
    //     proOrderInfo.setOrderCode(jsonObject.getString("orderCode"));
    //     proOrderInfo.setOrderStatus("4");
    //     orderInfoMapper.updateProOrderInfo(proOrderInfo);

    //     //设置启用状态
    //     jsonObject.put("status","1");
    //     //设置创建时间
    //     jsonObject.put("createTime",DateUtils.getNowDate());
    //     //设置删除标记
    //     jsonObject.put("delFlag","0");
    //     int i = tbCustomerAppraiseMapper.addTbCustomerAppraise(jsonObject);
    //     return i > 0 ? AjaxResult.success() : AjaxResult.error();
    // }
    @Override
    @VerifyParam("customerId,subId,level,content,orderCode")
    @Transactional
    public AjaxResult addTbCustomerAppraise(JSONObject jsonObject) {
        // 判断是否已评论
        /*
        List<JSONObject> tbCustomerAppraiseList = tbCustomerAppraiseMapper.getTbCustomerAppraiseList(jsonObject);
        if (tbCustomerAppraiseList != null && tbCustomerAppraiseList.size() > 0) {
            return AjaxResult.error(MessageUtils.message("appraise.customer.already"));
        }
        */
        // 设置启用状态
        jsonObject.put("status", "1");
        // 设置创建时间
        jsonObject.put("createTime", DateUtils.getNowDate());
        // 设置删除标记
        jsonObject.put("delFlag", "0");

        // 插入新的评价记录
        int result = tbCustomerAppraiseMapper.addTbCustomerAppraise(jsonObject);
        if (result <= 0) {
            return AjaxResult.error();
        }

        // 插入成功后再计算新的评分
        double scope = tbCustomerAppraiseMapper.selectScopeBySubId(jsonObject.getLong("subId"));

        // 更新被评论人评分
        ProCustomer proCustomer = new ProCustomer();
        proCustomer.setId(jsonObject.getLong("subId"));
        proCustomer.setScore(Double.toString(scope));
        customerMapper.updateProCustomer(proCustomer);

        // 修改订单状态
        ProOrderInfo proOrderInfo = new ProOrderInfo();
        proOrderInfo.setOrderCode(jsonObject.getString("orderCode"));
        proOrderInfo.setOrderStatus("4");
        orderInfoMapper.updateProOrderInfoByCode(proOrderInfo);

        return AjaxResult.success();
    }


    // TODO 修改*****************************************************************************

    /**
     * 修改评价;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,customerId,subId,level,content,status,createBy,createTime,updateBy,updateTime,remark,delFlag,standby1,standby2,standby3")
    public AjaxResult editTbCustomerAppraise(JSONObject jsonObject)
    {
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        int i = tbCustomerAppraiseMapper.editTbCustomerAppraise(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量修改评价;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult batchEditTbCustomerAppraise(JSONObject jsonObject)
    {
        //批量删除
        this.batchRemoveTbCustomerAppraise(jsonObject);
        //批量添加
        this.batchAddTbCustomerAppraise(jsonObject);
        return AjaxResult.success();
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除评价;信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult removeTbCustomerAppraise(JSONObject jsonObject)
    {
        int i = tbCustomerAppraiseMapper.removeTbCustomerAppraise(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除评价;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult removeTbCustomerAppraises(JSONObject jsonObject)
    {
        int i = tbCustomerAppraiseMapper.removeTbCustomerAppraises(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 其他*****************************************************************************

    /**
       * 批量删除
       *
       * @return 结果
       */
    public int batchRemoveTbCustomerAppraise(JSONObject jsonObject) {
        return tbCustomerAppraiseMapper.batchRemoveTbCustomerAppraise(jsonObject);
    }

    /**
     * 批量添加
     *
     * @return 结果
     */
    public void batchAddTbCustomerAppraise(JSONObject jsonObject) {

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
            int i = tbCustomerAppraiseMapper.addTbCustomerAppraise(obj);
        }
    }

}
