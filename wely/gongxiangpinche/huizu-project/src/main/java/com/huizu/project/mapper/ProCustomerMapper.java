package com.huizu.project.mapper;

import java.util.List;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.project.domain.ProCustomer;

/**
 * 会员信息Mapper接口
 *
 * @author huizu
 * @date 2024-08-12
 */
public interface ProCustomerMapper
{
    /**
     * 查询会员信息
     *
     * @param id 会员信息主键
     * @return 会员信息
     */
    ProCustomer selectProCustomerById(Long id);

    /**
     * 查询会员信息列表
     *
     * @param proCustomer 会员信息
     * @return 会员信息集合
     */
    List<ProCustomer> selectProCustomerList(ProCustomer proCustomer);

    /**
     * 新增会员信息
     *
     * @param proCustomer 会员信息
     * @return 结果
     */
    int insertProCustomer(ProCustomer proCustomer);

    /**
     * 修改会员信息
     *
     * @param proCustomer 会员信息
     * @return 结果
     */
    int updateProCustomer(ProCustomer proCustomer);

    /**
     * 删除会员信息
     *
     * @param id 会员信息主键
     * @return 结果
     */
    int deleteProCustomerById(Long id);

    /**
     * 批量删除会员信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteProCustomerByIds(Long[] ids);


    /*
{
    "id": "",
    "type": "",
    "avatar": "",
    "name": "",
    "nickName": "",
    "jimName": "",
    "sex": "",
    "age": "",
    "workingAge": "",
    "height": "",
    "weight": "",
    "email": "",
    "bank": "",
    "number": "",
    "phone": "",
    "password": "",
    "score": "",
    "carTotal": "",
    "rate": "",
    "onLineTime": "",
    "loginDate": "",
    "province": "",
    "provinceCode": "",
    "city": "",
    "cityCode": "",
    "area": "",
    "areaCode": "",
    "address": "",
    "lonLat": "",
    "currentAddress": "",
    "content": "",
    "code": "",
    "openId": "",
    "qrcode": "",
    "proCode": "",
    "upId": "",
    "money": "",
    "integral": "",
    "startTime": "",
    "endTime": "",
    "openFlag": "",
    "watchFlag": "",
    "pushUrl": "",
    "bond": "",
    "bondFlag": "",
    "contractFlag": "",
    "bondFile": "",
    "isAuth": "",
    "isDriver": "",
    "drivingLicense": "",
    "insurance": "",
    "insuranceCertificate": "",
    "status": "",
    "createBy": "",
    "createTime": "",
    "updateBy": "",
    "updateTime": "",
    "remark": "",
    "delFlag": ""
}
     */


    // TODO *************************************api接口*****************************************************************

    // TODO 列表*****************************************************************************

    /**
     * 查询会员信息列表
     *
     * @return 会员信息集合
     */
    List<JSONObject> getProCustomerList(JSONObject jsonObject);

    // TODO 详情*****************************************************************************

    /**
     * 查询会员信息
     *
     * @return 会员信息
     */
    JSONObject getProCustomer(JSONObject jsonObject);
    JSONObject getProCustomer1(JSONObject jsonObject);

    // TODO 新增*****************************************************************************

    /**
     * 新增会员信息
     *
     * @return 结果
     */
    int addProCustomer(JSONObject jsonObject);

    // TODO 修改*****************************************************************************

    /**
     * 修改会员信息
     *
     * @return 结果
     */
    int editProCustomer(JSONObject jsonObject);

    // TODO 删除*****************************************************************************

    /**
     * 批量删除会员信息
     *
     * @return 结果
     */
    int removeProCustomers(JSONObject jsonObject);

    /**
     * 删除会员信息
     *
     * @return 结果
     */
    int removeProCustomer(JSONObject jsonObject);

    // TODO 其他*****************************************************************************

    /**
     * 批量删除
     *
     * @return 结果
     */
    int batchRemoveProCustomer(JSONObject jsonObject);
}
