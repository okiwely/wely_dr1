package com.huizu.common.utils;

import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jiguang.common.resp.ResponseWrapper;
import cn.jmessage.api.chatroom.ChatRoomClient;
import cn.jmessage.api.chatroom.CreateChatRoomResult;
import cn.jmessage.api.common.model.RegisterInfo;
import cn.jmessage.api.common.model.RegisterPayload;
import cn.jmessage.api.common.model.chatroom.ChatRoomPayload;
import cn.jmessage.api.user.UserClient;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

public class JImUtils {
    private static final Logger log = LoggerFactory.getLogger(JImUtils.class);

    private static final String appKey = "448ee570a8e6edb9f20469f5";
    private static final String masterSecret = "47eda7c99a322004342765b9";

    /**
     * 创建用户
     *
     * @param userName 用户名
     * @param passWord 密码
     * @return
     */
    public static Boolean registerUser(String userName, String passWord) {
        Boolean flag = false;
        UserClient client = new UserClient(appKey, masterSecret);
        try {
            List<RegisterInfo> users = new ArrayList<>();
            RegisterInfo user = RegisterInfo.newBuilder()
                    .setUsername(userName)
                    .setPassword(passWord)
                    .build();
            users.add(user);
            RegisterInfo[] regUsers = new RegisterInfo[users.size()];
            RegisterPayload payload = RegisterPayload.newBuilder()
                    .addUsers(users.toArray(regUsers)).build();
            ResponseWrapper registerUsers = client.registerUsers(payload);
            System.out.println("极光注册返回参数:" + registerUsers);
            JSONArray objects = JSON.parseArray(registerUsers.responseContent);
            JSONObject jsonObject = objects.getJSONObject(0);
            String error = jsonObject.getString("error");
            return StringUtils.isEmpty(error);
        } catch (APIConnectionException e) {
            log.error(e.getLocalizedMessage());
        } catch (APIRequestException e) {
            log.error(e.getLocalizedMessage());
        }
        return flag;
    }

    /**
     * 删除用户
     *
     * @param userName
     * @throws APIConnectionException
     * @throws APIRequestException
     */
    public static void deleteUser(String userName) throws APIConnectionException, APIRequestException {
        UserClient client = new UserClient(appKey, masterSecret);
        client.deleteUser(userName);
    }

    /**
     * 创建聊天室
     *
     * @param charName
     * @param userId
     * @return
     * @throws APIConnectionException
     * @throws APIRequestException
     */
    public static String createChatRoom(String charName, Long userId) throws APIConnectionException, APIRequestException {
        String resStr = "";
        ChatRoomClient client = new ChatRoomClient(appKey, masterSecret);
        ChatRoomPayload chatRoomPayload = new ChatRoomPayload(charName, String.format("%9d", userId).replace(" ", "0"), null, null, 1);
        CreateChatRoomResult chatRoom = client.createChatRoom(chatRoomPayload);
        Long chatroom_id = chatRoom.getChatroom_id();
        resStr = String.valueOf(chatroom_id);
        return resStr;
    }

    /**
     * 删除聊天室
     *
     * @param roomId
     * @return
     * @throws APIConnectionException
     * @throws APIRequestException
     */
    public static Boolean deleteChatRoom(Long roomId) throws APIConnectionException, APIRequestException {
        ChatRoomClient client = new ChatRoomClient(appKey, masterSecret);
        ResponseWrapper responseWrapper = client.deleteChatRoom(roomId);
        log.info("删除聊天室返回: " + responseWrapper);
        return 204 == responseWrapper.responseCode;
    }

    /**
     * 将用户移除聊天室
     *
     * @param roomId
     * @param members
     * @return
     * @throws APIConnectionException
     * @throws APIRequestException
     */
    public static Boolean leaveChatRoom(Long roomId, String... members) throws APIConnectionException, APIRequestException {
        ChatRoomClient client = new ChatRoomClient(appKey, masterSecret);
        ResponseWrapper responseWrapper = client.removeChatRoomMembers(roomId, members);
        log.info("移除聊天室成员返回: " + responseWrapper);
        return 204 == responseWrapper.responseCode;
    }

    /**
     * 加入聊天室
     *
     * @param roomId
     * @param members
     * @return
     * @throws APIConnectionException
     * @throws APIRequestException
     */
    public static Boolean addChatRoomMember(Long roomId, String... members) throws APIConnectionException, APIRequestException {
        ChatRoomClient client = new ChatRoomClient(appKey, masterSecret);
        ResponseWrapper responseWrapper = client.addChatRoomMember(roomId, members);
        return 204 == responseWrapper.responseCode;
    }

    /**
     * 功能测试
     *
     * @param args
     */
    public static void main(String[] args) {
        registerUser("xiangyun-user-10", "123456");
//        try {
//            deleteUser("xiangyun-user-1");
//        } catch (APIConnectionException e) {
//            e.printStackTrace();
//        } catch (APIRequestException e) {
//            e.printStackTrace();
//        }
    }

}
