package com.huizu.api.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.huizu.api.domain.JoggleExpress;
import com.huizu.api.entity.Code2sessionResponse;
import com.huizu.api.mapper.ApiMapper;
import com.huizu.api.service.ApiService;
import com.huizu.api.utils.ApiUtils;
import com.huizu.common.aliyun.AliyunFileUtils;
import com.huizu.common.annotation.ResponseParam;
import com.huizu.common.annotation.VerifyParam;
import com.huizu.common.config.HuiZuConfig;
import com.huizu.common.config.WeChatConfig;
import com.huizu.common.constant.CacheConstants;
import com.huizu.common.constant.Constants;
import com.huizu.common.core.domain.AjaxResult;
import com.huizu.common.core.domain.entity.SysDictData;
import com.huizu.common.core.redis.RedisCache;
import com.huizu.common.core.text.Convert;
import com.huizu.common.message.SecurityUtil;
import com.huizu.common.message.SendSmsUtil;
import com.huizu.common.utils.*;
import com.huizu.common.utils.http.HttpUtils;
import com.huizu.common.utils.pay.alipay.AlipayConfig;
import com.huizu.common.utils.pay.alipay.AlipayUtil;
import com.huizu.common.utils.pay.alipay.AlipayUtils;
import com.huizu.common.utils.pay.wxpay.*;
import org.jdom.JDOMException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.List;
import java.util.*;

@Service
public class ApiServiceImpl implements ApiService {
    @Autowired
    protected RedisCache redis;
    @Autowired
    private ApiMapper apiMapper;
    @Autowired
    private WxPayService wxPayService;
    @Autowired
    private CommonServiceImpl commonService;

    // TODO 会员模块

