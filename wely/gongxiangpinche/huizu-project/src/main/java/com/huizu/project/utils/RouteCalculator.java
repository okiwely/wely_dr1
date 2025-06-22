package com.huizu.project.utils;

import com.alibaba.fastjson2.JSONObject;
import com.google.gson.JsonObject;
import com.paypal.http.serializer.Json;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.apache.http.HttpHost;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.InetSocketAddress;
import java.net.Proxy;

/**
 * 获取预计通行费用
 */
public class RouteCalculator {

    private static final MediaType JSON
            = MediaType.parse("application/json; charset=utf-8");

    private static final String API_KEY = "AIzaSyBltUdYH_KjpYkVqRScXv2l6TWhZr3fqLk";

    public static void main(String[] args) throws IOException {
        String origin = "35.6614112,139.6656897"; // 洛杉矶
        String destination = "35.5805389,139.7358156"; // 旧金山

        JSONObject cost = RouteCalculator.getRoute(origin, destination);
        System.err.println(cost);
    }

    /**
     *
     * @param startLonLat
     * @param endLonLat
     * @throws IOException
     */
    public static JSONObject getRoute(String startLonLat,String endLonLat) {
        // 创建代理对象，指定代理服务器的地址和端口
        Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("127.0.0.1", 7897));

        // 创建 OkHttpClient 时传入代理配置
        OkHttpClient client = new OkHttpClient.Builder()
//                .proxy(proxy) // 设置代理
                .build();

        String json = "{\"origin\":{\"location\":{\"latLng\":{\"latitude\":42.340173523716736,\"longitude\":-71.05997968330408}}},\"destination\":{\"location\":{\"latLng\":{\"latitude\":42.075698891472804,\"longitude\":-72.59806562080408}}},\"travelMode\":\"DRIVE\",\"extraComputations\":[\"TOLLS\"]}";
//        String json = "{\"origin\":{\"location\":{\"latLng\":{\"latitude\":42.340173523716736,\"longitude\":-71.05997968330408}}},\"destination\":{\"location\":{\"latLng\":{\"latitude\":42.075698891472804,\"longitude\":-72.59806562080408}}},\"travelMode\":\"DRIVE\",\"extraComputations\":[\"TOLLS\"],\"routeModifiers\":{\"vehicleInfo\":{\"emissionType\":\"GASOLINE\"},\"tollPasses\":[\"US_MA_EZPASSMA\",\"US_WA_GOOD_TO_GO\"]}}";
        String[] starts = startLonLat.split(",");
        String[] ends = endLonLat.split(",");
        JSONObject jsonObject = JSONObject.parseObject(json);
        JSONObject origin = jsonObject.getJSONObject("origin")
                .getJSONObject("location")
                .getJSONObject("latLng");
        origin.put("latitude",starts[0]);
        origin.put("longitude",starts[1]);

        JSONObject destination = jsonObject.getJSONObject("destination")
                .getJSONObject("location")
                .getJSONObject("latLng");
        destination.put("latitude",ends[0]);
        destination.put("longitude",ends[1]);
//        jsonObject.put("languageCode","ja");

        RequestBody body = RequestBody.create(JSON,jsonObject.toString());

        Request request = new Request.Builder()
                .url("https://routes.googleapis.com/directions/v2:computeRoutes")
                .addHeader("Content-Type", "application/json")
                .addHeader("X-Goog-Api-Key", API_KEY)
                .addHeader("X-Goog-FieldMask", "routes.duration,routes.distanceMeters,routes.travelAdvisory.tollInfo,routes.legs.travelAdvisory.tollInfo")
                .post(body)
                .build();
        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);
            // 处理响应
            JSONObject object = JSONObject.parseObject(response.body().string())
                    .getJSONArray("routes")
                    .getJSONObject(0);
            System.err.println(object);
            BigDecimal cost = BigDecimal.ZERO;
            BigDecimal distanceMeters = BigDecimal.ZERO;
            BigDecimal duration = BigDecimal.ZERO;
            try {
                cost = object.getJSONObject("travelAdvisory")
                        .getJSONObject("tollInfo")
                        .getJSONArray("estimatedPrice")
                        .getJSONObject(0)
                        .getBigDecimal("units");
            }catch (Exception e){}
            try {
                distanceMeters = object.getBigDecimal("distanceMeters").divide(BigDecimal.valueOf(1000),0,BigDecimal.ROUND_UP);;
            }catch (Exception e){}
            try {
                duration = new BigDecimal(object.getString("duration").replace("s","")).multiply(BigDecimal.valueOf(1000));
            }catch (Exception e){}

            JSONObject dataObject = new JSONObject();
            dataObject.put("cost", cost);
            dataObject.put("distance", distanceMeters);
            dataObject.put("duration", duration);
            return dataObject;
        }catch (Exception e){
            return new JSONObject();
        }
    }

}
