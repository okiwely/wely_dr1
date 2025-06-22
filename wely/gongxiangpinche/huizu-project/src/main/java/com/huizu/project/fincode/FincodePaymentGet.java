package com.huizu.project.fincode;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class FincodePaymentGet {
    public static void main(String[] args) {
        try {
            String apiUrl = "https://api.fincode.jp/v1/payments?pay_type=Card";
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer m_prod_ODAzNWY3NmMtYzI5ZS00MDg4LThlZTQtNzhhNTNkYjRlNGJjNGMzYzQ2MGItOTBhOS00ODE0LTlhZWYtYWIwNDIwMDMzZGUwc18yNDA4MDY2OTExNQ");

            // 读取响应
            int responseCode = conn.getResponseCode();
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // 输出结果
            System.out.println("Response Code: " + responseCode);
            System.out.println("Response: " + response.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
