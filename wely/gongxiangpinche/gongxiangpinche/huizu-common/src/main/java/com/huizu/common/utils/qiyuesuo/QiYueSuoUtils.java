package com.huizu.common.utils.qiyuesuo;

import com.alibaba.fastjson2.JSONObject;
import com.qiyuesuo.sdk.v2.SdkClient;
import com.qiyuesuo.sdk.v2.bean.*;
import com.qiyuesuo.sdk.v2.exception.BaseSdkException;
import com.qiyuesuo.sdk.v2.json.JSONUtils;
import com.qiyuesuo.sdk.v2.param.SignParam;
import com.qiyuesuo.sdk.v2.request.*;
import com.qiyuesuo.sdk.v2.response.ContractPageResult;
import com.qiyuesuo.sdk.v2.response.DocumentAddResult;
import com.qiyuesuo.sdk.v2.response.MiniappTicketResult;
import com.qiyuesuo.sdk.v2.response.SdkResponse;
import com.qiyuesuo.sdk.v2.utils.CollectionUtils;
import com.qiyuesuo.sdk.v2.utils.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.*;

public class QiYueSuoUtils {
    private static final String ACCESSKEY = "RE3baxBXPp";
    private static final String ACCESSSECRET = "XCioPX95ifcQh0acNWAOrzWcxt2g5s";
    private static final String SERVERURL = "https://openapi.qiyuesuo.com";
    private static final Logger logger = LoggerFactory.getLogger(QiYueSuoUtils.class);

    /**
     * 初始化sdk
     *
     * @return
     */
    private static SdkClient initSdk() {
        return new SdkClient(SERVERURL, ACCESSKEY, ACCESSSECRET);
    }

    /**
     * 浏览合同
     *
     * @param contractId
     * @return
     */
    public static String viewurl(Long contractId, String cTenantName) {
        SdkClient sdkClient = initSdk();
        ContractViewPageRequest request = new ContractViewPageRequest(contractId);
        request.setTenantName(cTenantName);
        String response = sdkClient.service(request);
        SdkResponse<ContractPageResult> responseObj = JSONUtils.toQysResponse(response, ContractPageResult.class);
        if (responseObj.getCode() == 0) {
            ContractPageResult result = responseObj.getResult();
            return result.getPageUrl();
        }
        return null;
    }

