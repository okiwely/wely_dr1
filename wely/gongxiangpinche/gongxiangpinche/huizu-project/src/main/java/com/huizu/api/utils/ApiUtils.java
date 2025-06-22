package com.huizu.api.utils;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.huizu.api.entity.Code2sessionResponse;
import com.huizu.common.aliyun.AliyunFileUtils;
import com.huizu.common.config.WeChatConfig;
import com.huizu.common.constant.Constants;
import com.huizu.common.utils.HttpGet;
import com.huizu.common.utils.StringUtil;
import com.huizu.common.utils.StringUtils;
import com.huizu.common.utils.http.HttpUtils;
import com.huizu.common.utils.pay.wxpay.WXPayConfig;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  api工具类
 */
public class ApiUtils {


    /**
     * 获取二维码地址路径
     *
     * @param url
     * @param code
     * @param access_token
     * @return
     */
    private static String getQRCode(String url, String code, String access_token) {
        RestTemplate rest = new RestTemplate();
        Map<String, Object> param = new HashMap<>();
        param.put("scene", code);
        param.put("page", WXPayConfig.PATH);
        param.put("width", 430);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
        HttpEntity requestEntity = new HttpEntity(param, headers);
        ResponseEntity<byte[]> entity = rest.exchange(url + "?access_token=" + access_token, HttpMethod.POST, requestEntity, byte[].class);
        byte[] result = entity.getBody();
        return AliyunFileUtils.uploadFile(result, code + "-" + System.currentTimeMillis() + ".png");
    }

    /**
     * 添加默认参数
     *
     * @return
     */
    private static Map<String, Object> addToken() {
        Map<String, Object> map = new HashMap<>();
        map.put("appid", WeChatConfig.getAppid());
        map.put("secret", WeChatConfig.getSecret());
        map.put("grant_type", WXPayConfig.GRANT_TYPE);
        return map;
    }

    /**
     * 添加分享码信息
     *
     * @return
     */
    public static String addQrcode(JSONObject jsonObject) {
        Map<String, Object> map = addToken();
        String access_token = HttpUtils.sendGet(WXPayConfig.TOKEN, StringUtil.replace(map.toString()));
        JSONObject object = JSON.parseObject(access_token, JSONObject.class);
        access_token = object.get("access_token").toString();
        String qrcode = getQRCode(WXPayConfig.LIMIT, jsonObject.getString("id"), access_token);
        return qrcode;
    }

    /**
     * 添加砍价商品信息
     *
     * @return
     */
    public static String addCutQrcode(JSONObject jsonObject) {
        Map<String, Object> map = addToken();
        String access_token = HttpUtils.sendGet(WXPayConfig.TOKEN, StringUtil.replace(map.toString()));
        JSONObject object = JSON.parseObject(access_token, JSONObject.class);
        access_token = object.get("access_token").toString();
        String qrcode = getCutQRCode(WXPayConfig.LIMIT, jsonObject.getLong("customerId"), jsonObject.getLong("goodsId"), access_token);
        return qrcode;
    }
    /**
     * 获取砍价商品二维码
     *
     * @param url
     * @param customerId
     * @param goodsId
     * @param access_token
     * @return
     */
    private static String getCutQRCode(String url, Long customerId, Long goodsId, String access_token) {
        RestTemplate rest = new RestTemplate();
        Map<String, Object> param = new HashMap<>();
        param.put("scene", customerId + "," + goodsId);
        param.put("page", WXPayConfig.CUT_PATH);
        param.put("width", 430);
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
        HttpEntity requestEntity = new HttpEntity(param, headers);
        ResponseEntity<byte[]> entity = rest.exchange(url + "?access_token=" + access_token, HttpMethod.POST, requestEntity, byte[].class);
        byte[] result = entity.getBody();
        return AliyunFileUtils.uploadFile(result, System.currentTimeMillis() + ".png");
    }

    /**
     * 开启云函数
     *
     * @param jsonObject
     */
    public static String openCloudUser(JSONObject jsonObject) throws Exception {
        String url = "https://a26e1b29-8712-41b9-82fa-1660f1844e6e.bspapp.com/http/userr";
        String param = "type=0&password=111111&phone=" + URLEncoder.encode(jsonObject.getString("phone"), Constants.UTF8) + "&nickname=" + URLEncoder.encode(jsonObject.getString("phone"), Constants.UTF8) + "&username=" + URLEncoder.encode(jsonObject.getString("phone"), Constants.UTF8) + "&avatar=" + jsonObject.getString("avatar");
        String result = HttpGet.sendGet(url, param);
        if (StringUtils.isBlank(result)) {
            return "";
        } else {
            JSONObject object = JSONObject.parseObject(result);
            return object.getString("uid");
        }
    }

