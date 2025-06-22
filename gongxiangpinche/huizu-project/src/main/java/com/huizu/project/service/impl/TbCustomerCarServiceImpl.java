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
import com.huizu.project.domain.ProCustomer;
import com.huizu.project.mapper.ProCustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.project.mapper.TbCustomerCarMapper;
import com.huizu.project.domain.TbCustomerCar;
import com.huizu.project.service.ITbCustomerCarService;

/**
 * 汽车管理Service业务层处理
 *
 * @author huizu
 * @date 2024-08-12
 */
@Service
public class TbCustomerCarServiceImpl implements ITbCustomerCarService
{
    @Autowired
    private TbCustomerCarMapper tbCustomerCarMapper;
    @Autowired
    private ProCustomerMapper customerMapper;

    /**
     * 查询汽车管理
     *
     * @param id 汽车管理主键
     * @return 汽车管理
     */
    @Override
    public TbCustomerCar selectTbCustomerCarById(Long id)
    {
        return tbCustomerCarMapper.selectTbCustomerCarById(id);
    }
    @Override
    public TbCustomerCar getCarByCustomerId(Long id)
    {
        return tbCustomerCarMapper.selectTbCustomerCarByCustomerId(id);
    }

    /**
     * 查询汽车管理列表
     *
     * @param tbCustomerCar 汽车管理
     * @return 汽车管理
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<TbCustomerCar> selectTbCustomerCarList(TbCustomerCar tbCustomerCar)
    {
        return tbCustomerCarMapper.selectTbCustomerCarList(tbCustomerCar);
    }

    /**
     * 新增汽车管理
     *
     * @param tbCustomerCar 汽车管理
     * @return 结果
     */
    @Override
    public int insertTbCustomerCar(TbCustomerCar tbCustomerCar)
    {
        //设置启用状态
        tbCustomerCar.setStatus("1");
        //设置创建人
        tbCustomerCar.setCreateBy(SecurityUtils.getUsername());
        //设置创建时间
        tbCustomerCar.setCreateTime(DateUtils.getNowDate());
        //设置删除标记
        tbCustomerCar.setDelFlag("0");
        return tbCustomerCarMapper.insertTbCustomerCar(tbCustomerCar);
    }

    /**
     * 修改汽车管理
     *
     * @param tbCustomerCar 汽车管理
     * @return 结果
     */
    @Override
    public int updateTbCustomerCar(TbCustomerCar tbCustomerCar)
    {
        //设置修改人
        tbCustomerCar.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        tbCustomerCar.setUpdateTime(DateUtils.getNowDate());
        return tbCustomerCarMapper.updateTbCustomerCar(tbCustomerCar);
    }

    /**
     * 批量删除汽车管理
     *
     * @param ids 需要删除的汽车管理主键
     * @return 结果
     */
    @Override
    public int deleteTbCustomerCarByIds(Long[] ids)
    {
        return tbCustomerCarMapper.deleteTbCustomerCarByIds(ids);
    }

    /**
     * 删除汽车管理信息
     *
     * @param id 汽车管理主键
     * @return 结果
     */
    @Override
    public int deleteTbCustomerCarById(Long id)
    {
        return tbCustomerCarMapper.deleteTbCustomerCarById(id);
    }


    // TODO ********************************api接口**********************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询汽车管理列表
     *
     * @return 汽车管理
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getTbCustomerCarList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = tbCustomerCarMapper.getTbCustomerCarList(jsonObject);
        for (JSONObject json : jsonObjectList){
            json.put("gasoline",DictUtils.getDictLabel("tb_car_gasoline",json.getString("gasoline")));
            json.put("carCc",DictUtils.getDictLabel("car_cc",json.getString("carCc")));
            json.put("total",DictUtils.getDictLabel("tb_car_total",json.getString("total")));
            json.put("isEtc",DictUtils.getDictLabel("yes_no",json.getString("isEtc")));
            json.put("isNavigation",DictUtils.getDictLabel("yes_no",json.getString("isNavigation")));
            json.put("status",DictUtils.getDictLabel("sys_open_status",json.getString("status")));
        }
        return AjaxResult.success(jsonObjectList);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询汽车管理
     *
     * @return 汽车管理
     */
    @Override
    @VerifyParam("customerId")
    @ResponseParam("id,info,gasoline,carCc,total,isEtc")
    public AjaxResult getTbCustomerCar(JSONObject jsonObject)
    {
        JSONObject object = tbCustomerCarMapper.getTbCustomerCar(jsonObject);
        return AjaxResult.success(object);
    }


    // TODO 新增*****************************************************************************

    /**
     * 新增汽车管理
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult addTbCustomerCar(JSONObject jsonObject)
    {
        //判断是否添加完汽车
        TbCustomerCar tbCustomerCar = new TbCustomerCar();
        tbCustomerCar.setCustomerId(jsonObject.getInteger("customerId"));
        List<TbCustomerCar> tbCustomerCars = tbCustomerCarMapper.selectTbCustomerCarList(tbCustomerCar);
        if (tbCustomerCars != null && tbCustomerCars.size() > 0){
            return AjaxResult.error("追加完了ですので重複しないでください");
        }

        //修改用户信息
        ProCustomer proCustomer = customerMapper.selectProCustomerById(jsonObject.getLong("customerId"));
        if (proCustomer != null){
            proCustomer.setIsDriver("1");
            customerMapper.updateProCustomer(proCustomer);
        }

        //设置启用状态
        jsonObject.put("status","1");
        //设置创建时间
        jsonObject.put("createTime",DateUtils.getNowDate());
        //设置删除标记
        jsonObject.put("delFlag","0");
        int i = tbCustomerCarMapper.addTbCustomerCar(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改汽车管理
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult editTbCustomerCar(JSONObject jsonObject)
    {
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        int i = tbCustomerCarMapper.editTbCustomerCar(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量修改汽车管理
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult batchEditTbCustomerCar(JSONObject jsonObject)
    {
        //批量删除
        this.batchRemoveTbCustomerCar(jsonObject);
        //批量添加
        this.batchAddTbCustomerCar(jsonObject);
        return AjaxResult.success();
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除汽车管理信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult removeTbCustomerCar(JSONObject jsonObject)
    {
        int i = tbCustomerCarMapper.removeTbCustomerCar(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除汽车管理
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult removeTbCustomerCars(JSONObject jsonObject)
    {
        int i = tbCustomerCarMapper.removeTbCustomerCars(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 其他*****************************************************************************

    /**
       * 批量删除
       *
       * @return 结果
       */
    public int batchRemoveTbCustomerCar(JSONObject jsonObject) {
        return tbCustomerCarMapper.batchRemoveTbCustomerCar(jsonObject);
    }

    /**
     * 批量添加
     *
     * @return 结果
     */
    public void batchAddTbCustomerCar(JSONObject jsonObject) {

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
            int i = tbCustomerCarMapper.addTbCustomerCar(obj);
        }
    }

}
