package com.huizu.project.service.impl;

import java.io.File;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.api.utils.ApiUtils;
import com.huizu.common.aliyun.AliyunFileUtils;
import com.huizu.common.annotation.ResponseParam;
import com.huizu.common.annotation.VerifyParam;
import com.huizu.common.config.HuiZuConfig;
import com.huizu.common.core.redis.RedisCache;
import com.huizu.common.message.SecurityUtil;
import com.huizu.common.message.SendSmsUtil;
import com.huizu.common.utils.*;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.common.annotation.VerifyParam;
import com.huizu.common.annotation.DataScope;
import com.huizu.common.utils.pay.alipay.AlipayUtils;
import com.huizu.project.domain.TbCustomerChat;
import com.huizu.project.mapper.ProCustomerCardMapper;
import com.huizu.project.mapper.TbCustomerAppraiseMapper;
import com.huizu.project.mapper.TbCustomerChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.project.mapper.ProCustomerMapper;
import com.huizu.project.domain.ProCustomer;
import com.huizu.project.service.IProCustomerService;

/**
 * 会员信息Service业务层处理
 *
 * @author huizu
 * @date 2024-08-12
 */
@Service
public class ProCustomerServiceImpl implements IProCustomerService
{
    @Autowired
    private ProCustomerMapper proCustomerMapper;
    @Autowired
    private TbCustomerAppraiseMapper appraiseMapper;
    @Autowired
    protected RedisCache redis;
    @Autowired
    protected ProCustomerCardMapper customerCardMapper;
    @Autowired
    private TbCustomerChatMapper tbCustomerChatMapper;
    /**
     * 查询会员信息
     *
     * @param id 会员信息主键
     * @return 会员信息
     */
    @Override
    public ProCustomer selectProCustomerById(Long id)
    {
        return proCustomerMapper.selectProCustomerById(id);
    }

    /**
     * 查询会员信息列表
     *
     * @param proCustomer 会员信息
     * @return 会员信息
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<ProCustomer> selectProCustomerList(ProCustomer proCustomer)
    {
        return proCustomerMapper.selectProCustomerList(proCustomer);
    }

    /**
     * 新增会员信息
     *
     * @param proCustomer 会员信息
     * @return 结果
     */
    @Override
    public int insertProCustomer(ProCustomer proCustomer)
    {
        //设置启用状态
        proCustomer.setStatus("1");
        //设置创建人
        proCustomer.setCreateBy(SecurityUtils.getUsername());
        //设置创建时间
        proCustomer.setCreateTime(DateUtils.getNowDate());
        //设置删除标记
        proCustomer.setDelFlag("0");
        return proCustomerMapper.insertProCustomer(proCustomer);
    }

    /**
     * 修改会员信息
     *
     * @param proCustomer 会员信息
     * @return 结果
     */
    @Override
    public int updateProCustomer(ProCustomer proCustomer)
    {
        //设置修改人
        proCustomer.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        proCustomer.setUpdateTime(DateUtils.getNowDate());
        return proCustomerMapper.updateProCustomer(proCustomer);
    }
    @Override
    public int customerWithdraw(ProCustomer proCustomer)
    {
        //添加评论
        TbCustomerChat tbCustomerChat = new TbCustomerChat();
        tbCustomerChat.setCustomerId(SecurityUtils.getUserId().intValue());
        tbCustomerChat.setSubId(proCustomer.getId().intValue());
        tbCustomerChat.setContent(MessageUtils.message("chat.customer.withdraw"));
        tbCustomerChat.setStatus("1");
        tbCustomerChat.setCreateTime(DateUtils.getNowDate());
        tbCustomerChat.setDelFlag("0");
        tbCustomerChatMapper.insertTbCustomerChat(tbCustomerChat);

        proCustomer.setIntegral(BigDecimal.ZERO);
        //设置修改人
        proCustomer.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        proCustomer.setUpdateTime(DateUtils.getNowDate());
        return proCustomerMapper.updateProCustomer(proCustomer);
    }
    @Override
    public int auditCustomer(ProCustomer proCustomer)
    {
        //设置修改人
        proCustomer.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        proCustomer.setUpdateTime(DateUtils.getNowDate());
        return proCustomerMapper.updateProCustomer(proCustomer);
    }

    /**
     * 批量删除会员信息
     *
     * @param ids 需要删除的会员信息主键
     * @return 结果
     */
    @Override
    public int deleteProCustomerByIds(Long[] ids)
    {
        return proCustomerMapper.deleteProCustomerByIds(ids);
    }

    /**
     * 删除会员信息信息
     *
     * @param id 会员信息主键
     * @return 结果
     */
    @Override
    public int deleteProCustomerById(Long id)
    {
        return proCustomerMapper.deleteProCustomerById(id);
    }