    /**
     * 根据code获取小程序session_key
     */
    public static Code2sessionResponse code2sessionForMini(String code) {
        RestTemplate restTemplate1 = getRestTemplate();
        String url = "https://api.weixin.qq.com/sns/jscode2session?appid={1}&secret={2}&js_code={3}&grant_type={4}";
        String jsonStr = restTemplate1.getForObject(url, String.class, WeChatConfig.getAppid(), WeChatConfig.getSecret(), code, "authorization_code");
        return JSONObject.parseObject(jsonStr, Code2sessionResponse.class);
    }


    private static RestTemplate getRestTemplate() {
        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        requestFactory.setConnectTimeout(3000);
        requestFactory.setReadTimeout(3000);
        RestTemplate restTemplate1 = new RestTemplate(requestFactory);
        return restTemplate1;
    }

    /**
     * 将字符串转为数组
     *
     * @param jsonObject
     * @return
     */
    public static JSONObject stringToArray(JSONObject jsonObject) {
        if (jsonObject == null) {
            return jsonObject;
        } else {
            if (jsonObject.containsKey("images")) {
                jsonObject.put("images", jsonObject.getJSONArray("images"));
            }
            return jsonObject;
        }
    }

    /**
     * 添加基础信息
     *
     * @param jsonObject
     * @return
     */
    public static JSONObject createEntity(JSONObject jsonObject) {
        jsonObject.put("createBy", "admin");
        jsonObject.put("createTime", new Date());
        jsonObject.put("updateBy", "admin");
        jsonObject.put("updateTime", new Date());
        jsonObject.put("delFlag", 0);
        return jsonObject;
    }


    /**
     * 生成邀请码
     *
     * @return
     */
    public static String getCode() {
        String code = "" + (int) ((Math.random() * 9 + 1) * 100000);
        return code;
    }

    public static void main(String[] args) {
//        String lonLat = getLonLat("祥泰新河湾", "济南市");
//        System.err.println(lonLat);
        Map<String, String> adressByLocation = findAdressByLocation("139.714222,35.736156");
        System.err.println(adressByLocation);
    }

    public static String getLonLat(String address, String city){
        if (StringUtils.isNotBlank(address)) {
            String addr = HttpUtils.sendGet("https://restapi.amap.com/v3/geocode/geo",
                    "address=" + address +
                            "&city=" + city +
                            "&output=JSON&key=b1808aeee5ee0d90f3457171aef54b1c");
            if (StringUtils.isNotBlank(addr)) {
                JSONObject jsonObject = JSONObject.parseObject(addr);
                String geocodes = jsonObject.getString("geocodes");
                List<JSONObject> jsonObjects = JSONArray.parseArray(geocodes, JSONObject.class);
                if (jsonObjects != null && jsonObjects.size() > 0) {
                    jsonObject = jsonObjects.get(0);
                    String location = jsonObject.getString("location");
                    return location;
//                    if (StringUtils.isNotBlank(location)) {
//                        String[] addressList = location.split(",");
//                        if (addressList != null && addressList.length > 1) {
//                            BigDecimal lon = new BigDecimal(addressList[0]);// 经度
//                            BigDecimal lat = new BigDecimal(addressList[1]);// 维度
//                            return lon +  "," + lat;
//                        }
//                    }
                }
            }
        }
        return "";
    }

    /**
     * 调用地图api，通过location查询areaAdcode
     * @return
     * @throws Exception
     */
    public static Map<String,String> findAdressByLocation(String location){
        Map<String, String> resuleMap = new HashMap<>();
        String areaAdcode = null;
        String accessAddress = null;
        String key ="b1808aeee5ee0d90f3457171aef54b1c";
        String apiurl = "https://restapi.amap.com/v3/geocode/regeo?location="
                + location +"&poitype=&key="
                + key +"&radius=100&extensions=all&batch=false&roadlevel=0";
        String result = HttpUtils.sendGet(apiurl);
        JSONObject jsonObject = JSONObject.parseObject(result);

        if(jsonObject.getInteger("status") == 1){
            JSONObject regeocodes = jsonObject.getJSONObject("regeocode");
            JSONObject addressComponent = regeocodes.getJSONObject("addressComponent");
            areaAdcode = addressComponent.getString("adcode");
            accessAddress = regeocodes.getString("formatted_address");
            resuleMap.put("areaAdcode", areaAdcode);//行政编码
            resuleMap.put("accessAddress", accessAddress);//地址

        }else{
            resuleMap.put("areaAdcode", areaAdcode);
            resuleMap.put("accessAddress", accessAddress);
            resuleMap.put("code", "500");
            resuleMap.put("message", "高德api查询异常！");
            return resuleMap;
        }
        resuleMap.put("code", "200");
        resuleMap.put("message", "调用高德api成功！");
        return resuleMap;
    }


}
