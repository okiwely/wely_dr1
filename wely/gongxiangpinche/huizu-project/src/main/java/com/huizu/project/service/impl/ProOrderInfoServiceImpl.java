package com.huizu.project.service.impl;

import java.math.BigDecimal;
import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.annotation.ResponseParam;
import com.huizu.common.annotation.VerifyParam;
import com.huizu.common.utils.*;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.common.annotation.DataScope;
import com.huizu.project.domain.ProCustomer;
import com.huizu.project.domain.TbCustomerRoute;
import com.huizu.project.fincode.FincodeService;
import com.huizu.project.mapper.ProCustomerMapper;
import com.huizu.project.mapper.TbCustomerRouteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.project.mapper.ProOrderInfoMapper;
import com.huizu.project.domain.ProOrderInfo;
import com.huizu.project.service.IProOrderInfoService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 订单信息Service业务层处理
 *
 * @author huizu
 * @date 2024-08-26
 */
@Service
public class ProOrderInfoServiceImpl implements IProOrderInfoService
{
    @Autowired
    private ProOrderInfoMapper proOrderInfoMapper;
    @Autowired
    private TbCustomerRouteMapper routeMapper;
    @Autowired
    private ProCustomerCardServiceImpl cardService;
    @Autowired
    private FincodeService fincodeService;
    @Autowired
    private ProCustomerMapper customerMapper;

    /**
     * 查询订单信息
     *
     * @param id 订单信息主键
     * @return 订单信息
     */
    @Override
    public ProOrderInfo selectProOrderInfoById(Integer id)
    {
        return proOrderInfoMapper.selectProOrderInfoById(id);
    }

    /**
     * 查询订单信息列表
     *
     * @param proOrderInfo 订单信息
     * @return 订单信息
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<ProOrderInfo> selectProOrderInfoList(ProOrderInfo proOrderInfo)
    {
        return proOrderInfoMapper.selectProOrderInfoList(proOrderInfo);
    }

    /**
     * 新增订单信息
     *
     * @param proOrderInfo 订单信息
     * @return 结果
     */
    @Override
    public int insertProOrderInfo(ProOrderInfo proOrderInfo)
    {
        //设置创建时间
        proOrderInfo.setCreateTime(DateUtils.getNowDate());
        //设置删除标记
        proOrderInfo.setDelFlag(0);
        return proOrderInfoMapper.insertProOrderInfo(proOrderInfo);
    }

    /**
     * 修改订单信息
     *
     * @param proOrderInfo 订单信息
     * @return 结果
     */
    @Override
    public int updateProOrderInfo(ProOrderInfo proOrderInfo)
    {
        return proOrderInfoMapper.updateProOrderInfo(proOrderInfo);
    }

    /**
     * 批量删除订单信息
     *
     * @param ids 需要删除的订单信息主键
     * @return 结果
     */
    @Override
    public int deleteProOrderInfoByIds(Integer[] ids)
    {
        return proOrderInfoMapper.deleteProOrderInfoByIds(ids);
    }

    /**
     * 删除订单信息信息
     *
     * @param id 订单信息主键
     * @return 结果
     */
    @Override
    public int deleteProOrderInfoById(Integer id)
    {
        return proOrderInfoMapper.deleteProOrderInfoById(id);
    }


    // TODO ********************************api接口**********************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询订单信息列表
     *
     * @return 订单信息
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getProOrderInfoList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = proOrderInfoMapper.getProOrderInfoList(jsonObject);
        for (JSONObject json : jsonObjectList){
        }
        return AjaxResult.success(jsonObjectList);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询订单信息
     *
     * @return 订单信息
     */
    @Override
    @VerifyParam("id")
    @ResponseParam("id,customerId,driverId,routeId,orderType,orderCode,totalNum,totalPrice,discountPrice,actualPrice,bondPrice,couponId,integral,freight,packageId,sendTime,sendCnt,people,phone,address,payType,payTime,pushPeople,orderStatus,takeType,storehouse,startAddress,endAddress,startTime,endTime,createTime,delFlag")
    public AjaxResult getProOrderInfo(JSONObject jsonObject)
    {
        JSONObject object = proOrderInfoMapper.getProOrderInfo(jsonObject);
        return AjaxResult.success(object);
    }

    // TODO 新增*****************************************************************************