    /**
     * 图片合成
     *
     * @param backgroundPath
     * @param qrCodePath
     * @param outPutPath
     * @return
     */
    public static String overlapImage(String text, String backgroundPath, String qrCodePath, String outPutPath) {
        try {
            BufferedImage background = resizeImage(613, 1076, ImageIO.read(getFile(backgroundPath)));
            BufferedImage qrCode = getOssFile(qrCodePath) == null ? null : resizeImage(150, 150, ImageIO.read(getOssFile(qrCodePath)));
            Graphics2D g = background.createGraphics();
            g.setColor(Color.white);
            Font font = new Font("微软雅黑", Font.BOLD, 16);
            g.setFont(font);
            if (qrCode != null) {
                FontMetrics fm = g.getFontMetrics(font);
                int textWidth = fm.stringWidth(text);
                int widthX = (613 - textWidth) / 2;
                g.drawString(text, widthX, 570);
                g.drawImage(qrCode, 235, 586, qrCode.getWidth(), qrCode.getHeight(), null);
            }
            g.dispose();
            System.out.printf(outPutPath);
            File file = new File(outPutPath);
            ImageIO.write(background, "jpg", file);
            return AliyunFileUtils.uploadFile(file, 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static File getFile(String url) throws Exception {
        String fileName = url.substring(url.lastIndexOf("."));
        File file = null;

        URL urlfile;
        InputStream inStream = null;
        OutputStream os = null;
        try {
            file = File.createTempFile("net_url", fileName);
            urlfile = new URL("file:///" + url);
            inStream = urlfile.openStream();
            os = new FileOutputStream(file);

            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = inStream.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != os) {
                    os.close();
                }
                if (null != inStream) {
                    inStream.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return file;
    }

    private static File getOssFile(String url) throws Exception {
        System.err.println("OSS文件地址：" + url);
        if (StringUtils.isBlank(url)) {
            return null;
        } else {
            String fileName = url.substring(url.lastIndexOf("."));
            File file = null;

            URL urlfile;
            InputStream inStream = null;
            OutputStream os = null;
            try {
                file = File.createTempFile("net_url", fileName);
                urlfile = new URL(url);
                inStream = urlfile.openStream();
                os = new FileOutputStream(file);

                int bytesRead = 0;
                byte[] buffer = new byte[8192];
                while ((bytesRead = inStream.read(buffer, 0, 8192)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (null != os) {
                        os.close();
                    }
                    if (null != inStream) {
                        inStream.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            return file;
        }
    }

    public static BufferedImage resizeImage(int x, int y, BufferedImage bfi) {
        BufferedImage bufferedImage = new BufferedImage(x, y, BufferedImage.TYPE_INT_RGB);
        bufferedImage.getGraphics().drawImage(bfi.getScaledInstance(x, y, Image.SCALE_SMOOTH), 0, 0, null);
        return bufferedImage;
    }

    /**
     * 用户注册
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("type,phone,password,code")
    public AjaxResult register(JSONObject jsonObject) {
        String phone = jsonObject.getString("phone");
        String password = jsonObject.getString("password");
        String code = jsonObject.getString("code");
        boolean boo = SendSmsUtil.verifyCode(redis, phone, code);
        if (!boo) {
            return AjaxResult.error("验证码输入有误");
        }
//        jsonObject.put("type", 1);
        JSONObject object = apiMapper.getCustomerInfoByPhone(phone);
        if (object != null && StringUtils.isNotBlank(object.getString("phone"))) {
            return AjaxResult.error("该用户已注册");
        } else {
            jsonObject.put("password", SecurityUtil.md5enc(password));
            jsonObject.put("money", 0);
            jsonObject.put("integral", 0);
            jsonObject.put("status", 1);
            jsonObject.put("openFlag", 0);

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
                return AjaxResult.error("生成分享码失败");
            }
            jsonObject = ApiUtils.createEntity(jsonObject);
            if (StringUtils.isNotBlank(jsonObject.getString("proCode"))) {
                Long proId = apiMapper.getCustomerIdByCode(jsonObject.getString("proCode"));
                jsonObject.put("upId", proId);
            }
            jsonObject.put("bond", 0);
            jsonObject.put("bondFlag", 0);
            jsonObject.put("contractFlag", 0);
            int cnt = apiMapper.insertCustomer(jsonObject);
            if (cnt > 0) {
                // 注册极光账号
                Long id = jsonObject.getLong("id");
                boolean b = JImUtils.registerUser("kafeizulin-user-" + id, password);
                if (!b) {
                    return AjaxResult.success("注册成功");
                } else {
                    jsonObject = apiMapper.getCustomerInfoById(id);
                    jsonObject.put("id", id);
                    jsonObject.put("jimName", "zulin-user-" + id);
                    jsonObject.put("phone", jsonObject.getString("phone") + "（会员）");
//                        jsonObject.put("adminId", openCloudUser(jsonObject));
                    apiMapper.updateCustomer(jsonObject);
                    // 获取用户信息
                    jsonObject = apiMapper.getCustomerInfoById(id);
                    jsonObject = ApiUtils.stringToArray(jsonObject);
                    return AjaxResult.success(jsonObject);
                }
            }
            return AjaxResult.error("注册失败");
        }
    }

    /**
     * 微信注册
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("openId")
    public AjaxResult wxRegister(JSONObject jsonObject) {
        JSONObject object = apiMapper.getCustomerInfoByOpenId(jsonObject.getString("openId"));
        if (object != null) {
            return AjaxResult.success(object);
        } else {
            jsonObject.put("type", 1);
            String str = Convert.toStr(redis.getCacheObject(CacheConstants.SYS_CONFIG_KEY + "sys.user.initPassword"));
            if (StringUtils.isNotEmpty(str)) {
                jsonObject.put("password", SecurityUtil.md5enc(str));
            }else {
                jsonObject.put("password", SecurityUtil.md5enc("123456"));
            }
            jsonObject.put("status", 1);
            jsonObject.put("code", ApiUtils.getCode());
            jsonObject.put("name", "用户" + jsonObject.getString("code"));
            jsonObject.put("agentType", 0);
            jsonObject.put("money", 0);
            jsonObject.put("integral", 0);
            jsonObject.put("bond", 0);
            jsonObject.put("bondFlag", 0);
            jsonObject.put("contractFlag", 0);
            jsonObject.put("openFlag", 0);
            jsonObject.put("promoterFlag", 0);
            jsonObject.put("upId", jsonObject.getLong("upId") == null ? 0 : jsonObject.getLong("upId"));
            jsonObject = ApiUtils.createEntity(jsonObject);
            int cnt = apiMapper.insertCustomer(jsonObject);
            if (cnt > 0) {
                Long id = jsonObject.getLong("id");
                jsonObject.put("customerId", id);
                jsonObject.put("qrcode", ApiUtils.addQrcode(jsonObject));
                apiMapper.updateCustomer(jsonObject);
                jsonObject = apiMapper.getCustomerInfoById(id);
                return AjaxResult.success(jsonObject);
            }
            return AjaxResult.error("注册失败");
        }
    }

    /**
     * 微信拉取手机号
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("code,iv,encryptedData")
    public AjaxResult wxPhone(JSONObject jsonObject) {
        String encryptedData = jsonObject.getString("encryptedData");
        String iv = jsonObject.getString("iv");
        String code = jsonObject.getString("code");
        Code2sessionResponse code2sessionResponse = ApiUtils.code2sessionForMini(code);
        if (code2sessionResponse == null) {
            return AjaxResult.error("获取授权失败");
        } else {
            String s = encryptedData.replaceAll(" ", "+");
            String s1 = iv.replaceAll(" ", "+");
            String s2 = code2sessionResponse.getSessionKey().replaceAll(" ", "+");
            String res = WechatDecryptDataUtil.decryptData(s, s2, s1);
            Map<String, Object> parse = (Map<String, Object>) JSONObject.parse(res);
            if (parse != null) {
                String phoneNumber = (String) parse.get("phoneNumber");
                System.out.println("结果 = " + parse);
                System.out.println("手机号码 = " + phoneNumber);
                if (StringUtil.isBlank(phoneNumber)) {
                    return AjaxResult.error("手机号为空");
                }
                return AjaxResult.success(parse);
            } else {
                return AjaxResult.error("授权信息为空");
            }
        }
    }

    /**
     * 账号登陆
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("phone,password")
    public AjaxResult login(JSONObject jsonObject) {
        String phone = jsonObject.getString("phone");
        String password = jsonObject.getString("password");
        String type = jsonObject.getString("type");
        jsonObject = StringUtils.isBlank(type) ? apiMapper.getCustomerInfoByPhone(phone) : apiMapper.getCustomerInfo(jsonObject);
        jsonObject = ApiUtils.stringToArray(jsonObject);
        if (jsonObject != null && StringUtils.isNotBlank(jsonObject.getString("password"))) {
            String pwd = jsonObject.getString("password");
            if (!SecurityUtil.md5enc(password).equals(pwd)) {
                return AjaxResult.error("密码输入有误");
            }
            return AjaxResult.success(jsonObject);
        } else {
            return AjaxResult.error("未查询到用户信息");
        }
    }

    /**
     * 短信登陆
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("phone,code")
    public AjaxResult loginBySms(JSONObject jsonObject) {
        String phone = jsonObject.getString("phone");
        String code = jsonObject.getString("code");
        String type = jsonObject.getString("type");
        jsonObject = StringUtils.isBlank(type) ? apiMapper.getCustomerInfoByPhone(phone) : apiMapper.getCustomerInfo(jsonObject);
        jsonObject = ApiUtils.stringToArray(jsonObject);
        if (jsonObject != null && StringUtils.isNotBlank(jsonObject.getString("password"))) {
            boolean boo = SendSmsUtil.verifyCode(redis, phone, code);
            if (!boo) {
                return AjaxResult.error("验证码输入有误");
            }
            return AjaxResult.success(jsonObject);
        } else {
            return AjaxResult.error("未查询到用户信息");
        }
    }

    /**
     * 提交入驻申请
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("phone,code")
    public AjaxResult userAudit(JSONObject jsonObject) {
        String phone = jsonObject.getString("phone");
        String code = jsonObject.getString("code");
        String type = jsonObject.getString("type");
//        jsonObject = StringUtils.isBlank(type) ? apiMapper.getCustomerInfoByPhone(phone) : apiMapper.getCustomerInfo(jsonObject);
//        jsonObject = stringToArray(jsonObject);
        boolean boo = SendSmsUtil.verifyCode(redis, phone, code);
        if (!boo) {
            return AjaxResult.error("验证码输入有误");
        }
        jsonObject.put("audit","0");
        int rows = apiMapper.updateCustomer(jsonObject);
        return rows > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 查询审核状态
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getCustomerStatus(JSONObject jsonObject) {
        Long customerId = jsonObject.getLong("customerId");
        JSONObject customer = apiMapper.getCustomerById(customerId);
        String type = customer.getString("type");
        String audit = customer.getString("audit");
        //服务商
        JSONObject object = new JSONObject();
        object.put("customerId",customer.getString("id"));
        if ("1".equals(type)){
            //普通用户==未申请
            object.put("audit",-1);
            return AjaxResult.success(object);
        }else{
            object.put("audit",audit);
            return AjaxResult.success(object);
        }
    }

    /**
     * 找回密码
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("password,phone,code")
    public AjaxResult updatePassword(JSONObject jsonObject) {
        String phone = jsonObject.getString("phone");
        String password = jsonObject.getString("password");
        String code = jsonObject.getString("code");
        boolean boo = SendSmsUtil.verifyCode(redis, phone, code);
        if (!boo) {
            return AjaxResult.error("验证码输入有误");
        } else {
            jsonObject.put("password", SecurityUtil.md5enc(password));
            jsonObject.put("updateTime", new Date());
            int cnt = apiMapper.updateCustomerPassword(jsonObject);
            if (cnt > 0) {
                jsonObject = apiMapper.getCustomerInfoByPhone(phone);
                jsonObject.put("phone", jsonObject.getString("phone") + "（会员）");
                apiMapper.updateCustomer(jsonObject);
                jsonObject = apiMapper.getCustomerInfoByPhone(phone);
                jsonObject = ApiUtils.stringToArray(jsonObject);
                return AjaxResult.success(jsonObject);
            }
            return AjaxResult.error("未查询到用户信息");
        }
    }

    /**
     * 修改密码
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("newPwd,oldPwd,customerId")
    public AjaxResult modifyPassword(JSONObject jsonObject) {
        Long customerId = jsonObject.getLong("customerId");
        String oldPwd = jsonObject.getString("oldPwd");
        String newPwd = jsonObject.getString("newPwd");
        jsonObject = apiMapper.getCustomerInfoById(customerId);
        if (jsonObject == null) {
            return AjaxResult.error("未查询到用户信息");
        } else {
            String password = jsonObject.getString("password");
            if (!SecurityUtil.md5enc(oldPwd).equals(password)) {
                return AjaxResult.error("输入旧密码不对，请重新输入");
            } else {
                jsonObject.put("customerId", customerId);
                jsonObject.put("password", SecurityUtil.md5enc(newPwd));
                jsonObject.put("updateTime", new Date());
                int cnt = apiMapper.updateCustomerPasswordById(jsonObject);
                if (cnt > 0) {
                    jsonObject = apiMapper.getCustomerInfoById(customerId);
                    jsonObject.put("phone", jsonObject.getString("phone") + "（会员）");
                    apiMapper.updateCustomer(jsonObject);
                    jsonObject = apiMapper.getCustomerInfoById(customerId);
                    jsonObject = ApiUtils.stringToArray(jsonObject);
                    return AjaxResult.success(jsonObject);
                }
                return AjaxResult.error("未查询到用户信息");
            }
        }
    }

    /**
     * 完善资料
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult updateCustomer(JSONObject jsonObject) {
        JSONObject object = apiMapper.getCustomerInfoById(jsonObject.getLong("customerId"));
        if (object == null || object.size() == 0) {
            return AjaxResult.error("未查询到用户信息");
        } else {
            jsonObject.put("updateTime", new Date());
            int cnt = apiMapper.updateCustomer(jsonObject);
            if (cnt > 0) {
                jsonObject = apiMapper.getCustomerInfoById(jsonObject.getLong("customerId"));
                jsonObject = ApiUtils.stringToArray(jsonObject);
                return AjaxResult.success(jsonObject);
            }
            return AjaxResult.error("完善资料失败");
        }
    }

    /**
     * 修改签署状态
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult createCustomerSign(JSONObject jsonObject) {
        jsonObject.put("orderCode", System.currentTimeMillis());
        jsonObject.put("payType", 1);
        jsonObject.put("payStatus", 0);
        jsonObject.put("status", 0);
        jsonObject.put("createTime", DateUtils.getNowDate());
        int cnt = apiMapper.insertCustomerSign(jsonObject);
        return cnt == 0 ? AjaxResult.error("支付保证金失败") : commonService.paySign(jsonObject);
    }

    /**
     * 修改签署状态
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult updateContractFlag(JSONObject jsonObject) {
        int cnt = apiMapper.updateCustomerContractFlag(jsonObject);
        return cnt == 0 ? AjaxResult.error("修改签署状态失败") : AjaxResult.success("修改签署状态成功");
    }


    // TODO 商品模块

    /**
     * 获取会员信息
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId,openid")
    public AjaxResult getCustomer(JSONObject jsonObject) {
        Long customerId = jsonObject.getLong("customerId");
        String openid = jsonObject.getString("openid");
        if (customerId != null && customerId > 0) {
            JSONObject object = apiMapper.getCustomerInfoById(customerId);
            if (object == null) {
                object = new JSONObject();
            } else {
                List<JSONObject> jsonObjectList = apiMapper.getFansList(customerId);
                if (jsonObjectList == null || jsonObjectList.size() == 0) {
                    object.put("groupCnt", 0);
                } else {
                    int groupCnt = jsonObjectList.size();
                    for (JSONObject json : jsonObjectList) {
                        Long cId = json.getLong("customerId");
                        List<JSONObject> jsonObjects = apiMapper.getFansList(cId);
                        if (jsonObjects != null) {
                            groupCnt = groupCnt + jsonObjects.size();
                        }
                    }
                    object.put("groupCnt", groupCnt);
                }
            }
            return AjaxResult.success(object);
        }
        if (StringUtils.isNotBlank(openid)) {
            JSONObject object = apiMapper.getCustomerInfoByOpenId(openid);
            return AjaxResult.success(object);
        }
        return AjaxResult.success();
    }
    /**
     * 获取会员信息
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    @ResponseParam("id,avatar,name,phone,isAuth")
    public AjaxResult getCustomerInfo(JSONObject jsonObject) {
        Long customerId = jsonObject.getLong("customerId");
        JSONObject object = apiMapper.getCustomerInfoById(customerId);
        return AjaxResult.success(object);
    }
    /**
     * 会员实名认证
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId,name,number,numberZ,numberF,business")
    public AjaxResult customerAuth(JSONObject jsonObject) {
        jsonObject.put("isAuth", 1);
        int i = apiMapper.updateCustomer(jsonObject);
        return i > 0 ? AjaxResult.success() : AjaxResult.error()  ;
    }
    /**
     * 获取服务商、合伙人中心信息
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    @ResponseParam("customerId,avatar,name,phone,money,countMoney,toDayMoney,lastMoney,qrcode")
    public JSONObject getCustomerService(JSONObject jsonObject) {
        Long customerId = jsonObject.getLong("customerId");
        JSONObject object = apiMapper.getCustomerService(customerId);
        return object;
    }
    /**
     * 获取合伙人设备数量
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getSpecsCnt(JSONObject jsonObject) {
        Long customerId = jsonObject.getLong("customerId");
        int cnt = apiMapper.getSpecsCnt(customerId);
        return AjaxResult.success(cnt);
    }
    /**
     * 添加客户信息
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    @ResponseParam("customerId,avatar,name,phone,money,countMoney,toDayMoney,lastMoney,qrcode")
    public JSONObject addCustomer(JSONObject jsonObject) {
        Long customerId = jsonObject.getLong("customerId");
        JSONObject object = apiMapper.getCustomerService(customerId);
        return object;
    }
    /**
     * 获取服务商、合伙人中心信息
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    @ResponseParam("customerId,qrcode,money,awaryMoney,count")
    public JSONObject getCustomerShare(JSONObject jsonObject) {
        Long customerId = jsonObject.getLong("customerId");
        JSONObject object = apiMapper.getCustomerShare(customerId);
        return object;
    }

    /**
     * 获取粉丝信息
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getFans(JSONObject jsonObject) {
        Long customerId = jsonObject.getLong("customerId");
        List<JSONObject> list = apiMapper.getFansList(customerId);
        return AjaxResult.success(list);
    }

    /**
     * 获取间推信息
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getTwoFans(JSONObject jsonObject) {
        Long customerId = jsonObject.getLong("customerId");
        List<JSONObject> list = apiMapper.getTwoFansList(customerId);
        return AjaxResult.success(list);
    }

    /**
     * 升级推广员
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult openPromoter(JSONObject jsonObject) {
        jsonObject.put("promoterFlag", 0);
        jsonObject.put("createTime", DateUtils.getNowDate());
        int cnt = apiMapper.insertCustomerPromoter(jsonObject);
        if (cnt > 0) {
            apiMapper.updateCustomerMoneyPromoterFlag(jsonObject);
        }
        return cnt == 0 ? AjaxResult.error("添加申请失败") : AjaxResult.success("添加申请成功");
    }

    /**
     * 获取热门商品列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult getHotGoodsList(JSONObject jsonObject) {
        List<JSONObject> jsonObjectList = apiMapper.getHotGoodsList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }
    /**
     * 获取商品分类
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult getGoodTypeList(JSONObject jsonObject) {
        List<JSONObject> jsonObjectList = apiMapper.getGoodTypeList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }

    /**
     * 获取商品分类
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult getGoodTypeList2(JSONObject jsonObject) {
        List<JSONObject> jsonObjectList = apiMapper.getGoodTypeList2(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }

    /**
     * 获取商品列表【首页】
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult getGoodInfoListByHomePage(JSONObject jsonObject) {
        List<Long> typeIds = apiMapper.getGoodsTypeIdById(jsonObject.getLong("typeId"));
        if (typeIds == null || typeIds.size() == 0) {
            return AjaxResult.success(new ArrayList<>());
        } else {
            jsonObject.put("typeId", null);
            jsonObject.put("list", typeIds);
            List<JSONObject> jsonObjectList = apiMapper.getGoodInfoList(jsonObject);
            if (jsonObjectList != null) {
                for (JSONObject object : jsonObjectList) {
                    object.put("type", 1);
                    String image = apiMapper.getGoodImageById(object);
                    object.put("image", image);
                    object.remove("type");
                }
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 获取展示商品列表【首页】
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult getShowGoodInfoList(JSONObject jsonObject) {
        List<JSONObject> jsonObjectList = apiMapper.getGoodInfoList(jsonObject);
        if (jsonObjectList != null) {
            for (JSONObject object : jsonObjectList) {
                object.put("type", 1);
                String image = apiMapper.getGoodImageById(object);
                object.put("image", image);
                object.remove("type");
            }
        }
        return AjaxResult.success(jsonObjectList);
    }

    /**
     * 获取商品列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult getGoodInfoList(JSONObject jsonObject) {
        List<JSONObject> jsonObjectList = apiMapper.getGoodInfoList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }

    /**
     * 获取商品列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult getGoodInfoListByName(JSONObject jsonObject) {
        List<JSONObject> jsonObjectList = apiMapper.getGoodInfoList(jsonObject);
        if (jsonObjectList != null) {
            for (JSONObject object : jsonObjectList) {
                object.put("type", 1);
                String image = apiMapper.getGoodImageById(object);
                object.put("image", image);
                object.remove("type");
            }
        }
        return AjaxResult.success(jsonObjectList);
    }

    /**
     * 获取商品详情
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult getGoodInfo(JSONObject jsonObject) {
            JSONObject object = apiMapper.getGoodInfo(jsonObject);
            if (object == null) {
                object = new JSONObject();
            }
//            else {
//                // 运费
//                JSONObject o = apiMapper.getFreight();
//                if (o != null) {
//                    Integer freight = o.getInteger("freight");
//                    object.put("freight", freight == null || freight == 0 ? "包邮" : freight);
//                }

//                // 商品规格
//                List<JSONObject> specsList = apiMapper.getGoodSpecsById(object.getLong("id"));
//                object.put("list", specsList);
                // 添加浏览记录
                /*object.put("customerId", jsonObject.getLong("customerId"));
                object.put("goodsId", object.getLong("id"));
                object.put("createTime", DateUtils.getNowDate());
                int cnt = apiMapper.getFootprintCnt(object);
                if (cnt == 0) {
                    apiMapper.insertFootprint(object);
                } else {
                    apiMapper.updateFootprint(object);
                }
                // 添加砍价标记
                if (1 == object.getLong("activeType")) {
                    int cutCnt = object.getInteger("cutCnt") == null ? 0 : object.getInteger("cutCnt");
                    int partakeCnt = apiMapper.getPartakeCnt(object);
                    BigDecimal partakePrice = new BigDecimal(object.getDouble("cutPrice") * partakeCnt).setScale(2, RoundingMode.HALF_UP);
                    object.put("partakePrice", partakePrice);
                    object.put("cutFlag", cutCnt == partakeCnt ? 1 : 0);
                }
                if (object.getLong("customerId") == null) {
                    object.put("flag", 0);
                }*/
//            }
            return AjaxResult.success(object);
    }
    /**
     * 获取商品下单页面
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("goodsId,freightId,specsId")
    public AjaxResult getGoodOrder(JSONObject jsonObject) {
        JSONObject object = apiMapper.getGoodOrder(jsonObject);
        if (object != null) {
            // 移机费
//            JSONObject o = apiMapper.getFreightById(jsonObject.getLong("freightId"));
//            object.put("freight", o.getString("freight"));
            // 商品规格
            JSONObject specsList = apiMapper.getGoodSpecsById(jsonObject.getLong("specsId"));
            object.put("specs", specsList);
            // 添加浏览记录
//            object.put("customerId", jsonObject.getLong("customerId"));
//            object.put("goodsId", object.getLong("id"));
//            object.put("createTime", DateUtils.getNowDate());
//            int cnt = apiMapper.getFootprintCnt(object);
//            if (cnt == 0) {
//                apiMapper.insertFootprint(object);
//            } else {
//                apiMapper.updateFootprint(object);
//            }
            // 添加砍价标记
//                if (1 == object.getLong("activeType")) {
//                    int cutCnt = object.getInteger("cutCnt") == null ? 0 : object.getInteger("cutCnt");
//                    int partakeCnt = apiMapper.getPartakeCnt(object);
//                    BigDecimal partakePrice = new BigDecimal(object.getDouble("cutPrice") * partakeCnt).setScale(2, RoundingMode.HALF_UP);
//                    object.put("partakePrice", partakePrice);
//                    object.put("cutFlag", cutCnt == partakeCnt ? 1 : 0);
//                }
//                if (object.getLong("customerId") == null) {
//                    object.put("flag", 0);
        }
        return AjaxResult.success(object);
    }

    /**
     * 领取优惠券列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult insertCoupon(JSONObject jsonObject) {
        JSONObject object = apiMapper.getSysCouponInfo(jsonObject);
        if (object != null) {
            jsonObject.put("useStatus", 1);
            jsonObject.put("description", object.getString("description"));
            jsonObject.put("status", 1);
            jsonObject.put("createBy", "admin");
            jsonObject.put("createTime", DateUtils.getNowDate());
            jsonObject.put("updateBy", "admin");
            jsonObject.put("updateTime", DateUtils.getNowDate());
            jsonObject.put("delFlag", 0);
            apiMapper.insertCoupon(jsonObject);
        }
        return AjaxResult.success();
    }

    /**
     * 获取优惠券列表
     *
     * @return
     */
    @Override
    public AjaxResult getSysCouponList() {
        List<JSONObject> jsonObjectList = apiMapper.getSysCouponList();
        return AjaxResult.success(jsonObjectList);
    }

    /**
     * 获取我的优惠券列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getCouponList(JSONObject jsonObject) {
        jsonObject.put("type", 1);
        List<JSONObject> jsonObjectList = apiMapper.getCouponList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }

    /**
     * 获取优惠券数量
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getCouponCnt(JSONObject jsonObject) {
        int cnt = apiMapper.getCouponCnt(jsonObject);
        jsonObject.put("cnt", cnt);
        return AjaxResult.success(jsonObject);
    }

    // TODO 订单模块

    /**
     * 添加地址
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult addAddress(JSONObject jsonObject) {
        int cnt = 0;
        if ("1".equals(jsonObject.getString("defaultFlag"))) {
            cnt = apiMapper.updateAddressDefaultFlag(jsonObject.getLong("customerId"));
        }
        jsonObject.put("status", 1);
        jsonObject.put("createBy", "admin");
        jsonObject.put("createTime", DateUtils.getNowDate());
        jsonObject.put("updateBy", "admin");
        jsonObject.put("updateTime", DateUtils.getNowDate());
        jsonObject.put("delFlag", 0);
        cnt = apiMapper.insertAddress(jsonObject);
        return cnt == 0 ? AjaxResult.error("添加地址失败") : AjaxResult.success(jsonObject);
    }

    /**
     * 修改地址
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult updateAddress(JSONObject jsonObject) {
        int cnt = 0;
        if ("1".equals(jsonObject.getString("defaultFlag"))) {
            cnt = apiMapper.updateAddressDefaultFlag(jsonObject.getLong("customerId"));
        }
        jsonObject.put("updateBy", "admin");
        jsonObject.put("updateTime", DateUtils.getNowDate());
        cnt = apiMapper.updateAddress(jsonObject);
        return cnt == 0 ? AjaxResult.error("修改地址失败") : AjaxResult.success("修改地址成功");
    }

    /**
     * 删除地址
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult removeAddress(JSONObject jsonObject) {
        int cnt = apiMapper.removeAddress(jsonObject);
        return cnt == 0 ? AjaxResult.error("删除地址失败") : AjaxResult.success("删除地址成功");
    }

    /**
     * 获取地址列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getAddressList(JSONObject jsonObject) {
        List<JSONObject> jsonObjectList = apiMapper.getAddressList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }

    /**
     * 获取地址详情
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("id")
    public AjaxResult getAddressInfo(JSONObject jsonObject) {
        JSONObject json = apiMapper.getAddressInfo(jsonObject.getLong("id"));
        return AjaxResult.success(json);
    }

    /**
     * 获取订单列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getOrderList(JSONObject jsonObject) {
        List<JSONObject> jsonObjectList = apiMapper.getOrderList(jsonObject);
        if (jsonObjectList != null && !jsonObjectList.isEmpty()) {
            for (JSONObject object : jsonObjectList) {
                object.put("type", 1);
                List<JSONObject> jsonObjects = apiMapper.getOrderDetails(object);
                if (jsonObjects != null && !jsonObjects.isEmpty()) {
                    JSONObject json = jsonObjects.get(0);
                    object.put("image", json.get("url"));
                    object.put("name", json.get("name"));
                    object.put("specs", json.get("specs"));
                    object.put("price", json.get("price"));
                }
                object.remove("type");
            }
        }
        return AjaxResult.success(jsonObjectList);
    }

    /**
     * 获取订单详情
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("orderCode")
    public AjaxResult getOrderInfo(JSONObject jsonObject) {
        JSONObject object = apiMapper.getOrderInfo(jsonObject.getString("orderCode"));
        if (object != null) {
            List<JSONObject> jsonObjectList = apiMapper.getOrderDetails(object);
            object.put("list", jsonObjectList);
            object.remove("type");
        }
        return AjaxResult.success(object);
    }

    /**
     * 提交订单
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult addOrder(JSONObject jsonObject) {
        String orderCode = System.currentTimeMillis() + "";
        jsonObject.put("orderCode", orderCode);
        jsonObject.put("orderStatus", 1);
        jsonObject.put("createDate", DateUtils.getNowDate());
        jsonObject.put("delFlag", 0);
        jsonObject.put("couponId", StringUtils.isBlank(jsonObject.getString("couponId")) ? 0 : jsonObject.getString("couponId"));
        int cnt = apiMapper.insertOrder(jsonObject);
        if (cnt == 0) {
            return AjaxResult.error("提交订单失败");
        }

        JSONArray jsonArray = jsonObject.getJSONArray("list");
        if (jsonArray != null && jsonArray.size() > 0) {
            for (Object o : jsonArray) {
                JSONObject object = JSONObject.parseObject(JSONObject.toJSONString(o), JSONObject.class);
                /*String specs = object.getString("specs");
                if ("无".equals(specs)) {
                    Integer stock = apiMapper.getProductStock(object.getLong("productId"));
                    if ((stock == null ? 0 : stock) - object.getInteger("cnt") < 0) {
                        apiMapper.deleteOrder(orderCode);
                        apiMapper.deleteOrderDetail(orderCode);
                        return AjaxResult.error("商品库存不足");
                    }
                } else {
                    Integer stock = apiMapper.getProductSpecsStock(object.getLong("specsId"));
                    if ((stock == null ? 0 : stock) - object.getInteger("cnt") < 0) {
                        apiMapper.deleteOrder(orderCode);
                        apiMapper.deleteOrderDetail(orderCode);
                        return AjaxResult.error("商品库存不足");
                    }
                }*/
                object.put("orderCode", orderCode);
                object.put("createDate", DateUtils.getNowDate());
                apiMapper.insertOrderDetail(object);
            }

        }
        return AjaxResult.success(jsonObject);
    }
    /**
     * 提交订单（paypal支付）
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam
    public AjaxResult addOrderPayPal(JSONObject jsonObject) {
        String orderCode = System.currentTimeMillis() + "";
        jsonObject.put("orderCode", orderCode);
        jsonObject.put("orderStatus", 1);
        jsonObject.put("createDate", DateUtils.getNowDate());
        jsonObject.put("delFlag", 0);
        jsonObject.put("couponId", StringUtils.isBlank(jsonObject.getString("couponId")) ? 0 : jsonObject.getString("couponId"));
        int cnt = apiMapper.insertOrder(jsonObject);
        if (cnt == 0) {
            return AjaxResult.error("提交订单失败");
        }

        JSONArray jsonArray = jsonObject.getJSONArray("list");
        if (jsonArray != null && jsonArray.size() > 0) {
            for (Object o : jsonArray) {
                JSONObject object = JSONObject.parseObject(JSONObject.toJSONString(o), JSONObject.class);
                /*String specs = object.getString("specs");
                if ("无".equals(specs)) {
                    Integer stock = apiMapper.getProductStock(object.getLong("productId"));
                    if ((stock == null ? 0 : stock) - object.getInteger("cnt") < 0) {
                        apiMapper.deleteOrder(orderCode);
                        apiMapper.deleteOrderDetail(orderCode);
                        return AjaxResult.error("商品库存不足");
                    }
                } else {
                    Integer stock = apiMapper.getProductSpecsStock(object.getLong("specsId"));
                    if ((stock == null ? 0 : stock) - object.getInteger("cnt") < 0) {
                        apiMapper.deleteOrder(orderCode);
                        apiMapper.deleteOrderDetail(orderCode);
                        return AjaxResult.error("商品库存不足");
                    }
                }*/
                object.put("orderCode", orderCode);
                object.put("createDate", DateUtils.getNowDate());
                apiMapper.insertOrderDetail(object);
            }

        }
        return AjaxResult.success(jsonObject);
    }

    /**
     * 再次支付
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult payOrder(JSONObject jsonObject) {
        if (jsonObject == null || StringUtils.isBlank(jsonObject.getString("orderCode"))) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            String orderCode = jsonObject.getString("orderCode");
            Integer payType = jsonObject.getInteger("payType");
            jsonObject = apiMapper.getOrderInfo(orderCode);
            if (jsonObject == null) {
                return AjaxResult.error("未查询到订单信息");
            } else {
                String code = System.currentTimeMillis() + "";
                JSONObject object = new JSONObject();
                object.put("orderCode", orderCode);
                object.put("code", code);
                apiMapper.updateOrderCode(object);
                apiMapper.updateOrderDetailCode(object);
                jsonObject.put("orderCode", code);
            }
            jsonObject.put("payType", payType);
            return commonService.pay(jsonObject);
        }
    }

    /**
     * 再次支付
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult payOrder2(JSONObject jsonObject) {
        if (jsonObject == null || StringUtils.isBlank(jsonObject.getString("orderCode"))) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            Integer leaseDays = jsonObject.getInteger("leaseDays");
            String orderCode = jsonObject.getString("orderCode");
            Integer payType = jsonObject.getInteger("payType");
            BigDecimal reletPrice = jsonObject.getBigDecimal("reletPrice");
            jsonObject = apiMapper.getOrderInfo(orderCode);
            if (jsonObject == null) {
                return AjaxResult.error("未查询到订单信息");
            } else {
                String code = System.currentTimeMillis() + "";
                JSONObject object = new JSONObject();
                object.put("orderCode", orderCode);
                object.put("code", code);
                object.put("leaseDays", leaseDays);
                // 租赁结束日期
                Date currentDate = jsonObject.getDate("endTime"); // 获取当前日期
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(currentDate); // 设置日历的时间为当前日期
                calendar.add(Calendar.DAY_OF_MONTH, leaseDays); // 将天数加上n
                Date futureDate = calendar.getTime(); // 获取n天后的日期
                System.out.println(leaseDays + "天后的日期: " + futureDate);

                jsonObject.put("endTime", futureDate);
                object.put("endTime", futureDate);
                // 计算续租费用
                BigDecimal price = jsonObject.getBigDecimal("price");
                if (price != null) {
                    object.put("actualPrice", price.add(reletPrice));
                    System.err.println("租赁总价：" + object.getString("actualPrice"));
                    jsonObject.put("price", reletPrice);
                    System.err.println("租赁价格：" + reletPrice);
                }
                apiMapper.updateOrderEndTime(object);
                apiMapper.updateOrderCode(object);
                apiMapper.updateOrderDetailCode(object);
                jsonObject.put("orderCode", code);
            }
            jsonObject.put("payType", payType);
            return commonService.pay(jsonObject);
        }
    }

    /**
     * 获取正在拼团列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getGroupList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("goodsId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getGroupList(jsonObject);
            if (jsonObjectList != null && jsonObjectList.size() > 0) {
                for (JSONObject object : jsonObjectList) {
                    int groupCnt = object.getInteger("groupCnt") == null ? 0 : object.getInteger("groupCnt");
                    Integer partakeCnt = apiMapper.getGroupCnt(object.getString("groupCode"));
                    object.put("cnt", groupCnt - (partakeCnt == null ? 0 : partakeCnt));
                }
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 获取拼团成功列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getSuccessGroupList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("goodsId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getSuccessGroupList(jsonObject);
            if (jsonObjectList != null && jsonObjectList.size() > 0) {
                for (JSONObject object : jsonObjectList) {
                    int groupCnt = object.getInteger("groupCnt") == null ? 0 : object.getInteger("groupCnt");
                    Integer partakeCnt = apiMapper.getGroupCnt(object.getString("groupCode"));
                    object.put("cnt", groupCnt - (partakeCnt == null ? 0 : partakeCnt));
                }
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 修改订单信息
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult updateOrder(JSONObject jsonObject) {
        if (jsonObject == null || StringUtils.isBlank(jsonObject.getString("orderCode"))) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            String orderCode = jsonObject.getString("orderCode");
            jsonObject.put("backTime", DateUtils.getNowDate());
            jsonObject.put("backStatus", 0);
            int cnt = apiMapper.updateOrder(jsonObject);
            if (cnt > 0) {
                JSONObject json = apiMapper.getOrderInfo(orderCode);
                if (json != null) {
                    try {
                        Map map = wxPayBack(orderCode, json.getDouble("bondPrice"));
                        if (map == null) {
                            return AjaxResult.error("归还失败");
                        } else {
                            Integer code = Integer.parseInt(map.get("code").toString());
                            return code == 0 ? AjaxResult.error("归还失败") : AjaxResult.success("归还成功");
                        }
                    } catch (Exception e) {
                        AjaxResult.error("归还失败");
                    }
                }
            }
            return cnt == 0 ? AjaxResult.error("归还失败") : AjaxResult.success("归还成功");
        }
    }

    /**
     * 订单退款申请
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult cancelOrderSubscribe(JSONObject jsonObject) {
        if (jsonObject == null || StringUtils.isBlank(jsonObject.getString("orderCode"))) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            jsonObject.put("orderStatus", 7);
            int cnt = apiMapper.updateOrderReason(jsonObject);
            return cnt == 0 ? AjaxResult.error("退款申请提交失败") : AjaxResult.success("退款申请提交成功");
        }
    }

    /**
     * 修改订单状态
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult updateOrderStatus(JSONObject jsonObject) {
        if (jsonObject == null || StringUtils.isBlank(jsonObject.getString("orderCode"))) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            System.err.println("修改订单状态为：" + jsonObject.getInteger("orderStatus"));
            JSONObject orderInfo = apiMapper.getOrderInfo(jsonObject.getString("orderCode"));
            Integer status = jsonObject.getInteger("orderStatus");
            if (orderInfo != null && status != null && status == 4) {// 已收货
                JSONObject object = new JSONObject();
                object.put("orderCode", jsonObject.getString("orderCode"));
                object.put("orderStatus", status);
                object.put("status", 1);
                object.put("startTime", DateUtils.getNowDate());
                // 租赁结束日期
                LocalDateTime currentDate = LocalDateTime.now();// 获取当前日期
                LocalDateTime futureDate = currentDate.plusDays(orderInfo.getLong("leaseDays"));// 获取当前日期后N天的日期
                object.put("endTime", futureDate);
                apiMapper.updateOrderStatus2(object);
            } else {
                apiMapper.updateOrderStatus(jsonObject);
            }
            return AjaxResult.success();

        }
    }

    /**
     * 删除订单
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult removeOrder(JSONObject jsonObject) {
        if (jsonObject == null || StringUtils.isBlank(jsonObject.getString("orderCode"))) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            int cnt = apiMapper.removeOrder(jsonObject.getString("orderCode"));
            return cnt == 0 ? AjaxResult.error("删除订单失败") : AjaxResult.success("删除订单成功");
        }
    }

    /**
     * 取消订单
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult cancelOrder(JSONObject jsonObject) throws Exception {
        if (jsonObject == null || StringUtils.isBlank(jsonObject.getString("orderCode"))) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            int cnt = 0;
            String orderCode = jsonObject.getString("orderCode");
            JSONObject object = apiMapper.getOrderInfo(orderCode);
            if (object != null) {
                apiMapper.deleteOrder(orderCode);// 删除订单
                apiMapper.deleteOrderDetail(orderCode);// 删除订单明细

                Integer orderType = object.getInteger("orderType");// 订单类型（1.商城订单 2.宅配卡订单 3.积分商城 4.加价购 5.砍价订单 6.拼团订单 7.秒杀订单 8.推荐有礼）
                Integer orderStatus = object.getInteger("orderStatus");// 订单状态（1.待付款 2.待发货 3.待收货 4.已完成 5.已评价 6.已退款）
                if (orderStatus != 1) {// 已支付
                    if (orderType == 3) {// 积分商城
                        JSONObject obj = new JSONObject();
                        obj.put("customerId", object.getLong("customerId"));
                        obj.put("integral", object.getDouble("price"));
                        apiMapper.updateCustomerIntegral(obj);
                    } else {
                        Map map = wxPayBack(orderCode, object.getDouble("price"));
                        if (map == null) {
                            return AjaxResult.error("取消订单失败");
                        } else {
                            Integer code = Integer.parseInt(map.get("code").toString());
                            return code == 0 ? AjaxResult.error("取消订单失败") : AjaxResult.success("取消订单成功");
                        }
                    }
                }
            }
            return cnt == 0 ? AjaxResult.error("取消订单失败") : AjaxResult.success("取消订单成功");
        }
    }

    /**
     * 添加评价信息
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult insertEvaluate(JSONObject jsonObject) {
        if (jsonObject == null || StringUtils.isBlank(jsonObject.getString("orderCode"))) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            jsonObject.put("createTime", DateUtils.getNowDate());
            int cnt = apiMapper.insertEvaluate(jsonObject);
            if (cnt > 0) {
                jsonObject.put("orderStatus", 5);
                apiMapper.updateOrderStatus(jsonObject);
            }
            return cnt == 0 ? AjaxResult.error("添加评价失败") : AjaxResult.success("添加评价成功");
        }
    }

    /**
     * 获取评价列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getEvaluateList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("goodsId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<String> orderCodeList = apiMapper.getOrderCodesByGoodsId(jsonObject.getLong("goodsId"));
            if (orderCodeList == null) {
                return AjaxResult.success("未查询到购买记录");
            } else {
                List<JSONObject> jsonObjectList = apiMapper.getEvaluateList(orderCodeList);
                if (jsonObjectList == null || jsonObjectList.size() == 0) {
                    jsonObjectList = new ArrayList<>();
                }
                return AjaxResult.success(jsonObjectList);
            }
        }
    }

    /**
     * 获取购物车
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getOrderCar(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getOrderCarListById(jsonObject.getLong("customerId"));
            if (jsonObjectList == null || jsonObjectList.size() == 0) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 提交购物车
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult addOrderCar(JSONObject jsonObject) {
        if (jsonObject == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            jsonObject.put("orderCode", System.currentTimeMillis());
            jsonObject.put("createTime", DateUtils.getNowDate());
            JSONArray jsonArray = jsonObject.getJSONArray("list");
            if (jsonArray != null && jsonArray.size() > 0) {
                List<JSONObject> list = new ArrayList<>();
                List<JSONObject> jsonObjects = apiMapper.getOrderCarListById(jsonObject.getLong("customerId"));
                if (jsonObjects != null && jsonObjects.size() > 0) {
                    List<JSONObject> jsonObjectList = jsonArray.toJavaList(JSONObject.class);
                    boolean flag = true;
                    JSONObject obj = jsonObjectList.get(0);
                    for (JSONObject object : jsonObjects) {
                        if (object.getLong("goodsId") == obj.getLong("goodsId")) {
                            Integer cnt = object.getInteger("goodsCnt") + obj.getInteger("goodsCnt");
                            BigDecimal total = object.getBigDecimal("goodsTotal").add(obj.getBigDecimal("goodsTotal"));
                            object.put("goodsCnt", cnt);
                            object.put("goodsTotal", total.setScale(2, RoundingMode.HALF_UP));
                            list.add(object);
                            flag = false;
                        } else {
                            list.add(object);
                        }
                    }
                    if (flag) {
                        list.add(obj);
                    }
                    jsonObject.put("list", list);
                }
            }
        }
        apiMapper.removeOrderCar(jsonObject.getLong("customerId"));
        int cnt = apiMapper.insertOrderCar(jsonObject);
        return cnt == 0 ? AjaxResult.error("提交购物车失败") : AjaxResult.success("提交购物车成功");
    }

    /**
     * 修改购物车
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult updateOrderCar(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("id") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            int cnt = apiMapper.updateOrderCar(jsonObject);
            return cnt == 0 ? AjaxResult.error("修改购物车失败") : AjaxResult.success("修改购物车成功");
        }
    }

    /**
     * 删除购物车
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult deleteOrderCar(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("id") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            int cnt = apiMapper.deleteOrderCar(jsonObject.getLong("id"));
            return cnt == 0 ? AjaxResult.error("删除购物车失败") : AjaxResult.success("删除购物车成功");
        }
    }

    /**
     * 清空购物车
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult removeOrderCar(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getString("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            int cnt = apiMapper.removeOrderCar(jsonObject.getLong("customerId"));
            return cnt == 0 ? AjaxResult.error("清空购物车失败") : AjaxResult.success("清空购物车成功");
        }
    }

    /**
     * 获取物流列表
     *
     * @return
     */
    @Override
    public AjaxResult getOrderExpressList(JSONObject jsonObject) {
        List<JoggleExpress> joggleExpressList = apiMapper.getExpressList(jsonObject);
        if (joggleExpressList == null) {
            joggleExpressList = new ArrayList<>();
        }
        return AjaxResult.success(joggleExpressList);
    }

    /**
     * 获取物流信息
     *
     * @return
     */
    @Override
    public AjaxResult getOrderExpress(JSONObject jsonObject) {
        if (jsonObject == null || StringUtils.isBlank(jsonObject.getString("orderCode"))) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            JSONObject object = apiMapper.getOrderInfo(jsonObject.getString("orderCode"));
            if (object == null) {
                return AjaxResult.error("未查询到订单信息");
            } else {
                JoggleExpress joggleExpress = apiMapper.getExpressById(object.getLong("expressId"));
                if (joggleExpress == null) {
                    return AjaxResult.error("未填写物流信息");
                } else {
                    SynQueryUtil synQueryUtil = new SynQueryUtil();
                    List<Map<String, String>> mapList = synQueryUtil.synQueryData(joggleExpress.getCode(), object.getString("expressNum"));
                    return AjaxResult.success(mapList);
                }
            }
        }
    }