    // TODO ********************************api接口**********************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询会员信息列表
     *
     * @return 会员信息
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getProCustomerList(JSONObject jsonObject)
    {
        List<JSONObject> jsonObjectList = proCustomerMapper.getProCustomerList(jsonObject);
        for (JSONObject json : jsonObjectList){
            json.put("type",DictUtils.getDictLabel("pro_customer_type",json.getString("type")));
            json.put("sex",DictUtils.getDictLabel("sys_user_sex",json.getString("sex")));
            json.put("bondFlag",DictUtils.getDictLabel("yes_no",json.getString("bondFlag")));
            json.put("contractFlag",DictUtils.getDictLabel("yes_no",json.getString("contractFlag")));
            json.put("isAuth",DictUtils.getDictLabel("yes_no",json.getString("isAuth")));
            json.put("isDriver",DictUtils.getDictLabel("yes_no",json.getString("isDriver")));
            json.put("status",DictUtils.getDictLabel("sys_open_status",json.getString("status")));
        }
        return AjaxResult.success(jsonObjectList);
    }

    // TODO 详情*****************************************************************************

    /**
     * 查询会员信息
     *
     * @return 会员信息
     */
    @Override
    @VerifyParam("customerId")
    @ResponseParam("customerId,avatar,name,sex,phone,score,isAuth,appraiseList,appraise")
    public AjaxResult getProCustomer(JSONObject jsonObject)
    {
        JSONObject object = proCustomerMapper.getProCustomer(jsonObject);
        //查询各评价数量
        List<JSONObject> tbCustomerAppraiseD = appraiseMapper.getTbCustomerAppraiseD(jsonObject);
        JSONObject jsonObject1 = new JSONObject();
        for (int i = 1; i < 6; i++) {
            jsonObject1.put(i + "",0);
        }
        for (JSONObject json : tbCustomerAppraiseD) {
            jsonObject1.put(json.getString("level"),json.getString("count"));
        }

        object.put("appraise",jsonObject1);

        //查询评价列表
        JSONObject object1 = new JSONObject();
        object1.put("subId",jsonObject.getString("customerId"));
        List<JSONObject> tbCustomerAppraiseList = appraiseMapper.getTbCustomerAppraiseList(object1);
        object.put("appraiseList",tbCustomerAppraiseList);

        return AjaxResult.success(object);
    }
    @Override
    @VerifyParam("customerId")
    @ResponseParam("customerId,avatar,name,sex,email,city,area,phone,isAuth,content,drivingLicense,insurance,insuranceCertificate")
    public AjaxResult getProCustomerInfo(JSONObject jsonObject)
    {
        JSONObject object = proCustomerMapper.getProCustomer(jsonObject);
        return AjaxResult.success(object);
    }
    @Override
    @VerifyParam("customerId")
    @ResponseParam("customerId,avatar,name,phone,isAuth,isDriver,money,integral")
    public AjaxResult getCustomerIntroduce(JSONObject jsonObject)
    {
        JSONObject object = proCustomerMapper.getProCustomer(jsonObject);
        return AjaxResult.success(object);
    }
    @Override
    @VerifyParam("email,password")
    @ResponseParam("customerId,avatar,name,sex,email,city,area")
    public AjaxResult login(JSONObject jsonObject)
    {
        String email = jsonObject.getString("email");
        String password = jsonObject.getString("password");
        JSONObject proCustomer = proCustomerMapper.getProCustomer1(jsonObject);
        if (proCustomer != null && StringUtils.isNotBlank(proCustomer.getString("password"))) {
            String pwd = proCustomer.getString("password");
            if (!SecurityUtil.md5enc(password).equals(pwd)) {
                return AjaxResult.error("パスワードの入力が間違っています");
            }
            proCustomer.put("sex",DictUtils.getDictLabel("sys_user_sex",proCustomer.getString("sex")));
            return AjaxResult.success(proCustomer);
        }else {
            return AjaxResult.error("ユーザー情報を照会できませんでした");
        }
    }


    // TODO 新增*****************************************************************************