    /**
     * 新增订单信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId,routeId")
    @ResponseParam("id,customerId,routeId,actualPrice,orderCode,orderStatus,startTime,endTime,startAddress,endAddress,createTime")
    @Transactional
    public AjaxResult addProOrderInfo(JSONObject jsonObject)
    {
        //判断是否已添加订单
        List<JSONObject> proOrderInfoList = proOrderInfoMapper.getProOrderInfoList(jsonObject);
        if (proOrderInfoList != null && proOrderInfoList.size() > 0){
            return AjaxResult.error(MessageUtils.message("order.already"));
        }

        //获取当前拼车人数+1
        TbCustomerRoute route = routeMapper.selectTbCustomerRouteById(jsonObject.getLong("routeId"));
        if (route.getAlreadyTotal().equals(route.getTotal())){
            return AjaxResult.error(MessageUtils.message("order.number.full"));
        }

        //修改行程乘坐人数
        route.setAlreadyTotal(route.getAlreadyTotal() + 1);
        routeMapper.updateTbCustomerRoute(route);
        routeMapper.updateTbCustomerRouteSub(route);

        //计算拼车价格
        BigDecimal price = route.getPrice().divide(new BigDecimal(route.getAlreadyTotal()),0,BigDecimal.ROUND_UP);
        jsonObject.put("actualPrice", price);//实付金额

        //修改该拼车所有订单价格
        proOrderInfoMapper.editOrderPriceByRouteId(jsonObject);

        String orderCode = System.currentTimeMillis() + "";
        jsonObject.put("orderCode", orderCode);
        jsonObject.put("orderStatus", 1);
        jsonObject.put("startTime", route.getStartTime());
        jsonObject.put("endTime", route.getEndTime());
        jsonObject.put("startAddress", route.getStartAddress());
        jsonObject.put("endAddress", route.getEndAddress());
        jsonObject.put("driverId", route.getCustomerId());//司机id
        //设置创建时间
        jsonObject.put("createTime",DateUtils.getNowDate());
        //设置删除标记
        jsonObject.put("delFlag","0");
        int i = proOrderInfoMapper.addProOrderInfo(jsonObject);
        return i > 0 ? AjaxResult.success(jsonObject) : AjaxResult.error(MessageUtils.message("order.number.fail"));
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改订单信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,customerId,driverId,routeId,orderType,orderCode,totalNum,totalPrice,discountPrice,actualPrice,bondPrice,couponId,integral,freight,packageId,sendTime,sendCnt,people,phone,address,payType,payTime,pushPeople,orderStatus,takeType,storehouse,startAddress,endAddress,startTime,endTime,createTime,delFlag")
    public AjaxResult editProOrderInfo(JSONObject jsonObject)
    {
        int i = proOrderInfoMapper.editProOrderInfo(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    public static void main(String[] args) {
        BigDecimal bigDecimal = new BigDecimal(102.22);
        System.err.println(bigDecimal.setScale(0, BigDecimal.ROUND_HALF_UP));
    }
    /**
     * 支付订单
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("orderCode,customerId,cardNo,securityCode,expire,name,token")
    @Transactional
    public AjaxResult payOrder(JSONObject jsonObject)
    {
        ProOrderInfo proOrderInfo = proOrderInfoMapper.selectProOrderInfoByCode(jsonObject.getString("orderCode"));
        //添加信息卡信息
        cardService.addProCustomerCard(jsonObject);
        System.err.println(jsonObject.getString("token"));
        //注册支付
        Boolean b = fincodeService.payCardPayment(proOrderInfo.getOrderCode(),
                proOrderInfo.getActualPrice().setScale(0, BigDecimal.ROUND_HALF_UP).toString(),
                jsonObject.getString("token"));
        if (!b){
            return AjaxResult.error(MessageUtils.message("order.fail"));
        }

        //修改订单状态
        proOrderInfo.setOrderStatus("3");
        proOrderInfo.setPayTime(DateUtils.getNowDate());
        proOrderInfo.setPayType("1");
        proOrderInfoMapper.updateProOrderInfoByCode(proOrderInfo);

        //修改司机余额
        Integer driverId = proOrderInfo.getDriverId();
        ProCustomer proCustomer = customerMapper.selectProCustomerById(Long.valueOf(driverId));
        proCustomer.setMoney(proCustomer.getMoney().add(proOrderInfo.getActualPrice()));
        customerMapper.updateProCustomer(proCustomer);

        return AjaxResult.success(MessageUtils.message("order.success"));
    }

    /**
     * 批量修改订单信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult batchEditProOrderInfo(JSONObject jsonObject)
    {
        //批量删除
        this.batchRemoveProOrderInfo(jsonObject);
        //批量添加
        this.batchAddProOrderInfo(jsonObject);
        return AjaxResult.success();
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除订单信息信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult removeProOrderInfo(JSONObject jsonObject)
    {
        int i = proOrderInfoMapper.removeProOrderInfo(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除订单信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult removeProOrderInfos(JSONObject jsonObject)
    {
        int i = proOrderInfoMapper.removeProOrderInfos(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 其他*****************************************************************************

    /**
       * 批量删除
       *
       * @return 结果
       */
    public int batchRemoveProOrderInfo(JSONObject jsonObject) {
        return proOrderInfoMapper.batchRemoveProOrderInfo(jsonObject);
    }

    /**
     * 批量添加
     *
     * @return 结果
     */
    public void batchAddProOrderInfo(JSONObject jsonObject) {

        Long id = jsonObject.getLong("customerId");
        List<JSONObject> list = jsonObject.getList("list", JSONObject.class);

        for(JSONObject obj : list) {
            obj.put("customerId",id);
            //设置创建时间
            obj.put("createTime",DateUtils.getNowDate());
            //设置删除标记
            obj.put("delFlag","0");
            int i = proOrderInfoMapper.addProOrderInfo(obj);
        }
    }

}