    /**
     * 收藏商品信息
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult insertCollectGood(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null || jsonObject.getLong("goodsId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            if (apiMapper.getCollectGoodCnt(jsonObject) > 0) {
                return AjaxResult.success("收藏商品信息成功");
            }
            int cnt = apiMapper.insertCollectGood(jsonObject);
            return cnt == 0 ? AjaxResult.error("收藏商品信息失败") : AjaxResult.success("收藏商品信息成功");
        }
    }

    /**
     * 取消商品收藏
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult deleteCollectGood(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null || jsonObject.getLong("goodsId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            int cnt = apiMapper.deleteCollectGood(jsonObject);
            return cnt == 0 ? AjaxResult.error("取消商品收藏失败") : AjaxResult.success("取消商品收藏成功");
        }
    }

    /**
     * 获取收藏列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult getCollectGoodList(JSONObject jsonObject) {
        List<JSONObject> jsonObjectList = apiMapper.getCollectGoodList(jsonObject);
        return AjaxResult.success(jsonObjectList);
    }

    /**
     * 获取已兑换商品列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getExchangeGoodList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getExchangeGoodList(jsonObject);
            if (jsonObjectList == null) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 获取积分明细列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getExchangeLogList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getExchangeLogList(jsonObject);
            if (jsonObjectList == null) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 会员充值
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult rechargeMoney(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            jsonObject.put("orderCode", System.currentTimeMillis());
            jsonObject.put("status", 0);
            jsonObject.put("createTime", DateUtils.getNowDate());
            apiMapper.insertRechargeLog(jsonObject);
            return commonService.payMoney(jsonObject);
        }
    }

    /**
     * 获取充值记录
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getRechargeLogList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getRechargeLogList(jsonObject);
            if (jsonObjectList == null) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 获取我的足迹
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getFootprintList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getFootprintList(jsonObject);
            if (jsonObjectList == null) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 获取转盘商品
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getTurntableGoodsList(JSONObject jsonObject) {
        if (jsonObject == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getTurntableGoodsList(jsonObject);
            if (jsonObjectList == null) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 获取转盘规则
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getTurntableRule(JSONObject jsonObject) {
        if (jsonObject == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            JSONObject object = apiMapper.getTurntableRule(jsonObject);
            if (object == null) {
                object = new JSONObject();
            }
            return AjaxResult.success(object);
        }
    }

    /**
     * 获取中奖记录
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getTurntableLogList(JSONObject jsonObject) {
        if (jsonObject == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getTurntableLogList(jsonObject);
            if (jsonObjectList == null) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 获取中奖商品
     *
     * @return
     */
    @Override
    public AjaxResult getWinGoodsInfo(JSONObject jsonObject) {
        List<JSONObject> jsonObjectList = apiMapper.getTurntableGoodsList(jsonObject);
        if (jsonObjectList == null) {
            return AjaxResult.error();
        } else {
            WchatLotteryDomain wchatLotteryDomain = BigWheelDrawUtil.generateAward(jsonObjectList);
            if (wchatLotteryDomain != null && wchatLotteryDomain.getId() != null) {
                jsonObject.put("id", wchatLotteryDomain.getId());
                JSONObject goodInfo = apiMapper.getGoodInfo(jsonObject);
                if (goodInfo != null) {
                    jsonObject.put("goodsId", goodInfo.getLong("id"));
                    jsonObject.put("goodsName", goodInfo.getString("name"));
                    jsonObject.put("goodsIntegral", wchatLotteryDomain.getPrize());
                    jsonObject.put("type", 1);
                    String image = apiMapper.getGoodImageById(jsonObject);
                    jsonObject.put("goodsImage", image);
                    jsonObject.put("exchangeFlag", 0);
                    jsonObject.put("createTime", DateUtils.getNowDate());
                }
                apiMapper.insertWinGoodsInfo(jsonObject);
            }
            return AjaxResult.success(wchatLotteryDomain);
        }
    }