    /**
     * 下载合同
     *
     * @param documentId 合同文档ID
     */
    public static void downloadHt(Long documentId, String url) {
        SdkClient sdkClient = initSdk();
        DocumentDownloadRequest request = new DocumentDownloadRequest(documentId);
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(url);
        } catch (FileNotFoundException e) {
            logger.error(e.getMessage());
        }
        sdkClient.download(request, fos);
        IOUtils.safeClose(fos);
    }

    /*public static void main(String[] args) {
        downloadHt(3174722945079640567L, "F:/www/SpringBootProjects/zulin/doc.pdf");
    }*/

    /**
     * 作废合同
     *
     * @param contractId
     * @param reason
     * @return
     */
    public static String invalidHt(Long contractId, String reason) {
        SdkClient sdkClient = initSdk();
        ContractInvalidRequest request = new ContractInvalidRequest(contractId, null, reason, false);
        String response = sdkClient.service(request);
        SdkResponse responseObj = JSONUtils.toQysResponse(response);
        if (responseObj.getCode() == 0) {
            return "success";
        }
        return responseObj.getMessage();
    }

    /**
     * 生成合同签署令牌
     *
     * @param contractId 合同ID
     * @param phone      联系人手机号
     */
    public static Map<String, String> appletsTicket(Long contractId, String phone) {
        SdkClient sdkClient = initSdk();
        ContractMiniappTicketRequest request = new ContractMiniappTicketRequest(contractId, new User(phone, "MOBILE"));
        String response = null;
        try {
            response = sdkClient.service(request);
        } catch (Exception e) {
            throw new BaseSdkException("调用接口错误，错误原因：" + e.getMessage());
        }
        SdkResponse<MiniappTicketResult> result = JSONUtils.toQysResponse(response, MiniappTicketResult.class);
        Map<String, String> resMap = new HashMap<>();
        if (!result.getCode().equals(0)) {
            resMap.put("code", "error");
            resMap.put("data", result.getMessage());
            return resMap;
        }
        resMap.put("code", "success");
        resMap.put("data", result.getResult().getTicket());
        return resMap;
    }

    /**
     * 签署合同
     *
     * @param contractId 合同ID
     */
    public static String pageUrl(Long contractId, String staffPhone, String cTenantName) {
        SdkClient sdkClient = initSdk();
        ContractPageRequest request = new ContractPageRequest(contractId, new User(staffPhone, "MOBILE"), "");
        request.setTenantName(cTenantName);
        String response = sdkClient.service(request);
        SdkResponse<ContractPageResult> responseObj = JSONUtils.toQysResponse(response, ContractPageResult.class);
        if (responseObj.getCode() == 0) {
            ContractPageResult result = responseObj.getResult();
            return result.getPageUrl();
        }
        return null;
    }

    /**
     * 签署公章
     *
     * @param contractId 合同ID
     * @param sealId     印章编号
     */
    public static String companySign(Long contractId, Long sealId, String cTenantName, Long documentId) {
        SdkClient sdkClient = initSdk();
        SignParam param = new SignParam();
        param.setContractId(contractId);
        param.setSealId(sealId);
        param.setTenantName(cTenantName);
        List<Stamper> stampers = new ArrayList<>();
        Stamper stamper = new Stamper();
        stamper.setType("COMPANY");
        stamper.setDocumentId(documentId);
        stamper.setPage(-1);
        stamper.setOffsetX(0.5);
        stamper.setOffsetY(0.2);
        stamper.setWidth(40);
        stamper.setHeight(10);
        stampers.add(stamper);
        param.setStampers(stampers);
        System.err.println(JSONObject.toJSONString(param));
        ContractSignCompanyRequest request = new ContractSignCompanyRequest(param);
        logger.info("companySign request:" + JSONUtils.toJson(request));
        String response = sdkClient.service(request);
        SdkResponse<Object> responseObj = JSONUtils.toQysResponse(response);
        logger.info("responseObj:" + JSONUtils.toJson(responseObj));
        if (responseObj.getCode() == 0) {
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 发起合同
     *
     * @param contractId  合同ID
     * @param actionId    发起方ID
     * @param signatoryId 接收方ID
     * @param documentId  合同文档ID
     */
    public static String sendHt(Long contractId, Long actionId, Long signatoryId, Long documentId, String cTenantName, int pageNum, List<Stamper> stampers) {
        SdkClient sdkClient = initSdk();
        ContractSendRequest request = new ContractSendRequest(contractId, stampers);
        request.setTenantName(cTenantName);
        logger.info("sendHt request:" + JSONUtils.toJson(request));
        String response = sdkClient.service(request);
        SdkResponse<Object> responseObj = JSONUtils.toQysResponse(response);
        if (responseObj.getCode() == 0) {
            return "success";
        } else {
            return responseObj.getMessage();
        }
    }

    /**
     * 用模板添加合同文档
     *
     * @param contractId 合同ID
     * @param templateId 模板ID
     */
    public static Long insertHtTemplate(Long contractId, Long templateId, List<TemplateParam> params, String cTenantName) {
        SdkClient sdkClient = initSdk();
        DocumentAddByTemplateRequest request = new DocumentAddByTemplateRequest(contractId, templateId, params, "合同");
        request.setTenantName(cTenantName);
        logger.info("insertHtTemplate request:" + JSONUtils.toJson(request));
        String response = sdkClient.service(request);
        SdkResponse<DocumentAddResult> responseObj = JSONUtils.toQysResponse(response, DocumentAddResult.class);
        if (responseObj.getCode() == 0) {
            DocumentAddResult result = responseObj.getResult();
            return result.getDocumentId();
        } else {
            logger.info("请求失败，错误码:{}，错误信息:{}", responseObj.getCode(), responseObj.getMessage());
        }
        return null;
    }

    /**
     * 创建合同草稿
     *
     * @param subject    合同名称
     * @param tenantName 个人姓名
     * @param contact    个人电话
     */
    public static Map<String, Object> creatHtDraft(String subject, String tenantName, String contact, String category, String cTenantName, String frName, String frPhone) {
        SdkClient sdkClient = initSdk();
        Contract contract = new Contract();
        contract.setSubject(subject);
        contract.setCategory(new Category(category));
        contract.setBizId("");
        contract.setSend(false);
        contract.setTenantName(cTenantName);

        // 个人
        Signatory signatory1 = new Signatory();
        signatory1.setTenantName(tenantName);
        signatory1.setTenantType("PERSONAL");
        signatory1.setReceiver(new User(tenantName, contact, "MOBILE"));
        signatory1.setSerialNo(2);
        // 企业
        Signatory signatory2 = new Signatory();
        signatory2.setTenantName(cTenantName);
        signatory2.setTenantType("COMPANY");
        signatory2.setReceiver(new User(frName, frPhone, "MOBILE"));
        signatory2.setSerialNo(1);
        Action action = new Action("COMPANY", 1);
        signatory2.addAction(action);
        // 设置签署方
        contract.addSignatory(signatory2);
        contract.addSignatory(signatory1);
        // 创建合同
        ContractDraftRequest request = new ContractDraftRequest(contract);
        logger.info("creatHtDraft request:" + JSONUtils.toJson(request));
        String response = sdkClient.service(request);
        SdkResponse<Contract> responseObj = JSONUtils.toQysResponse(response, Contract.class);
        logger.info("creatHtDraft responseObj:" + JSONUtils.toJson(responseObj));
        // 返回结果
        if (responseObj.getCode() == 0) {
            Map<String, Object> resMap = new HashMap<>();
            Contract result = responseObj.getResult();
            resMap.put("contractId", result.getId());
            List<Signatory> signatories = result.getSignatories();// 签署方；签署合同的公司/个人
            if (!CollectionUtils.isEmpty(signatories)) {
                for (Signatory entity : signatories) {
                    resMap.put("signatoryid", entity.getId());
                    List<Action> actions = entity.getActions();// 签署动作（签署流程）
                    if (!CollectionUtils.isEmpty(actions)) {
                        for (Action actionEntity : actions) {
                            resMap.put("actionId", actionEntity.getId());//签署节点ID（接口返回值）
                        }
                    }
                    // 个人接收方姓名
                    if (tenantName.equals(entity.getTenantName())) {// 签署方名称
                        resMap.put("jfSignatoryId", entity.getId());// 签署方ID（接口返回值）
                        if (!CollectionUtils.isEmpty(actions)) {
                            for (Action actionEntity : actions) {
                                resMap.put("jfActionId", actionEntity.getId());// 签署节点ID（接口返回值）
                            }
                        }
                    }
                    // 对接方
                    if (cTenantName.equals(entity.getTenantName())) {// 签署方名称
                        resMap.put("yfSignatoryId", entity.getId());// 签署方ID（接口返回值）
                        if (!CollectionUtils.isEmpty(actions)) {
                            for (Action actionEntity : actions) {
                                resMap.put("yfActionId", actionEntity.getId());// 签署节点ID（接口返回值）
                            }
                        }
                    }
                    resMap.put("bfSignatoryId", entity.getId());
                    if (!CollectionUtils.isEmpty(actions)) {
                        for (Action actionEntity : actions) {
                            resMap.put("bfActionId", actionEntity.getId());
                        }
                    }
                }
            }
            resMap.put("code", 0);
            return resMap;
        } else {
            Map<String, Object> resMap = new HashMap<>();
            resMap.put("msg", responseObj.getMessage());
            resMap.put("code", 1);
            return resMap;
        }
    }

    /**
     * 撤回/作废合同
     *
     * @param contractId 合同ID
     * @param sealId     印章ID，发起方签署作废文件时指定的印章，作废合同时使用。若发起方已签署，不传默认取发起方印章ID
     * @param reason     撤回/作废原因
     * @param autoSign   发起作废时是否自动签署作废文件，默认true
     */
    public static String contractInvalid(String contractId, String sealId, String reason, Boolean autoSign) {
        SdkClient sdkClient = initSdk();// 初始化sdkClient
        ContractInvalidRequest request = new ContractInvalidRequest(Long.parseLong(contractId), Long.parseLong(sealId), reason, false);// "已完成"状态下请求作废合同
        request.setAutoSign(autoSign);
        String response = sdkClient.service(request);
        SdkResponse responseObj = JSONUtils.toQysResponse(response);
        if (responseObj.getCode() == 0) {
            return "success";
        } else {
            return responseObj.getMessage();
        }
    }

    /**
     * 合同延期
     * 调用此接口来将合同进行延期签署，仅对“签署中”、“已过期”状态的合同有效。
     *
     * @param contractId 合同ID
     * @param days       延期天数
     */
    public static void contractDelay(String contractId, Integer days) {
        SdkClient sdkClient = initSdk();// 初始化sdkClient
        ContractDelayRequest request = new ContractDelayRequest();
        request.setContractId(Long.parseLong(contractId));
        request.setDays(days);
        String response = sdkClient.service(request);
        SdkResponse responseObject = JSONUtils.toQysResponse(response);
        if (responseObject.getCode().equals(0)) {
            logger.info("合同延期成功,等待参与方签署！");
        } else {
            logger.info("合同延期成功，失败原因：{}", responseObject.getMessage());
        }
    }

    public static Date addYearOfDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.YEAR, 1);
        return calendar.getTime();
    }

    public static Date addMonthOfDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, 3);
        return calendar.getTime();
    }

    // 定义数字对应的大写汉字
    private static final String[] CN_UPPER_NUMBER = {"零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"};
    // 定义单位
    private static final String[] CN_UPPER_UNIT = {"", "拾", "佰", "仟", "万", "拾", "佰", "仟", "亿"};

    // 自定义方法，将金额转换为大写汉字
    public static String convertToChinese(double amount) {
        StringBuilder sb = new StringBuilder();
        // 转换为字符串
        String amountStr = String.valueOf(amount);
        // 截取整数部分
        String integerPart = amountStr.split("\\.")[0];
        // 截取小数部分
        String decimalPart = amountStr.split("\\.")[1];
        // 转换整数部分
        int len = integerPart.length();
        for (int i = 0; i < len; i++) {
            int num = Character.getNumericValue(integerPart.charAt(i));
            sb.append(CN_UPPER_NUMBER[num]);
            sb.append(CN_UPPER_UNIT[len - 1 - i]);
        }
        // 转换小数部分
        sb.append("元");
        len = decimalPart.length();
        for (int i = 0; i < len; i++) {
            int num = Character.getNumericValue(decimalPart.charAt(i));
            sb.append(CN_UPPER_NUMBER[num]);
        }
        sb.append("角");
        if (decimalPart.equals("0")) {
            sb.append("整");
        } else {
            sb.append("分");
        }
        return sb.toString();
    }

}
