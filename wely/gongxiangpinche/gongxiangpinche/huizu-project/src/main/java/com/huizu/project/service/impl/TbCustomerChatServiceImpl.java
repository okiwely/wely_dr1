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
import com.huizu.project.domain.TbCustomerRoute;
import com.huizu.project.mapper.TbCustomerRouteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.project.mapper.TbCustomerChatMapper;
import com.huizu.project.domain.TbCustomerChat;
import com.huizu.project.service.ITbCustomerChatService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 聊天信息Service业务层处理
 *
 * @author huizu
 * @date 2024-08-12
 */
@Service
public class TbCustomerChatServiceImpl implements ITbCustomerChatService
{
    @Autowired
    private TbCustomerChatMapper tbCustomerChatMapper;
    @Autowired
    private TbCustomerRouteMapper routeMapper;
    @Autowired
    private ProOrderInfoServiceImpl orderInfoService;

    /**
     * 查询聊天信息
     *
     * @param id 聊天信息主键
     * @return 聊天信息
     */
    @Override
    public TbCustomerChat selectTbCustomerChatById(Long id)
    {
        return tbCustomerChatMapper.selectTbCustomerChatById(id);
    }

    /**
     * 查询聊天信息列表
     *
     * @param tbCustomerChat 聊天信息
     * @return 聊天信息
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<TbCustomerChat> selectTbCustomerChatList(TbCustomerChat tbCustomerChat)
    {
        return tbCustomerChatMapper.selectTbCustomerChatList(tbCustomerChat);
    }

    /**
     * 新增聊天信息
     *
     * @param tbCustomerChat 聊天信息
     * @return 结果
     */
    @Override
    public int insertTbCustomerChat(TbCustomerChat tbCustomerChat)
    {
        //设置启用状态
        tbCustomerChat.setStatus("1");
        //设置创建人
        tbCustomerChat.setCreateBy(SecurityUtils.getUsername());
        //设置创建时间
        tbCustomerChat.setCreateTime(DateUtils.getNowDate());
        //设置删除标记
        tbCustomerChat.setDelFlag("0");
        return tbCustomerChatMapper.insertTbCustomerChat(tbCustomerChat);
    }

    /**
     * 修改聊天信息
     *
     * @param tbCustomerChat 聊天信息
     * @return 结果
     */
    @Override
    public int updateTbCustomerChat(TbCustomerChat tbCustomerChat)
    {
        //设置修改人
        tbCustomerChat.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        tbCustomerChat.setUpdateTime(DateUtils.getNowDate());
        return tbCustomerChatMapper.updateTbCustomerChat(tbCustomerChat);
    }

    /**
     * 批量删除聊天信息
     *
     * @param ids 需要删除的聊天信息主键
     * @return 结果
     */
    @Override
    public int deleteTbCustomerChatByIds(Long[] ids)
    {
        return tbCustomerChatMapper.deleteTbCustomerChatByIds(ids);
    }

    /**
     * 删除聊天信息信息
     *
     * @param id 聊天信息主键
     * @return 结果
     */
    @Override
    public int deleteTbCustomerChatById(Long id)
    {
        return tbCustomerChatMapper.deleteTbCustomerChatById(id);
    }


    // TODO ********************************api接口**********************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询聊天信息列表
     *
     * @return 聊天信息
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getTbCustomerChatList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = tbCustomerChatMapper.getTbCustomerChatList(jsonObject);
//        for (JSONObject json : jsonObjectList){
//            json.put("status",DictUtils.getDictLabel("sys_open_status",json.getString("status")));
//        }
        return AjaxResult.success(jsonObjectList);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询聊天信息
     *
     * @return 聊天信息
     */
    @Override
    @VerifyParam("id")
    @ResponseParam("id,customerId,subId,content,status,createBy,createTime,updateBy,updateTime,remark,delFlag,standby1,standby2,standby3")
    public AjaxResult getTbCustomerChat(JSONObject jsonObject)
    {
        JSONObject object = tbCustomerChatMapper.getTbCustomerChat(jsonObject);
        return AjaxResult.success(object);
    }


    // TODO 新增*****************************************************************************

