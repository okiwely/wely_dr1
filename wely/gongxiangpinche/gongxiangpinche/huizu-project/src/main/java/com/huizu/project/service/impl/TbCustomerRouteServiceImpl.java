package com.huizu.project.service.impl;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
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
import com.huizu.project.domain.ProCustomer;
import com.huizu.project.domain.TbCustomerCar;
import com.huizu.project.domain.TbRouteDetail;
import com.huizu.project.mapper.ProCustomerMapper;
import com.huizu.project.mapper.TbCustomerCarMapper;
import com.huizu.project.mapper.TbRouteDetailMapper;
import com.huizu.project.utils.RouteCalculator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.project.mapper.TbCustomerRouteMapper;
import com.huizu.project.domain.TbCustomerRoute;
import com.huizu.project.service.ITbCustomerRouteService;

/**
 * 行程管理;Service业务层处理
 *
 * @author huizu
 * @date 2024-08-12
 */
@Service
public class TbCustomerRouteServiceImpl implements ITbCustomerRouteService
{
    @Autowired
    private TbCustomerRouteMapper tbCustomerRouteMapper;
    @Autowired
    private ProCustomerMapper customerMapper;
    @Autowired
    private TbCustomerCarMapper customerCarMapper;
    @Autowired
    private TbRouteDetailMapper routeDetailMapper;

    /**
     * 查询行程管理;
     *
     * @param id 行程管理;主键
     * @return 行程管理;
     */
    @Override
    public TbCustomerRoute selectTbCustomerRouteById(Long id)
    {
        return tbCustomerRouteMapper.selectTbCustomerRouteById(id);
    }

    /**
     * 查询行程管理;列表
     *
     * @param tbCustomerRoute 行程管理;
     * @return 行程管理;
     */
    @Override
//    @DataScope(userAlias = "a",deptAlias = "a")
    public List<TbCustomerRoute> selectTbCustomerRouteList(TbCustomerRoute tbCustomerRoute)
    {
        return tbCustomerRouteMapper.selectTbCustomerRouteList(tbCustomerRoute);
    }
    public List<TbCustomerRoute> selectTbCustomerRouteList1(TbCustomerRoute tbCustomerRoute)
    {
        return tbCustomerRouteMapper.selectTbCustomerRouteList1(tbCustomerRoute);
    }

    /**
     * 新增行程管理;
     *
     * @param tbCustomerRoute 行程管理;
     * @return 结果
     */
    @Override
    public int insertTbCustomerRoute(TbCustomerRoute tbCustomerRoute)
    {
        tbCustomerRoute.setStatus("1");
        tbCustomerRoute.setCreateTime(DateUtils.getNowDate());
        tbCustomerRoute.setDelFlag("0");
        return tbCustomerRouteMapper.insertTbCustomerRoute(tbCustomerRoute);
    }

    /**
     * 修改行程管理;
     *
     * @param tbCustomerRoute 行程管理;
     * @return 结果
     */
    @Override
    public int updateTbCustomerRoute(TbCustomerRoute tbCustomerRoute)
    {
        //设置修改人
        tbCustomerRoute.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        tbCustomerRoute.setUpdateTime(DateUtils.getNowDate());
        return tbCustomerRouteMapper.updateTbCustomerRoute(tbCustomerRoute);
    }

    /**
     * 批量删除行程管理;
     *
     * @param ids 需要删除的行程管理;主键
     * @return 结果
     */
    @Override
    public int deleteTbCustomerRouteByIds(Long[] ids)
    {
        return tbCustomerRouteMapper.deleteTbCustomerRouteByIds(ids);
    }

    /**
     * 删除行程管理;信息
     *
     * @param id 行程管理;主键
     * @return 结果
     */
    @Override
    public int deleteTbCustomerRouteById(Long id)
    {
        return tbCustomerRouteMapper.deleteTbCustomerRouteById(id);
    }


