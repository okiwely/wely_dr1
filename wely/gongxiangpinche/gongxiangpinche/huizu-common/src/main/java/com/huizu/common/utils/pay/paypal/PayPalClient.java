package com.huizu.common.utils.pay.paypal;

import com.paypal.core.PayPalEnvironment;
import com.paypal.core.PayPalHttpClient;


import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Iterator;

/**
 * 1. PayPalClient（请求PayPal api的工具类）
 */
public class PayPalClient {

    private static final Logger log = LoggerFactory.getLogger(PayPalClient.class);

    public PayPalHttpClient client(String mode, String clientId, String clientSecret) {
       log.info("mode={}, clientId={}, clientSecret={}", mode, clientId, clientSecret);
       PayPalEnvironment environment = mode.equals("live") ? new PayPalEnvironment.Live(clientId, clientSecret) : new PayPalEnvironment.Sandbox(clientId, clientSecret);
       return new PayPalHttpClient(environment);
    }

    /**
    * @param jo
    * @param pre
    * @return
    */
    public String prettyPrint(JSONObject jo, String pre) {
       Iterator<?> keys = jo.keys();
       StringBuilder pretty = new StringBuilder();
       while (keys.hasNext()) {
           String key = (String) keys.next();
           pretty.append(String.format("%s%s: ", pre, StringUtils.capitalize(key)));
           if (jo.get(key) instanceof JSONObject) {
               pretty.append(prettyPrint(jo.getJSONObject(key), pre + "\t"));
           } else if (jo.get(key) instanceof JSONArray) {
               int sno = 1;
               for (Object jsonObject : jo.getJSONArray(key)) {
                   pretty.append(String.format("\n%s\t%d:\n", pre, sno++));
                   pretty.append(prettyPrint((JSONObject) jsonObject, pre + "\t\t"));
               }
           } else {
               pretty.append(String.format("%s\n", jo.getString(key)));
           }
       }
       return pretty.toString();
    }
}