    /**
     * 新增会员信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId,type,avatar,name,nickName,jimName,sex,age,workingAge,height,weight,email,bank,number,phone,password,score,carTotal,rate,onLineTime,loginDate,province,provinceCode,city,cityCode,area,areaCode,address,lonLat,currentAddress,content,code,openId,qrcode,proCode,upId,money,integral,startTime,endTime,openFlag,watchFlag,pushUrl,bond,bondFlag,contractFlag,bondFile,isAuth,isDriver,drivingLicense,insurance,insuranceCertificate,status,createBy,createTime,updateBy,updateTime,remark,delFlag")
    public AjaxResult addProCustomer(JSONObject jsonObject)
    {
        //设置启用状态
        jsonObject.put("status","1");
        //设置创建时间
        jsonObject.put("createTime",DateUtils.getNowDate());
        //设置删除标记
        jsonObject.put("delFlag","0");
        int i = proCustomerMapper.addProCustomer(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }
    @Override
    @VerifyParam("name,sex,email,password,city,area")
    @ResponseParam("customerId,avatar,name,sex,email,city,area")
    public AjaxResult register(JSONObject jsonObject)
    {

        String email = jsonObject.getString("email");
        String password = jsonObject.getString("password");
        JSONObject object = proCustomerMapper.getProCustomer1(jsonObject);
        if (object != null && StringUtils.isNotBlank(object.getString("email"))) {
            return AjaxResult.error("このユーザーは登録済みです");
        } else {
            jsonObject.put("password", SecurityUtil.md5enc(password));
            jsonObject.put("money", 0);
            jsonObject.put("integral", 0);
            jsonObject.put("status", 1);
            jsonObject.put("openFlag", 0);
            jsonObject.put("type", 1);
            jsonObject.put("score", 0);
            jsonObject.put("isAuth", 0);
            jsonObject.put("isDriver", 0);
            jsonObject.put("avatar",jsonObject.getString("avatar") != null ? jsonObject.getString("avatar") : "https://huizu-oss-demo.oss-cn-beijing.aliyuncs.com/avatar.png");
            jsonObject.put("name",jsonObject.getString("name") != null ? jsonObject.getString("name") : "https://huizu-oss-demo.oss-cn-beijing.aliyuncs.com/avatar.png");

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.add(Calendar.YEAR, 1);
            Date endTime = calendar.getTime();
            jsonObject.put("endTime", endTime);

            jsonObject.put("code", ApiUtils.getCode());
            try {
                String profile = HuiZuConfig.getProfile();
                System.err.println(profile);
//                String path = "/www/SpringBootProjects/kafeizulin/uploadPath";
                String imagePath = AlipayUtils.encode("http://haifenghaofengh5.hflvxingzhe.com?code=" + jsonObject.getString("code"), profile);
                File file = new File(profile + "/" + imagePath);
                jsonObject.put("qrcode", AliyunFileUtils.uploadFile(file, 1));
            } catch (Exception e) {
//                return AjaxResult.error("生成分享码失败");
            }
            jsonObject = ApiUtils.createEntity(jsonObject);
            jsonObject.put("bond", 0);
            jsonObject.put("bondFlag", 0);
            jsonObject.put("contractFlag", 0);
            int cnt = proCustomerMapper.addProCustomer(jsonObject);
            jsonObject.put("customerId",jsonObject.getString("id"));
            return cnt > 0 ? AjaxResult.success(jsonObject) : AjaxResult.error("登録に失敗しました");
        }
    }

    // TODO 修改*****************************************************************************

    /**
     * 修改会员信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult editProCustomer(JSONObject jsonObject)
    {
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        int i = proCustomerMapper.editProCustomer(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }
    @Override
    @VerifyParam("customerId,phone,code")
    public AjaxResult authPhone(JSONObject jsonObject)
    {
        String phone = jsonObject.getString("phone");
        String code = jsonObject.getString("code");
        boolean boo = SendSmsUtil.verifyCode(redis, phone, code);
        if (!boo) {
            return AjaxResult.error("验证码输入有误");
        }
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
//        jsonObject.put("isAuth",1);
        int i = proCustomerMapper.editProCustomer(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }
    @Override
    @VerifyParam("customerId")
    public AjaxResult submitAudit(JSONObject jsonObject)
    {
        //设置修改时间
        jsonObject.put("updateTime",DateUtils.getNowDate());
        jsonObject.put("isAuth",0);
        jsonObject.put("audit",0);
        int i = proCustomerMapper.editProCustomer(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }
    @Override
    @VerifyParam("customerId")
    public AjaxResult withdraw(JSONObject jsonObject)
    {
        //判断是否绑定信用卡
        JSONObject proCustomerCard = customerCardMapper.getProCustomerCard(jsonObject);
        if (proCustomerCard == null || jsonObject.size() <= 0){
            return AjaxResult.error(MessageUtils.message("card.customer.fail"));
        }

        ProCustomer proCustomer = proCustomerMapper.selectProCustomerById(jsonObject.getLong("customerId"));
        proCustomer.setIntegral(proCustomer.getIntegral().add(proCustomer.getMoney()));
        proCustomer.setMoney(BigDecimal.ZERO);
        int i = proCustomerMapper.updateProCustomer(proCustomer);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量修改会员信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult batchEditProCustomer(JSONObject jsonObject)
    {
        //批量删除
        this.batchRemoveProCustomer(jsonObject);
        //批量添加
        this.batchAddProCustomer(jsonObject);
        return AjaxResult.success();
    }

    // TODO 删除*****************************************************************************

    /**
     * 删除会员信息信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("id")
    public AjaxResult removeProCustomer(JSONObject jsonObject)
    {
        int i = proCustomerMapper.removeProCustomer(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 批量删除会员信息
     *
     * @return 结果
     */
    @Override
    @VerifyParam("ids")
    public AjaxResult removeProCustomers(JSONObject jsonObject)
    {
        int i = proCustomerMapper.removeProCustomers(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    // TODO 其他*****************************************************************************

    /**
       * 批量删除
       *
       * @return 结果
       */
    public int batchRemoveProCustomer(JSONObject jsonObject) {
        return proCustomerMapper.batchRemoveProCustomer(jsonObject);
    }

    /**
     * 批量添加
     *
     * @return 结果
     */
    public void batchAddProCustomer(JSONObject jsonObject) {

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
            int i = proCustomerMapper.addProCustomer(obj);
        }
    }

}
