package com.huizu.project.service.impl;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.common.annotation.ResponseParam;
import com.huizu.common.annotation.VerifyParam;
import com.huizu.common.utils.DictUtils;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.common.annotation.DataScope;
import com.huizu.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.project.mapper.TbDivisionMapper;
import com.huizu.project.domain.TbDivision;
import com.huizu.project.service.ITbDivisionService;

/**
 * 行政区划Service业务层处理
 *
 * @author huizu
 * @date 2024-08-14
 */
@Service
public class TbDivisionServiceImpl implements ITbDivisionService
{
    @Autowired
    private TbDivisionMapper tbDivisionMapper;

    /**
     * 查询行政区划
     *
     * @param id 行政区划主键
     * @return 行政区划
     */
    @Override
    public TbDivision selectTbDivisionById(Long id)
    {
        return tbDivisionMapper.selectTbDivisionById(id);
    }

    /**
     * 查询行政区划列表
     *
     * @param tbDivision 行政区划
     * @return 行政区划
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<TbDivision> selectTbDivisionList(TbDivision tbDivision)
    {
        return tbDivisionMapper.selectTbDivisionList(tbDivision);
    }

    /**
     * 新增行政区划
     *
     * @param tbDivision 行政区划
     * @return 结果
     */
    @Override
    public int insertTbDivision(TbDivision tbDivision)
    {
        return tbDivisionMapper.insertTbDivision(tbDivision);
    }

    /**
     * 修改行政区划
     *
     * @param tbDivision 行政区划
     * @return 结果
     */
    @Override
    public int updateTbDivision(TbDivision tbDivision)
    {
        return tbDivisionMapper.updateTbDivision(tbDivision);
    }

    /**
     * 批量删除行政区划
     *
     * @param ids 需要删除的行政区划主键
     * @return 结果
     */
    @Override
    public int deleteTbDivisionByIds(Long[] ids)
    {
        return tbDivisionMapper.deleteTbDivisionByIds(ids);
    }

    /**
     * 删除行政区划信息
     *
     * @param id 行政区划主键
     * @return 结果
     */
    @Override
    public int deleteTbDivisionById(Long id)
    {
        return tbDivisionMapper.deleteTbDivisionById(id);
    }


    // TODO ********************************api接口**********************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询行政区划列表
     *
     * @return 行政区划
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getTbDivisionList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = tbDivisionMapper.getTbDivisionList(jsonObject);
        for (JSONObject json : jsonObjectList){
            json.put("isMain",DictUtils.getDictLabel("yes_no",json.getString("isMain")));
        }
        return AjaxResult.success(jsonObjectList);
    }
    @Override
    public AjaxResult getCityList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = tbDivisionMapper.getCityList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }
    @Override
    public AjaxResult getAreaList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = tbDivisionMapper.getAreaList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询行政区划
     *
     * @return 行政区划
     */
    @Override
    @VerifyParam("id")
    @ResponseParam("id,code,city,area,isMain")
    public AjaxResult getTbDivision(JSONObject jsonObject)
    {
        JSONObject object = tbDivisionMapper.getTbDivision(jsonObject);
        return AjaxResult.success(object);
    }


    // TODO 新增*****************************************************************************

    /**
     * 新增行政区划
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,code,city,area,isMain")
    public AjaxResult addTbDivision(JSONObject jsonObject)
    {
        int i = tbDivisionMapper.addTbDivision(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改行政区划
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,code,city,area,isMain")
    public AjaxResult editTbDivision(JSONObject jsonObject)
    {
        int i = tbDivisionMapper.editTbDivision(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量修改行政区划
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult batchEditTbDivision(JSONObject jsonObject)
    {
        //批量删除
        this.batchRemoveTbDivision(jsonObject);
        //批量添加
        this.batchAddTbDivision(jsonObject);
        return AjaxResult.success();
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除行政区划信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult removeTbDivision(JSONObject jsonObject)
    {
        int i = tbDivisionMapper.removeTbDivision(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除行政区划
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult removeTbDivisions(JSONObject jsonObject)
    {
        int i = tbDivisionMapper.removeTbDivisions(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 其他*****************************************************************************

    /**
       * 批量删除
       *
       * @return 结果
       */
    public int batchRemoveTbDivision(JSONObject jsonObject) {
        return tbDivisionMapper.batchRemoveTbDivision(jsonObject);
    }

    /**
     * 批量添加
     *
     * @return 结果
     */
    public void batchAddTbDivision(JSONObject jsonObject) {

        Long id = jsonObject.getLong("customerId");
        List<JSONObject> list = jsonObject.getList("list", JSONObject.class);

        for(JSONObject obj : list) {
            obj.put("customerId",id);
            int i = tbDivisionMapper.addTbDivision(obj);
        }
    }

}
