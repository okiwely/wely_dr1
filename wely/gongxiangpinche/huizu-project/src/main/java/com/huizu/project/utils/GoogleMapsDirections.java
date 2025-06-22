package com.huizu.project.utils;

import com.alibaba.fastjson2.JSONObject;
import okhttp3.OkHttpClient;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.math.BigDecimal;

public class GoogleMapsDirections {
    private static final String API_KEY = "AIzaSyBltUdYH_KjpYkVqRScXv2l6TWhZr3fqLk";

    public static void main(String[] args) {
        JSONObject address = GoogleMapsDirections.getAddress();
        System.err.println(address);
    }

    //获取公里数和预计时间（毫秒）
    public static JSONObject getAddress() {
        String origin = "35.99708497787932,139.96398984374997"; // 洛杉矶
        String destination = "36.0385535012228,140.67834531249997"; // 旧金山

        String url = String.format(
            "https://maps.googleapis.com/maps/api/directions/json?" +
            "origin=%s&destination=%s&key=%s",
            origin, destination, API_KEY
        );

        // 创建代理服务器的地址和端口对象
        HttpHost proxyAddress = new HttpHost("127.0.0.1", 7897);

        try {
            // 创建并配置HttpClient实例
            CloseableHttpClient httpClient = HttpClients.custom()
                    .setDefaultRequestConfig(RequestConfig.custom()
                            .setProxy(proxyAddress) // 设置HTTP代理
                            .build())
                    .build();

            HttpGet request = new HttpGet(url);

            HttpResponse response = httpClient.execute(request);
            String jsonResponse = EntityUtils.toString(response.getEntity());

            JSONObject object = JSONObject.parseObject(jsonResponse);

            if ("OK".equals(object.getString("status"))) {
                // 在这里处理 JSON 响应，例如使用 Gson 或 Jackson 库
                JSONObject legs = object.getJSONArray("routes")
                        .getJSONObject(0)
                        .getJSONArray("legs")
                        .getJSONObject(0);
                BigDecimal distance = legs.getJSONObject("distance").getBigDecimal("value").divide(BigDecimal.valueOf(1000),0,BigDecimal.ROUND_UP);
                BigDecimal duration = legs.getJSONObject("duration").getBigDecimal("value").multiply(BigDecimal.valueOf(1000));
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("distance", distance);
                jsonObject.put("duration", duration);
                return jsonObject;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new JSONObject();
    }
}