    /**
     * 新增聊天信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId,subId")
    public AjaxResult addTbCustomerChat(JSONObject jsonObject)
    {
        Integer customerId = jsonObject.getInteger("customerId");
        Integer subId = jsonObject.getInteger("subId");
        String routeId = jsonObject.getString("routeId");
        TbCustomerChat tbCustomerChat = new TbCustomerChat();
        tbCustomerChat.setCustomerId(customerId);
        tbCustomerChat.setSubId(subId);
        tbCustomerChat.setStandby1(routeId);
        List<TbCustomerChat> tbCustomerChats = tbCustomerChatMapper.selectTbCustomerChatList(tbCustomerChat);
        if(tbCustomerChats != null  && tbCustomerChats.size()>0){
            return AjaxResult.error(MessageUtils.message("chat.customer.already"));
        }

        jsonObject.put("standby1",routeId);
        jsonObject.put("standby2","1");
        jsonObject.put("content", MessageUtils.message("chat.customer.send"));
        //设置启用状态
        jsonObject.put("status","1");
        //设置创建时间
        jsonObject.put("createTime",DateUtils.getNowDate());
        //设置删除标记
        jsonObject.put("delFlag","0");
        int i = tbCustomerChatMapper.addTbCustomerChat(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }
    @Override
    @VerifyParam("chatId")
    @Transactional
    public AjaxResult consentRoute(JSONObject jsonObject)
    {
        TbCustomerChat chat = tbCustomerChatMapper.selectTbCustomerChatById(jsonObject.getLong("chatId"));
        chat.setStandby2("0");
        tbCustomerChatMapper.updateTbCustomerChat(chat);


        //生成用户支付订单，拼车人数+1
        JSONObject order = new JSONObject();
        order.put("customerId",chat.getCustomerId());
        order.put("routeId",chat.getStandby1());
        AjaxResult result = orderInfoService.addProOrderInfo(order);
        System.err.println(result);
        if (result.isError()){
            return result;
        }
        JSONObject object = (JSONObject) result.get("data");

        //生成用户拼车成功数据
        TbCustomerRoute tbCustomerRoute = routeMapper.selectTbCustomerRouteById(Long.valueOf(chat.getStandby1()));
        tbCustomerRoute.setCustomerId(chat.getCustomerId());
        tbCustomerRoute.setType("1");
        tbCustomerRoute.setStandby1(object.getString("orderCode"));
        tbCustomerRoute.setCreateTime(DateUtils.getNowDate());
        routeMapper.insertTbCustomerRoute(tbCustomerRoute);

        //给用户发送同意消息
        TbCustomerChat tbCustomerChat = new TbCustomerChat();
        tbCustomerChat.setCustomerId(chat.getSubId());
        tbCustomerChat.setSubId(chat.getCustomerId());
        tbCustomerChat.setContent(MessageUtils.message("chat.customer.consent"));
//        tbCustomerChat.setStandby1(chat.getStandby1());
        tbCustomerChat.setStatus("1");
        tbCustomerChat.setCreateTime(DateUtils.getNowDate());
        tbCustomerChat.setDelFlag("0");
        tbCustomerChatMapper.insertTbCustomerChat(tbCustomerChat);

        return AjaxResult.success();
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改聊天信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id,customerId,subId,content,status,createBy,createTime,updateBy,updateTime,remark,delFlag,standby1,standby2,standby3")
    public AjaxResult editTbCustomerChat(JSONObject jsonObject)
    {
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        int i = tbCustomerChatMapper.editTbCustomerChat(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量修改聊天信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult batchEditTbCustomerChat(JSONObject jsonObject)
    {
        //批量删除
        this.batchRemoveTbCustomerChat(jsonObject);
        //批量添加
        this.batchAddTbCustomerChat(jsonObject);
        return AjaxResult.success();
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除聊天信息信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult removeTbCustomerChat(JSONObject jsonObject)
    {
        int i = tbCustomerChatMapper.removeTbCustomerChat(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除聊天信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult removeTbCustomerChats(JSONObject jsonObject)
    {
        int i = tbCustomerChatMapper.removeTbCustomerChats(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 其他*****************************************************************************

    /**
       * 批量删除
       *
       * @return 结果
       */
    public int batchRemoveTbCustomerChat(JSONObject jsonObject) {
        return tbCustomerChatMapper.batchRemoveTbCustomerChat(jsonObject);
    }

    /**
     * 批量添加
     *
     * @return 结果
     */
    public void batchAddTbCustomerChat(JSONObject jsonObject) {

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
            int i = tbCustomerChatMapper.addTbCustomerChat(obj);
        }
    }

}
