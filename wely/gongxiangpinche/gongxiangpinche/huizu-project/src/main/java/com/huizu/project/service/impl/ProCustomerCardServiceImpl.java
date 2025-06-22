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
import com.huizu.project.mapper.ProCustomerCardMapper;
import com.huizu.project.domain.ProCustomerCard;
import com.huizu.project.service.IProCustomerCardService;

/**
 * 信用卡管理Service业务层处理
 *
 * @author huizu
 * @date 2024-09-20
 */
@Service
public class ProCustomerCardServiceImpl implements IProCustomerCardService
{
    @Autowired
    private ProCustomerCardMapper proCustomerCardMapper;

    /**
     * 查询信用卡管理
     *
     * @param id 信用卡管理主键
     * @return 信用卡管理
     */
    @Override
    public ProCustomerCard selectProCustomerCardById(Integer id)
    {
        return proCustomerCardMapper.selectProCustomerCardById(id);
    }

    /**
     * 查询信用卡管理列表
     *
     * @param proCustomerCard 信用卡管理
     * @return 信用卡管理
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<ProCustomerCard> selectProCustomerCardList(ProCustomerCard proCustomerCard)
    {
        return proCustomerCardMapper.selectProCustomerCardList(proCustomerCard);
    }

    /**
     * 新增信用卡管理
     *
     * @param proCustomerCard 信用卡管理
     * @return 结果
     */
    @Override
    public int insertProCustomerCard(ProCustomerCard proCustomerCard)
    {
        //设置启用状态
        proCustomerCard.setStatus("1");
        //设置创建人
        proCustomerCard.setCreateBy(SecurityUtils.getUsername());
        //设置创建时间
        proCustomerCard.setCreateTime(DateUtils.getNowDate());
        //设置删除标记
        proCustomerCard.setDelFlag("0");
        return proCustomerCardMapper.insertProCustomerCard(proCustomerCard);
    }

    /**
     * 修改信用卡管理
     *
     * @param proCustomerCard 信用卡管理
     * @return 结果
     */
    @Override
    public int updateProCustomerCard(ProCustomerCard proCustomerCard)
    {
        //设置修改人
        proCustomerCard.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        proCustomerCard.setUpdateTime(DateUtils.getNowDate());
        return proCustomerCardMapper.updateProCustomerCard(proCustomerCard);
    }

    /**
     * 批量删除信用卡管理
     *
     * @param ids 需要删除的信用卡管理主键
     * @return 结果
     */
    @Override
    public int deleteProCustomerCardByIds(Integer[] ids)
    {
        return proCustomerCardMapper.deleteProCustomerCardByIds(ids);
    }

    /**
     * 删除信用卡管理信息
     *
     * @param id 信用卡管理主键
     * @return 结果
     */
    @Override
    public int deleteProCustomerCardById(Integer id)
    {
        return proCustomerCardMapper.deleteProCustomerCardById(id);
    }


    // TODO ********************************api接口**********************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询信用卡管理列表
     *
     * @return 信用卡管理
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getProCustomerCardList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = proCustomerCardMapper.getProCustomerCardList(jsonObject);
        for (JSONObject json : jsonObjectList){
            json.put("isDefault",DictUtils.getDictLabel("yes_no",json.getString("isDefault")));
        }
        return AjaxResult.success(jsonObjectList);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询信用卡管理
     *
     * @return 信用卡管理
     */
    @Override
    @VerifyParam("customerId")
    @ResponseParam("id,name,cardNo,securityCode,expire,isDefault")
    public AjaxResult getProCustomerCard(JSONObject jsonObject)
    {
        JSONObject object = proCustomerCardMapper.getProCustomerCard(jsonObject);
        return AjaxResult.success(object);
    }


    // TODO 新增*****************************************************************************

    /**
     * 新增信用卡管理
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId,cardNo,securityCode,expire,name")
    public AjaxResult addProCustomerCard(JSONObject jsonObject)
    {

        proCustomerCardMapper.editProCustomerCardNotDefault(jsonObject);

        jsonObject.put("isDefault","1");
        //设置启用状态
        jsonObject.put("status","1");
        //设置创建时间
        jsonObject.put("createTime",DateUtils.getNowDate());
        //设置删除标记
        jsonObject.put("delFlag","0");
        int i = proCustomerCardMapper.addProCustomerCard(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改信用卡管理
     *
     * @return 结果
     */
    @Override
    @VerifyParam("cardId,cardNo,securityCode,expire,name")
    public AjaxResult editProCustomerCard(JSONObject jsonObject)
    {
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        int i = proCustomerCardMapper.editProCustomerCard(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量修改信用卡管理
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult batchEditProCustomerCard(JSONObject jsonObject)
    {
        //批量删除
        this.batchRemoveProCustomerCard(jsonObject);
        //批量添加
        this.batchAddProCustomerCard(jsonObject);
        return AjaxResult.success();
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除信用卡管理信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult removeProCustomerCard(JSONObject jsonObject)
    {
        int i = proCustomerCardMapper.removeProCustomerCard(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除信用卡管理
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult removeProCustomerCards(JSONObject jsonObject)
    {
        int i = proCustomerCardMapper.removeProCustomerCards(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 其他*****************************************************************************

    /**
       * 批量删除
       *
       * @return 结果
       */
    public int batchRemoveProCustomerCard(JSONObject jsonObject) {
        return proCustomerCardMapper.batchRemoveProCustomerCard(jsonObject);
    }

    /**
     * 批量添加
     *
     * @return 结果
     */
    public void batchAddProCustomerCard(JSONObject jsonObject) {

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
            int i = proCustomerCardMapper.addProCustomerCard(obj);
        }
    }

}