    // TODO ********************************api接口**********************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询行程管理;列表
     *
     * @return 行程管理;
     */
    @Override
    public List<JSONObject> getTbCustomerRouteListS(JSONObject jsonObject)
    {
        if (jsonObject == null){
            jsonObject = new JSONObject();
        }
        jsonObject.put("type",2);
        jsonObject.put("state",1);
        List<JSONObject> jsonObjectList = tbCustomerRouteMapper.getTbCustomerRouteList(jsonObject);

        return jsonObjectList;
    }
    @Override
    public AjaxResult getTbCustomerRouteListU(JSONObject jsonObject)
    {
        if (jsonObject == null){
            jsonObject = new JSONObject();
        }
        jsonObject.put("type",1);
        jsonObject.put("state",1);
        List<JSONObject> jsonObjectList = tbCustomerRouteMapper.getTbCustomerRouteList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }
    @Override
    @VerifyParam("customerId")
    public AjaxResult getTbCustomerRouteListNow(JSONObject jsonObject)
    {
        jsonObject.put("state",1);
        List<JSONObject> jsonObjectList = tbCustomerRouteMapper.getTbCustomerRouteListNow(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }
    @Override
    @VerifyParam("customerId")
    public AjaxResult getTbCustomerRouteListOld(JSONObject jsonObject)
    {
        jsonObject.put("state",1);
        List<JSONObject> jsonObjectList = tbCustomerRouteMapper.getTbCustomerRouteListOld(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询行程管理;
     *
     * @return 行程管理;
     */
    @Override
    @VerifyParam("routeId")
    @ResponseParam("id,startTime,endTime,startAddress,endAddress,startLonLat,endLonLat,attention,createTime,price,total,alreadyTotal,customerId,avatar,name,content,isAuth,car,details")
    public AjaxResult getTbCustomerRouteS(JSONObject jsonObject)
    {
        JSONObject object = tbCustomerRouteMapper.getTbCustomerRoute(jsonObject);
        //查询汽车信息
        JSONObject json = customerCarMapper.getTbCustomerCar1(object);
        if (json != null){
            json.put("gasoline",DictUtils.getDictLabel("tb_car_gasoline",json.getString("gasoline")));
            json.put("carCc",DictUtils.getDictLabel("car_cc",json.getString("carCc")));
            json.put("total",DictUtils.getDictLabel("tb_car_total",json.getString("total")));
            json.put("isEtc",DictUtils.getDictLabel("yes_no",json.getString("isEtc")));
        }
        //查询价格明细
        List<JSONObject> tbRouteDetail1 = routeDetailMapper.getTbRouteDetail1(jsonObject);
        if (tbRouteDetail1 != null && tbRouteDetail1.size()>0){
            object.put("details",tbRouteDetail1);
        }

        object.put("car",json);
        return AjaxResult.success(object);
    }
    @Override
    @VerifyParam("routeId")
    @ResponseParam("id,startTime,endTime,startAddress,endAddress,startLonLat,endLonLat,customerId,avatar,name,content,isAuth")
    public AjaxResult getTbCustomerRouteU(JSONObject jsonObject)
    {
        JSONObject object = tbCustomerRouteMapper.getTbCustomerRoute(jsonObject);
        return AjaxResult.success(object);
    }
    @Override
    @VerifyParam("routeId")
    @ResponseParam("id,state,startTime,startAddress,endAddress,startLonLat,endLonLat,price,attention,comment")
    public AjaxResult getTbCustomerRoute(JSONObject jsonObject)
    {
        JSONObject object = tbCustomerRouteMapper.getTbCustomerRoute(jsonObject);
        return AjaxResult.success(object);
    }
    @Override
    @VerifyParam("customerId")
    @ResponseParam("id,state,startTime,startAddress,endAddress,startLonLat,endLonLat,price,attention,comment")
    public AjaxResult getLastRoute(JSONObject jsonObject)
    {
        JSONObject object = tbCustomerRouteMapper.getLastRoute(jsonObject);
        return AjaxResult.success(object);
    }


    // TODO 新增*****************************************************************************


    public static void main(String[] args) {
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("time","2024-09-21 00:00");
        jsonObject.put("time1","2024-10-04 07:23");
        Date time = jsonObject.getDate("time1");
        System.err.println(time);
    }
    /**
     * 新增行程管理;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult addTbCustomerRoute(JSONObject jsonObject)
    {

        String type = jsonObject.getString("type");

        //设置启用状态
        jsonObject.put("status","1");
        //设置创建时间
        jsonObject.put("createTime",DateUtils.getNowDate());
        //设置删除标记
        jsonObject.put("delFlag","0");

        //获取距离，通行费用，时长
        String startLonLat = jsonObject.getString("startLonLat");
        String endLonLat = jsonObject.getString("endLonLat");
        JSONObject route = RouteCalculator.getRoute(startLonLat, endLonLat);
        BigDecimal duration = route.getBigDecimal("duration");

        //设置预计到达时间
        Date startTime = jsonObject.getDate("startTime");

        //设置司机相关参数
        if ("2".equals(type)){
            TbCustomerCar car = customerCarMapper.selectTbCustomerCarByCustomerId(jsonObject.getLong("customerId"));
            if (car == null){
                return AjaxResult.error("車両情報の充実をお願いします");
            }
            //设置司机相关参数
            jsonObject.put("model",car.getInfo());
            jsonObject.put("total",car.getTotal());
            jsonObject.put("alreadyTotal",0);
            int row = tbCustomerRouteMapper.addTbCustomerRoute(jsonObject);

            BigDecimal price = jsonObject.getBigDecimal("price");
            //添加价格明细
            if (car.getTotal() != null && Integer.valueOf(car.getTotal()) > 0){
                for (int i = 0; i < Integer.valueOf(car.getTotal()); i++) {
                    TbRouteDetail tbRouteDetail = new TbRouteDetail();
                    tbRouteDetail.setRouteId(jsonObject.getInteger("id"));
                    tbRouteDetail.setTotal(i + 1 + "");
                    tbRouteDetail.setPrice(price.divide(new BigDecimal(i+1),0,BigDecimal.ROUND_UP).setScale(0,BigDecimal.ROUND_UP).toString());
                    tbRouteDetail.setStatus("1");
                    tbRouteDetail.setDelFlag("0");
                    tbRouteDetail.setCreateTime(DateUtils.getNowDate());
                    routeDetailMapper.insertTbRouteDetail(tbRouteDetail);
                }
            }
            return row > 0 ? AjaxResult.success() : AjaxResult.error();
        }else {
            int row = tbCustomerRouteMapper.addTbCustomerRoute(jsonObject);
            return row > 0 ? AjaxResult.success() : AjaxResult.error();
        }
    }
    @Override
    @VerifyParam("customerId")
    public AjaxResult calculatePrice(JSONObject jsonObject)
    {
        //获取距离，通行费用，时长
        String startLonLat = jsonObject.getString("startLonLat");
        String endLonLat = jsonObject.getString("endLonLat");
        JSONObject route = RouteCalculator.getRoute(startLonLat, endLonLat);
        BigDecimal cost = route.getBigDecimal("cost");
        BigDecimal distance = route.getBigDecimal("distance");

        //设置司机相关参数
            TbCustomerCar car = customerCarMapper.selectTbCustomerCarByCustomerId(jsonObject.getLong("customerId"));
            if (car == null){
                return AjaxResult.error("車両情報の充実をお願いします");
            }
            //设置司机相关参数
            if (car != null && startLonLat != null && endLonLat != null){
                //计算价格
                BigDecimal km = distance;//100公里
                BigDecimal oilLoss = new BigDecimal(1);//油耗
                BigDecimal oilPrice = new BigDecimal(0);//油价

                //排气量
                String carCc = car.getCarCc();
                //判断是否拥堵（油耗）
                //早高峰7:00-9:00、
                //晚高峰17:00-19:00
                String startTime1 = "07:00:00";
                String endTime1 = "09:00:00";
                String startTime2 = "17:00:00";
                String endTime2 = "19:00:00";
                String nowTime = DateUtils.parseDateToStr("HH:mm:ss" , new Date());
                if ((nowTime.compareTo(startTime1) > 0 && nowTime.compareTo(endTime1) < 0)
                || (nowTime.compareTo(startTime2) > 0 && nowTime.compareTo(endTime2) < 0)){
                    //高峰期
                    if ("1".equals(carCc)){
                        //轻型车
                        oilLoss = new BigDecimal(20);
                    }else if ("2".equals(carCc)){
                        //1300cc
                        oilLoss = new BigDecimal(14);
                    }else if ("3".equals(carCc)){
                        //1600cc
                        oilLoss = new BigDecimal(13.5);
                    }else if ("4".equals(carCc)){
                        //1800cc
                        oilLoss = new BigDecimal(12.5);
                    }else if ("5".equals(carCc)){
                        //2000cc
                        oilLoss = new BigDecimal(11);
                    }else if ("6".equals(carCc)){
                        //2499cc
                        oilLoss = new BigDecimal(10.5);
                    }else if ("7".equals(carCc)){
                        //2500cc
                        oilLoss = new BigDecimal(11);
                    }
                }else {
                    //非高峰期
                    if ("1".equals(carCc)){
                        //轻型车
                        oilLoss = new BigDecimal(15);
                    }else if ("2".equals(carCc)){
                        //1300cc
                        oilLoss = new BigDecimal(10);
                    }else if ("3".equals(carCc)){
                        //1600cc
                        oilLoss = new BigDecimal(10);
                    }else if ("4".equals(carCc)){
                        //1800cc
                        oilLoss = new BigDecimal(10);
                    }else if ("5".equals(carCc)){
                        //2000cc
                        oilLoss = new BigDecimal(8);
                    }else if ("6".equals(carCc)){
                        //2499cc
                        oilLoss = new BigDecimal(10);
                    }else if ("7".equals(carCc)){
                        //2500cc
                        oilLoss = new BigDecimal(8);
                    }
                }

                //判断汽油型号（油价）
                String gasoline = car.getGasoline();
                if ("1".equals(gasoline)){
                    oilPrice = new BigDecimal(170);
                }else if ("2".equals(gasoline)){
                    oilPrice = new BigDecimal(184.5);
                }

                //etc，高速费
                BigDecimal freeway = new BigDecimal(0);//高速费
                String isEtc = car.getIsEtc();
                if ("1".equals(isEtc)){
                    freeway = cost;
                }

                //添加20%手续费，最终价格
                BigDecimal price = km.divide(oilLoss,0,BigDecimal.ROUND_UP)
                                    .multiply(oilPrice)
                                    .add(freeway)
                                    .multiply(new BigDecimal(1.2));

                jsonObject.put("price",price.setScale(0,BigDecimal.ROUND_UP));
        }
        return AjaxResult.success(jsonObject);
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改行程管理;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("routeId")
    public AjaxResult editTbCustomerRoute(JSONObject jsonObject)
    {
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        int i = tbCustomerRouteMapper.editTbCustomerRoute(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量修改行程管理;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult batchEditTbCustomerRoute(JSONObject jsonObject)
    {
        //批量删除
        this.batchRemoveTbCustomerRoute(jsonObject);
        //批量添加
        this.batchAddTbCustomerRoute(jsonObject);
        return AjaxResult.success();
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除行程管理;信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("routeId")
    public AjaxResult removeTbCustomerRoute(JSONObject jsonObject)
    {
        int i = tbCustomerRouteMapper.removeTbCustomerRoute(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除行程管理;
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult removeTbCustomerRoutes(JSONObject jsonObject)
    {
        int i = tbCustomerRouteMapper.removeTbCustomerRoutes(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 其他*****************************************************************************

    /**
       * 批量删除
       *
       * @return 结果
       */
    public int batchRemoveTbCustomerRoute(JSONObject jsonObject) {
        return tbCustomerRouteMapper.batchRemoveTbCustomerRoute(jsonObject);
    }

    /**
     * 批量添加
     *
     * @return 结果
     */
    public void batchAddTbCustomerRoute(JSONObject jsonObject) {

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
            int i = tbCustomerRouteMapper.addTbCustomerRoute(obj);
        }
    }

}
