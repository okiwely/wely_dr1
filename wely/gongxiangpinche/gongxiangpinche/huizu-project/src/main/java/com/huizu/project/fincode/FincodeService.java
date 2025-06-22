package com.huizu.project.fincode;

import com.alibaba.fastjson2.JSONObject;
import lombok.var;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

@Service
public class FincodeService {

    private static final String API_URL = "https://api.fincode.jp/v1/payments";
    private static final String API_KEY = "Bearer m_prod_ODAzNWY3NmMtYzI5ZS00MDg4LThlZTQtNzhhNTNkYjRlNGJjNGMzYzQ2MGItOTBhOS00ODE0LTlhZWYtYWIwNDIwMDMzZGUwc18yNDA4MDY2OTExNQ";


    public static void main(String[] args) throws Exception {
        JSONObject creditCardPayment = new FincodeService().createCreditCardPayment("1", "221");
        System.err.println(creditCardPayment);
//        new FincodeService().payCardPayment();
//        new FincodeService().processPayment1("31333937643662656163363131323436303564333536323638663063303732353432636131666162343763346663623730626539393832353863346431323036",1);
    }
    // 创建信用卡支付请求
    public JSONObject createCreditCardPayment(String orderCode,String amount) {
        try {
            CloseableHttpClient httpClient = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(API_URL);
            httpPost.setHeader("Authorization", API_KEY);
            httpPost.setHeader("Content-Type", "application/json");

            JSONObject transaction = new JSONObject();
            transaction.put("id", orderCode);
            transaction.put("pay_type", "Card");
            transaction.put("job_code", "AUTH");
            transaction.put("amount", amount);

            StringEntity entity = new StringEntity(transaction.toString());
            httpPost.setEntity(entity);
            var response = httpClient.execute(httpPost);
            String string = EntityUtils.toString(response.getEntity());
            return JSONObject.parseObject(string);
        }catch (Exception e){
            return null;
        }
    }

    public String processPayment(String token, int amount) throws Exception {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(API_URL);
        httpPost.setHeader("Authorization",API_KEY);
        httpPost.setHeader("Content-Type", "application/json");

        JSONObject transaction = new JSONObject();
        transaction.put("pay_type", "Card");
        transaction.put("access_id", "a_8Vu7v4o4QAW7KZcK0hMh5Q");
        transaction.put("id", "11111111111");
        transaction.put("amount", amount);
        transaction.put("token", token);
        transaction.put("method", "1");

        httpPost.setEntity(new StringEntity(transaction.toString()));

        // 执行请求并获取响应
        var response = httpClient.execute(httpPost);
        System.err.println(EntityUtils.toString(response.getEntity()));
        return EntityUtils.toString(response.getEntity());
    }

    // 信用卡支付请求
    public Boolean payCardPayment(String orderCode,String amount,String token) {

        JSONObject creditCardPayment = this.createCreditCardPayment(orderCode, amount);
        if (creditCardPayment == null) {
            return false;
        }
        try {
            String id = creditCardPayment.getString("id");
            String access_id = creditCardPayment.getString("access_id");


            CloseableHttpClient httpClient = HttpClients.createDefault();
            HttpPut httpPost = new HttpPut(API_URL + "/"+ id);
            httpPost.setHeader("Authorization", API_KEY);
            httpPost.setHeader("Content-Type", "application/json");

            JSONObject transaction = new JSONObject();
            transaction.put("pay_type", "Card");
            transaction.put("access_id", access_id);
            transaction.put("id", id);
            transaction.put("token", token);
            transaction.put("method", "1");
            StringEntity entity = new StringEntity(transaction.toString());
            httpPost.setEntity(entity);
            var response = httpClient.execute(httpPost);
            System.err.println(EntityUtils.toString(response.getEntity()));
            return true;
        }catch (Exception e){
            return false;
        }

    }


    public String processPayment1(String token, int amount) throws Exception {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(API_URL+ "/a_dVVY1irZQ7G6PBQ-JONNjQ");
        httpPost.setHeader("Authorization", API_KEY);
        httpPost.setHeader("Content-Type", "application/json");

        // 构建支付请求的 JSON 数据
        String jsonPayload = "{" + "\"pay_type\": \"Card\","
                + "\"id\": \"order-id-test\","
                + "\"token\": \"" + token + "\","
                + "\"amount\": \"" + amount + "\","
                + "\"method\": \"1\""  + "}";

        httpPost.setEntity(new StringEntity(jsonPayload));

        // 执行请求并获取响应
        var response = httpClient.execute(httpPost);
        System.err.println(EntityUtils.toString(response.getEntity()));
        return EntityUtils.toString(response.getEntity());
    }

}