    /**
     * 我的砍价列表
     *
     * @return
     */
    @Override
    public AjaxResult getCutList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getCutList(jsonObject);
            if (jsonObjectList == null || jsonObjectList.size() == 0) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 砍价成功列表
     *
     * @return
     */
    @Override
    public AjaxResult getSuccessCutList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("goodsId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getSuccessCutList(jsonObject);
            if (jsonObjectList == null || jsonObjectList.size() == 0) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 参与砍价列表
     *
     * @return
     */
    @Override
    public AjaxResult getPartakeCutList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null || jsonObject.getLong("goodsId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getPartakeCutList(jsonObject);
            if (jsonObjectList == null || jsonObjectList.size() == 0) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }


    /**
     * 邀请好友砍价
     *
     * @return
     */
    @Override
    public AjaxResult inviteFriendsCut(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getString("customerId") == null || jsonObject.getString("goodsId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            int cnt = apiMapper.getCutCnt2(jsonObject);
            if (cnt > 2) {
                return AjaxResult.error("不能发起超过三次砍价");
            } else {
                try {
                    String qrcode = ApiUtils.addCutQrcode(jsonObject);
//                String backgroundImage = "F:\\www\\SpringBootProjects\\kafeizulin\\background\\background.png";
                    String backgroundImage = "/www/SpringBootProjects/kafeizulin/background/background.png";
                    if (jsonObject.getLong("goodsId") != null) {
                        jsonObject.put("id", jsonObject.getLong("goodsId"));
                        JSONObject goodsInfo = apiMapper.getGoodInfo(jsonObject);
                        if (goodsInfo != null) {
                            String propagandaImage = goodsInfo.getString("poster");
                            jsonObject.put("type", 1);
                            String goodsImage = apiMapper.getGoodImageById(jsonObject);
                            JSONObject customerInfo = apiMapper.getCustomerInfoById(jsonObject.getLong("customerId"));
                            if (customerInfo != null) {
                                String phone = customerInfo != null && StringUtils.isNotBlank(customerInfo.getString("phone")) ? customerInfo.getString("phone") : "暂未上传联系方式";
                                String customerName = customerInfo.getString("name");
                                if (customerName.length() > 13) {
                                    customerName = customerName.substring(0, 13) + "...";
                                }
//                            String path = "F:/www/SpringBootProjects/kafeizulin/background/" + System.currentTimeMillis() + ".png";
                                String path = "/www/SpringBootProjects/kafeizulin/background/" + System.currentTimeMillis() + ".png";
                                File file = ImageUtils.overlapImage(720, 1280, backgroundImage, propagandaImage, goodsImage, qrcode, customerName, phone, path);
                                jsonObject.put("qrcode", AliyunFileUtils.uploadFile(file));
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    return AjaxResult.error("生成分享码失败");
                }
            }
            return AjaxResult.success(jsonObject);
        }
    }

    /**
     * 参与好友砍价
     *
     * @return
     */
    @Override
    public AjaxResult insertFriendsCut(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            if (jsonObject.getLong("customerId").equals(jsonObject.getLong("cutId"))) {
                return AjaxResult.error("不能参与自己发起的砍价");
            } else {
                int cnt = apiMapper.getCutCnt(jsonObject);
                if (cnt > 0) {
                    return AjaxResult.error("已参与过砍价");
                } else {
                    jsonObject.put("status", 0);
                    jsonObject.put("createDate", DateUtils.getNowDate());
                    cnt = apiMapper.insertFriendsCut(jsonObject);
                    return cnt == 0 ? AjaxResult.error("参与好友砍价失败") : AjaxResult.success("参与好友砍价成功");
                }
            }
        }
    }

    /**
     * 获取报修订单列表
     *
     * @return
     */
    @Override
    public AjaxResult getRepairOrderList(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getRepairOrderList(jsonObject);
            if (jsonObjectList == null) {
                jsonObjectList = new ArrayList<>();
            }
            return AjaxResult.success(jsonObjectList);
        }
    }

    /**
     * 上传报修订单
     *
     * @return
     */
    @Override
    public AjaxResult addRepairOrder(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            jsonObject.put("orderCode", System.currentTimeMillis() + "");
            jsonObject.put("status", 1);
            jsonObject.put("createTime", DateUtils.getNowDate());
            int cnt = apiMapper.addRepairOrder(jsonObject);
            if (cnt > 0) {
                JSONObject json = apiMapper.getRepairOrderInfo(jsonObject.getLong("id"));
                return AjaxResult.success(json);
            }
            return AjaxResult.error("添加保修订单失败");
        }
    }

    /**
     * 修改报修订单
     *
     * @return
     */
    @Override
    public AjaxResult updateRepairOrder(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("id") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            int cnt = apiMapper.updateRepairOrder(jsonObject);
            return cnt == 0 ? AjaxResult.error("提交失败") : AjaxResult.success("提交成功");
        }
    }

