package com.huizu.common.utils;


import com.alibaba.fastjson2.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * wchat大转盘抽奖活动
 *
 * @author yanst 2016/4/23 9:23
 */
public class BigWheelDrawUtil {
    /**
     * 生成奖项
     *
     * @return
     */
    public static WchatLotteryDomain generateAward(List<JSONObject> jsonObjectList) {
        if (jsonObjectList == null || jsonObjectList.size() == 0) {
            return null;
        } else {
            List<WchatLotteryDomain> initData = new ArrayList<>();
            for (JSONObject jsonObject : jsonObjectList) {
                Integer goodsId = jsonObject.getInteger("goodsId");
                String price = jsonObject.getString("goodsIntegral");
                Integer probability = jsonObject.getInteger("probability");
                WchatLotteryDomain wchatLotteryDomain = new WchatLotteryDomain(goodsId, price, probability);
                initData.add(wchatLotteryDomain);
            }
            long result = randomnum(1, 100);
            int line = 0;
            int temp = 0;
            WchatLotteryDomain returnobj = null;
            int index = 0;
            for (int i = 0; i < initData.size(); i++) {
                WchatLotteryDomain obj2 = initData.get(i);
                int c = obj2.getV();
                temp = temp + c;
                line = 100 - temp;
                if (c != 0) {
                    if (result > line && result <= (line + c)) {
                        returnobj = obj2;
                        break;
                    }
                }
            }
            return returnobj;
        }
    }

    private static long randomnum(int smin, int smax) {
        int range = smax - smin;
        double rand = Math.random();
        return (smin + Math.round(rand * range));
    }

}
