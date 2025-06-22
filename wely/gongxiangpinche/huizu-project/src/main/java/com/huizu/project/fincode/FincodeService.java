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
        Boolean b = new FincodeService().payCardPayment("1728438539431", "102", "37653363363763303366333333353934316131363639313038373737316134396237646365616130393738373266393564636662326230633731303036363763");
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

    // 信用卡支付请求
    public Boolean payCardPayment(String orderCode,String amount,String token) {

        JSONObject creditCardPayment = this.createCreditCardPayment(orderCode, amount);
        if (creditCardPayment == null || creditCardPayment.getString("errors") != null) {
            System.err.println(creditCardPayment.getString("errors"));
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
            System.err.println("111"+EntityUtils.toString(response.getEntity()));

            HttpPut payPut = new HttpPut("https://api.fincode.jp/v1/payments/"+ id +"/capture");
            payPut.setHeader("Authorization", API_KEY);
            payPut.setHeader("Content-Type", "application/json");

            JSONObject transaction1 = new JSONObject();
            transaction1.put("pay_type", "Card");
            transaction1.put("access_id", access_id);
            transaction1.put("id", id);
            transaction1.put("token", token);
            transaction1.put("method", "1");
            StringEntity entity1 = new StringEntity(transaction1.toString());
            payPut.setEntity(entity1);
            var response1 = httpClient.execute(payPut);
            System.err.println("222"+EntityUtils.toString(response1.getEntity()));
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