    /**
     * 删除报修订单
     *
     * @return
     */
    @Override
    public AjaxResult deleteRepairOrder(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("id") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            int cnt = apiMapper.deleteRepairOrder(jsonObject.getLong("id"));
            return cnt == 0 ? AjaxResult.error("删除报修订单失败") : AjaxResult.success("删除报修订单成功");
        }
    }

    /**
     * 结束好友砍价
     *
     * @return
     */
    @Override
    public AjaxResult deleteFriendsCut(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null || jsonObject.getLong("goodsId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            int cnt = apiMapper.deleteFriendsCut(jsonObject);
            return cnt == 0 ? AjaxResult.error("结束好友砍价失败") : AjaxResult.success("结束好友砍价成功");
        }
    }

    // TODO 系统模块

    /**
     * 获取轮播图
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getBannerList(JSONObject jsonObject) {
        if (jsonObject == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> jsonObjectList = apiMapper.getBannerList(jsonObject);
            return AjaxResult.success(jsonObjectList);
        }
    }
    /**
     * 获取活动海报
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getBannerInfo(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getString("type") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            JSONObject object = apiMapper.getBannerInfo(jsonObject);
            return AjaxResult.success(object);
        }
    }

    /**
     * 获取系统通知
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("type")
    public AjaxResult getNoticeList(JSONObject jsonObject) {
        return AjaxResult.success( apiMapper.getNoticeList(jsonObject));
    }
    /**
     * 获取系统通知详情
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("noticeId")
    public AjaxResult getNotice(JSONObject jsonObject) {
        return AjaxResult.success(apiMapper.getNotice(jsonObject.getLong("noticeId")));
    }

    /**
     * 获取保证金
     *
     * @return
     */
    @Override
    public AjaxResult getBond() {
        return AjaxResult.success(apiMapper.getBond());
    }

    /**
     * 获取隐私政策
     *
     * @return
     */
    @Override
    public AjaxResult getConceal() {
        return AjaxResult.success(apiMapper.getConceal());
    }

    /**
     * 获取用户协议
     *
     * @return
     */
    @Override
    @VerifyParam("type")
    public AjaxResult getAgreement(JSONObject jsonObject) {
        return AjaxResult.success(apiMapper.getAgreement(jsonObject));
    }

    /**
     * 获取关于我们
     *
     * @return
     */
    @Override
    @ResponseParam("image,name")
    public AjaxResult getWe() {
        return AjaxResult.success(apiMapper.getWe());
    }

    /**
     * 获取客服电话
     *
     * @return
     */
    @Override
    public AjaxResult getService() {
        JSONObject object = apiMapper.getService();
        return AjaxResult.success(object);
    }

    /**
     * 上传意见反馈
     *
     * @return
     */
    @Override
    @VerifyParam("customerId,images,content")
    public AjaxResult insertIdea(JSONObject jsonObject) {
        jsonObject.put("status", 1);
        jsonObject.put("createTime", DateUtils.getNowDate());
        jsonObject.put("delFlag", 0);
        int cnt = apiMapper.insertIdea(jsonObject);
        return cnt == 0 ? AjaxResult.error("上传意见反馈失败") : AjaxResult.success("上传意见反馈成功");
    }

    /**
     * 获取砍价规则
     *
     * @return
     */
    @Override
    public AjaxResult getCutRule() {
        JSONObject object = apiMapper.getCutRule();
        if (object == null) {
            object = new JSONObject();
        }
        return AjaxResult.success(object);
    }

    /**
     * 获取邀请规则
     *
     * @return
     */
    @Override
    public AjaxResult getInviteRule() {
        JSONObject object = apiMapper.getInviteRule();
        if (object == null) {
            object = new JSONObject();
        }
        return AjaxResult.success(object);
    }

    /**
     * 获取购买须知
     *
     * @return
     */
    @Override
    public AjaxResult getBuyNotice() {
        JSONObject object = apiMapper.getBuyNotice();
        if (object == null) {
            object = new JSONObject();
        }
        return AjaxResult.success(object);
    }

    /**
     * 获取运费设置
     *
     * @return
     */
    @Override
    public AjaxResult getFreight(JSONObject jsonObject) {
        List<JSONObject> freight = apiMapper.getFreight(jsonObject.getLong("goodsId"));
        if (freight == null) {
            freight = new ArrayList<>();
        }
        return AjaxResult.success(freight);
    }

    /**
     * 获取运费
     *
     * @return
     */
    @Override
    public AjaxResult getFreightByProvince(JSONObject jsonObject) {
        if (jsonObject != null && StringUtils.isBlank(jsonObject.getString("province"))) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            JSONObject object = apiMapper.getFreightByProvince(jsonObject.getString("province"));
            if (object == null) {
                object = new JSONObject();
                object.put("price", 0);
            }
            return AjaxResult.success(object);
        }
    }

    /**
     * 获取版本信息
     *
     * @return 结果
     */
    @Override
    public AjaxResult getVersion() {
        JSONObject jsonObject = apiMapper.getVersion();
        if (jsonObject == null) {
            jsonObject = new JSONObject();
        }
        return AjaxResult.success(jsonObject);
    }

    /**
     * 获取商品规格
     *
     * @return 结果
     */
    @Override
    public AjaxResult getGoodsSpecs(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("goodsId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> specs = apiMapper.getGoodSpecsByGoodsId(jsonObject.getLong("goodsId"));
            if (specs == null) {
                specs = new ArrayList<>();
            }
            return AjaxResult.success(specs);
        }
    }

    /**
     * 提交提现申请
     *
     * @param jsonObject
     * @return
     */
    @Override
    @VerifyParam("customerId")
    public AjaxResult withdrawCustomerMoney(JSONObject jsonObject) {
        /*Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtils.getNowDate());
        Integer day = cal.get(Calendar.DAY_OF_MONTH);
        if (day == null || day != 13) {
            return AjaxResult.error("非提现日不能提现");
        }*/
        /*BigDecimal r = jsonObject.getBigDecimal("price").remainder(new BigDecimal(100));
        if (r.compareTo(BigDecimal.ZERO) != 0) {
            return AjaxResult.error("提现金额必须为100的倍数");
        }*/
        JSONObject o = apiMapper.getCustomerInfoById(jsonObject.getLong("customerId"));
        if (o == null) {
            return AjaxResult.error("未查询到会员信息");
        } else {
            BigDecimal pirce = jsonObject.getBigDecimal("price");
            BigDecimal integral = o.getBigDecimal("integral");
            if ((pirce.multiply(BigDecimal.TEN)).compareTo(integral) > 0) {
                return AjaxResult.error("用户积分不足");
            } else {
                jsonObject.put("status", 1);
                jsonObject.put("createTime", DateUtils.getNowDate());
                int cnt = apiMapper.insertWithdraw(jsonObject);
                if (cnt > 0) {
                    jsonObject.put("integral", pirce.multiply(BigDecimal.TEN).multiply(new BigDecimal(-1)));
                    apiMapper.updateCustomerIntegral(jsonObject);
                }
                return cnt == 0 ? AjaxResult.error("提交失败") : AjaxResult.success("提交成功");
            }
        }
    }

    /**
     * 用户提现记录
     *
     * @param jsonObject
     * @return
     */
    @Override
    public AjaxResult getWithdrawLog(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getLong("customerId") == null) {
            return AjaxResult.error("请先登录账号");
        } else {
            JSONObject o = apiMapper.getCustomerInfoById(jsonObject.getLong("customerId"));
            if (o == null) {
                return AjaxResult.error("未查询到会员信息");
            } else {
                List<JSONObject> jsonObjectList = apiMapper.getWithdrawLog(jsonObject);
                if (jsonObjectList == null || jsonObjectList.size() == 0) {
                    jsonObjectList = new ArrayList<>();
                }
                return AjaxResult.success(jsonObjectList);
            }
        }
    }

    /**
     * 获取预期项目、咨询详情、使用目的
     *
     * @return
     */
    @Override
    public AjaxResult getDictItem() {
        List<JSONObject> list1 = apiMapper.getDictByType("pro_inquiry_item");
        List<JSONObject> list2 = apiMapper.getDictByType("pro_inquiry_detail");
        List<JSONObject> list3 = apiMapper.getDictByType("pro_inquiry_use_purpose");
        List<JSONObject> list4 = apiMapper.getDictByType("pro_inquiry_way");
        HashMap<String, Object> map = new HashMap<>();
        map.put("item",list1);
        map.put("detail",list2);
        map.put("purpose",list3);
        map.put("way",list4);
        return AjaxResult.success(map);

    }

    // TODO 公共模块




    // TODO 回调模块

    /**
     * 订单微信回调
     *
     * @param request
     * @param response
     * @return
     */
    @Override
    public String wxOrderNotifyUrl(HttpServletRequest request, HttpServletResponse response) throws Exception {
        InputStream inputStream;
        StringBuffer sb = new StringBuffer();
        inputStream = request.getInputStream();
        String s;
        BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
        while ((s = in.readLine()) != null) {
            sb.append(s);
        }
        in.close();
        inputStream.close();
        Map<String, String> m = new HashMap<String, String>();
        m = XMLUtil.doXMLParse(sb.toString());
        Map<String, String> packageParams = new HashMap<>();
        Iterator<String> it = m.keySet().iterator();
        while (it.hasNext()) {
            String parameter = it.next();
            String parameterValue = m.get(parameter);
            String v = "";
            if (null != parameterValue) {
                v = parameterValue.trim();
            }
            packageParams.put(parameter, v);
        }
        String key = WeChatConfig.getApikey2();
        // 判断签名是否正确
        if (PayForUtil.isSignatureValid(packageParams, key, "MD5")) {
            String resXml = "";
            if ("SUCCESS".equals(packageParams.get("result_code"))) {
                System.err.println(packageParams);
                String code = packageParams.get("out_trade_no");
                // 获取订单信息
                JSONObject jsonObject = apiMapper.getOrderInfoByWx(code);
                if (jsonObject == null) {
                    System.err.println("订单已修改，无需重复回调~");
                } else {
                    JSONObject json = new JSONObject();
                    json.put("orderCode", code);
                    json.put("orderStatus", 2);
                    apiMapper.updateOrderStatus(json);
                    // 获取订单价格
                    Long customerId = jsonObject.getLong("customerId");
                    BigDecimal price = jsonObject.getBigDecimal("price");
                    Long upId = apiMapper.getUpId(customerId);
                    if (upId != null) {
                        JSONObject parent = apiMapper.getCustomerInfoById(upId);
                        String sharePrice = apiMapper.getSharePrice();
                        if (StringUtils.isNotBlank(sharePrice) && parent != null && "2".equals(parent.getString("type"))) {// 普通会员
                            parent.put("lowId", customerId);
                            Integer count = apiMapper.getCustomerShareCnt(parent);
                            if (count == null || count == 0) {
                                JSONObject j = new JSONObject();
                                j.put("id", parent.getString("id"));
                                j.put("lowId", customerId);
                                j.put("money", sharePrice);
                                j.put("type", 1);
                                j.put("createTime", DateUtils.getNowDate());
                                apiMapper.insertShareLog(j);
                                j.put("customerId", parent.getString("id"));
                                j.put("integral", sharePrice);
                                apiMapper.updateCustomerIntegral(j);
                            }
                        }
                        if (parent != null && "1".equals(parent.getString("type"))) {// 推广员
                            JSONObject j = new JSONObject();
                            j.put("id", parent.getString("id"));
                            j.put("lowId", customerId);
                            j.put("money", sharePrice);
                            j.put("type", 1);
                            j.put("createTime", DateUtils.getNowDate());
                            apiMapper.insertShareLog(j);
                            j.put("customerId", parent.getString("id"));
                            j.put("integral", sharePrice);
                            apiMapper.updateCustomerIntegral(j);
                        }
                    }
                    // 修改优惠券状态
                    if (jsonObject.getLong("couponId") != null) {
                        JSONObject object = new JSONObject();
                        object.put("couponId", jsonObject.getLong("couponId"));
                        object.put("useStatus", 1);
                        apiMapper.updateCouponUseStatus(object);
                    }
                    // 添加销售统计
                    jsonObject = new JSONObject();
                    jsonObject.put("price", price == null ? 0 : price);
                    jsonObject.put("money", 0);
                    System.err.println("===================================================================================================");
                    System.err.println(JSONObject.toJSONString(jsonObject));
                    System.err.println("===================================================================================================");
                    apiMapper.updatePricePool(jsonObject);
                }
                resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>" + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
            } else {
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>" + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
            }
            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
            out.write(resXml.getBytes());
            out.flush();
            out.close();
        } else {
            System.out.println("通知签名验证失败");
            return "fail";
        }
        return "success";
    }

    /**
     * 充值微信回调
     *
     * @param request
     * @param response
     * @return
     */
    @Override
    public String wxRechargeNotifyUrl(HttpServletRequest request, HttpServletResponse response) throws Exception {
        InputStream inputStream;
        StringBuffer sb = new StringBuffer();
        inputStream = request.getInputStream();
        String s;
        BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
        while ((s = in.readLine()) != null) {
            sb.append(s);
        }
        in.close();
        inputStream.close();
        Map<String, String> m = new HashMap<String, String>();
        m = com.huizu.common.utils.pay.wxpay.XMLUtil.doXMLParse(sb.toString());
        Map<String, String> packageParams = new HashMap<>();
        Iterator<String> it = m.keySet().iterator();
        while (it.hasNext()) {
            String parameter = it.next();
            String parameterValue = m.get(parameter);
            String v = "";
            if (null != parameterValue) {
                v = parameterValue.trim();
            }
            packageParams.put(parameter, v);
        }
        String key = WeChatConfig.getApikey2();
        // 判断签名是否正确
        if (PayForUtil.isSignatureValid(packageParams, key, "MD5")) {
            String resXml = "";
            if ("SUCCESS".equals(packageParams.get("result_code"))) {
                System.err.println(packageParams);
                String code = packageParams.get("out_trade_no");
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("orderCode", code);
                jsonObject.put("status", 1);
                jsonObject.put("payTime", DateUtils.getNowDate());
                apiMapper.updateRechargeStatus(jsonObject);
                // 修改金额
                JSONObject object = apiMapper.getRechargeInfo(code);
                if (object != null) {
                    apiMapper.updateCustomerMoney(object);
                }
                resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>" + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
            } else {
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>" + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
            }
            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
            out.write(resXml.getBytes());
            out.flush();
            out.close();
        } else {
            System.out.println("通知签名验证失败");
            return "fail";
        }
        return "success";
    }

    /**
     * 充值微信回调
     *
     * @param request
     * @param response
     * @return
     */
    @Override
    public String wxRechargeNotifyUrl2(HttpServletRequest request, HttpServletResponse response) throws Exception {
        InputStream inputStream;
        StringBuffer sb = new StringBuffer();
        inputStream = request.getInputStream();
        String s;
        BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
        while ((s = in.readLine()) != null) {
            sb.append(s);
        }
        in.close();
        inputStream.close();
        Map<String, String> m = new HashMap<String, String>();
        m = com.huizu.common.utils.pay.wxpay.XMLUtil.doXMLParse(sb.toString());
        Map<String, String> packageParams = new HashMap<>();
        Iterator<String> it = m.keySet().iterator();
        while (it.hasNext()) {
            String parameter = it.next();
            String parameterValue = m.get(parameter);
            String v = "";
            if (null != parameterValue) {
                v = parameterValue.trim();
            }
            packageParams.put(parameter, v);
        }
        String key = WeChatConfig.getApikey2();
        // 判断签名是否正确
        if (PayForUtil.isSignatureValid(packageParams, key, "MD5")) {
            String resXml = "";
            if ("SUCCESS".equals(packageParams.get("result_code"))) {
                System.err.println(packageParams);
                String code = packageParams.get("out_trade_no");
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("orderCode", code);
                jsonObject.put("status", 1);
                jsonObject.put("payTime", DateUtils.getNowDate());
                apiMapper.updateCustomerSignStatus(jsonObject);
                // 修改支付状态
                JSONObject json = apiMapper.getCustomerSignInfo(code);
                if (json != null) {
                    json.put("flag", 1);
                    apiMapper.updateCustomerSignFlag(json);
                }
                resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>" + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
            } else {
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>" + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
            }
            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
            out.write(resXml.getBytes());
            out.flush();
            out.close();
        } else {
            System.out.println("通知签名验证失败");
            return "fail";
        }
        return "success";
    }

    /**
     * 支付宝回调
     *
     * @param request
     * @return
     */
    @Override
    public String aliOrderNotifyUrl(HttpServletRequest request) {
        Map<String, String> map = AlipayUtil.alipayNotify(request);
        System.err.println("回调信息：" + map);
        if (map.get("errorCode").equals("0")) {
            String code = map.get("out_trade_no");
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("orderCode", code);
            jsonObject.put("orderStatus", 2);
            apiMapper.updateOrderStatus(jsonObject);
            // 获取订单信息
            jsonObject = apiMapper.getOrderInfo(code);
            if (jsonObject != null) {
                Long customerId = jsonObject.getLong("customerId");
                BigDecimal price = jsonObject.getBigDecimal("price");
                // 添加会员积分
                if (1 == jsonObject.getLong("orderType") || 2 == jsonObject.getLong("orderType")) {
                    JSONObject object = new JSONObject();
                    object.put("customerId", customerId);
                    object.put("integral", price);
                    apiMapper.updateCustomerIntegral(object);
                }
                // 扣除会员积分
                if (4 == jsonObject.getLong("orderType")) {
                    JSONObject object = new JSONObject();
                    object.put("id", customerId);
                    object.put("integral", jsonObject.getLong("integral"));
                    apiMapper.updateOrderIntegral(object);
                }
                // 修改砍价信息
                if (5 == jsonObject.getLong("orderType")) {
                    JSONObject object = new JSONObject();
                    object.put("orderCode", code);
                    object.put("customerId", customerId);
                    object.put("goodsId", jsonObject.getLong("goodsId"));
                    object.put("status", 1);
                    apiMapper.updateCutStatus(object);
                }
                // 添加团购信息
                if (6 == jsonObject.getLong("orderType")) {
                    JSONObject object = new JSONObject();
                    String groupCode = jsonObject.getString("groupCode");
                    object.put("groupFlag", StringUtils.isBlank(groupCode) ? 1 : 0);
                    object.put("groupCode", StringUtils.isBlank(groupCode) ? System.currentTimeMillis() : groupCode);
                    object.put("orderCode", code);
                    object.put("customerId", customerId);
                    object.put("goodsId", jsonObject.getLong("goodsId"));
                    object.put("status", 0);
                    object.put("createDate", DateUtils.getNowDate());
                    apiMapper.addGroup(object);
                    // 修改拼团信息
                    if (object.getLong("groupFlag") == 1) {
                        object.put("groupStatus", 0);
                        apiMapper.updateOrderGroup(object);
                    }
                    // 已参团数量
                    int groupCnt = apiMapper.getGoodsGruopCnt(object.getLong("goodsId"));
                    Integer partakeCnt = apiMapper.getGroupCnt(object.getString("groupCode"));
                    if (groupCnt == (partakeCnt == null ? 0 : partakeCnt)) {
                        object.put("status", 1);
                        apiMapper.updateGroupStatus(object);
                        apiMapper.updateOrderGroupStatus(object);
                    }
                }
                // 修改优惠券状态
                if (jsonObject.getLong("couponId") != null) {
                    JSONObject object = new JSONObject();
                    object.put("couponId", jsonObject.getLong("couponId"));
                    object.put("useStatus", 1);
                    apiMapper.updateCouponUseStatus(object);
                }
                // 添加销售统计
                jsonObject = new JSONObject();
                jsonObject.put("price", price == null ? 0 : price);
                jsonObject.put("money", 0);
                System.err.println("===================================================================================================");
                System.err.println(JSONObject.toJSONString(jsonObject));
                System.err.println("===================================================================================================");
                apiMapper.updatePricePool(jsonObject);
                computeShare(price, customerId, 3);
                // 清空购物车
                /*List<JSONObject> jsonObjectList = apiMapper.getOrderDetails(code);
                if (jsonObjectList != null && jsonObjectList.size() > 0) {
                    List<Long> ids = new ArrayList<>();
                    for (JSONObject object : jsonObjectList) {
                        apiMapper.updateGoodsCnt(object);
                        ids.add(object.getLong("carId"));
                    }
                    if (ids != null && ids.size() > 0) {
                        apiMapper.removeOrderCarByIds(ids);
                    }
                }*/
            }
            return "success";
        } else {
            return "fail";
        }
    }

    /**
     * 支付宝回调
     *
     * @param request
     * @return
     */
    @Override
    public String aliRechargeNotifyUrl(HttpServletRequest request) {
        Map<String, String> map = AlipayUtil.alipayNotify(request);
        System.err.println("回调信息：" + map);
        if (map.get("errorCode").equals("0")) {
            String code = map.get("out_trade_no");
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("orderCode", code);
            jsonObject.put("status", 1);
            jsonObject.put("payTime", DateUtils.getNowDate());
            apiMapper.updateRechargeStatus(jsonObject);
            // 修改金额
            JSONObject object = apiMapper.getRechargeInfo(code);
            if (object != null) {
                apiMapper.updateCustomerMoney(object);
            }
            return "success";
        } else {
            return "fail";
        }
    }

    /**
     * 微信退款
     *
     * @param orderCode
     * @param money
     * @throws Exception
     */
    public Map wxPayBack(String orderCode, double money) throws Exception {
        SortedMap<String, Object> parameters = new TreeMap<String, Object>();
        BigDecimal amount = new BigDecimal(money).multiply(new BigDecimal(100)).setScale(0, RoundingMode.HALF_UP);
        System.out.println("微信退款金额：" + amount.divide(new BigDecimal(100), 2, RoundingMode.HALF_UP) + " 元");
        parameters.put("appid", WeChatConfig.getAppid());
        parameters.put("mch_id", WeChatConfig.getMchid());
        parameters.put("nonce_str", wxPayService.getNonceStr());
        parameters.put("out_trade_no", orderCode);
        parameters.put("out_refund_no", System.currentTimeMillis());
        parameters.put("total_fee", amount);
        parameters.put("refund_fee", amount);
        parameters.put("sign", wxPayService.createSign(parameters, WeChatConfig.getApikey2()));
        String xmlStr = wxPayService.useCert(WXPayConfig.CRET_URL, WeChatConfig.getMchid(), wxPayService.getRequestXml(parameters), WXPayConfig.REFUND);
        SortedMap<String, Object> resultMap = XmlUtil.doXMLParse(xmlStr);
        if (!"SUCCESS".equals(resultMap.get("return_code").toString()) || !"SUCCESS".equals(resultMap.get("result_code").toString())) {
            System.err.println("微信退款失败");
            resultMap.put("code", 0);
        } else if (!wxPayService.isTenpaySign("utf-8", resultMap, WeChatConfig.getApikey2())) {
            System.err.println("微信验证失败");
            resultMap.put("code", 0);
        } else {
            resultMap.put("code", 1);
            // 修改订单状态
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("orderCode", orderCode);
            jsonObject.put("orderStatus", 6);
            apiMapper.updateOrderStatus(jsonObject);
        }
        return resultMap;
    }

    /**
     * 计算分润
     *
     * @param orderPrice
     * @param customerId
     * @param type
     */
    public void computeShare(BigDecimal orderPrice, Long customerId, int type) {
        System.err.println("订单金额：" + orderPrice);
        System.err.println("会员编号：" + customerId);
        if (customerId != null) {
            JSONObject object = apiMapper.getShareInfo();
            Long upId = apiMapper.getUpId(customerId);
            System.err.println("会员上级编号：" + upId);
            if (upId != null) {
                // 计算分润金额
                BigDecimal price = orderPrice.multiply(object.getBigDecimal("vip")).divide(new BigDecimal(100), 2, RoundingMode.HALF_UP);
                object.put("id", upId);
                object.put("money", price);
                System.err.println("会员上级奖励金额：" + price);
                apiMapper.updateCustomerMoney(object);
                // 添加分润记录
                object.put("type", type);
                object.put("lowId", customerId);
                object.put("createTime", DateUtils.getNowDate());
                apiMapper.insertShareLog(object);
            }
        }
    }

    /**
     * 物流信息
     */
    public void ryLogistics() {
        /*List<JSONObject> jsonObjectList = apiMapper.getOrderCodeList();
        if (jsonObjectList != null && jsonObjectList.size() > 0) {
            for (JSONObject jsonObject : jsonObjectList) {
                Date expressTime = jsonObject.getDate("expressTime");
                if (expressTime != null) {
                    try {
                        Date d1 = expressTime;
                        Date d2 = DateUtils.getNowDate();
                        long diff = Math.abs(d2.getTime() - d1.getTime());
                        long diffDays = diff / (24 * 60 * 60 * 1000);
                        if (diffDays > 7) {
                            JSONObject object = new JSONObject();
                            object.put("orderCode", jsonObject.getString("orderCode"));
                            object.put("status", 1);
                            object.put("startTime", DateUtils.getNowDate());
                            // 租赁结束日期
                            LocalDateTime currentDate = LocalDateTime.now();// 获取当前日期
                            LocalDateTime futureDate = currentDate.plusDays(jsonObject.getLong("leaseDays"));// 获取当前日期后N天的日期
                            object.put("endTime", futureDate);
                            apiMapper.updateOrderStatus2(object);
                        }
                        System.out.println("相差天数：" + diffDays);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }*/
    }

    /**
     * 到期判断
     */
    public void ryMature() {
        List<JSONObject> jsonObjectList = apiMapper.getOrderCodeList2();
        if (jsonObjectList != null && jsonObjectList.size() > 0) {
            for (JSONObject jsonObject : jsonObjectList) {
                Date nowTime = DateUtils.getNowDate();
                Date endTime = jsonObject.getDate("endTime");
                if (endTime != null && nowTime.compareTo(endTime) >= 0) {
                    JSONObject json = new JSONObject();
                    json.put("orderCode", jsonObject.getString("orderCode"));
                    json.put("orderStatus", 8);
                    apiMapper.updateOrderStatus(json);
                }
            }
        }
    }

    @Override
    public AjaxResult getMessage(JSONObject jsonObject) {
        if (jsonObject == null || jsonObject.getString("customerId") == null) {
            return AjaxResult.error("请先微信授权登录");
        } else {
            List<JSONObject> object = apiMapper.getMessage(jsonObject.getString("customerId"));
            if (object == null) {
                object = new ArrayList<>();
            }
            return AjaxResult.success(object);
        }
    }

}
