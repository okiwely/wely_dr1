package com.huizu.common.enums;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Method;
import java.util.*;

/**
 * <p>
 * 封装枚举常用的方法
 * </p>
 *
 * @author lixueju
 * @since 2019/3/14 0:22
 */
public abstract class EnumMethod {

    private static final Logger logger = LoggerFactory.getLogger(EnumMethod.class);

    // 以Map形式返回数据
    public static Map<Integer, String> getCodeAndDesc(Class<? extends IEnum> clazz) {
        Map<Integer, String> result = new HashMap<Integer, String>();
        try {
            for (Object enu : Arrays.asList(clazz.getEnumConstants())) {
                Integer code = null;
                String desc = null;
                for (Method method : clazz.getDeclaredMethods()) {
                    if (method.getName().equals(FieldType.code.name())) {
                        code = (Integer) method.invoke(enu);
                    }
                    if (method.getName().equals(FieldType.desc.name())) {
                        desc = (String) method.invoke(enu);
                    }
                }
                result.put(code, desc);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return result;
    }

    // 对枚举封装为List，方便返回所有类型所为选项
    public static List<Map<String, String>> getList(Class<? extends IEnum> clazz) {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        try {
            for (Object obj : Arrays.asList(clazz.getEnumConstants())) {
                Map<String, String> map = new HashMap<String, String>();
                for (Method method : clazz.getDeclaredMethods()) {
                    if (method.getName().equals("code")) {
                        map.put("code", method.invoke(obj) + "");
                    }
                    if (method.getName().equals("desc")) {
                        map.put("desc", method.invoke(obj) + "");
                    }
                    if (method.getName().equals("value")) {
                        map.put("value", method.invoke(obj) + "");
                    }
                }
                list.add(map);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return list;
    }

    // 以Map形式返回数据
    public static Map<Integer, String> getCodeAndValue(Class<? extends IEnum> clazz) {
        Map<Integer, String> result = new HashMap<Integer, String>();
        try {
            for (Object enu : Arrays.asList(clazz.getEnumConstants())) {
                Integer code = null;
                String value = null;
                for (Method method : clazz.getDeclaredMethods()) {
                    if (method.getName().equals(FieldType.code.name())) {
                        code = (Integer) method.invoke(enu);
                    }
                    if (method.getName().equals(FieldType.value.name())) {
                        value = (String) method.invoke(enu);
                    }
                }
                result.put(code, value);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return result;
    }

    /**
     * 根据枚举名,获取枚举结果集合，并封装为list
     * 仅适用于TableFieldEnum类里列举的枚举
     *
     * @param enumClassName
     * @return
     */
    public static List<Map<String, String>> getEnumListByName(String enumClassName) {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        try {
            Class clazzEnum = Class.forName("com.xiukelai.common.enums.TableFieldEnum");
            Class innerClazz[] = clazzEnum.getDeclaredClasses();
            //遍历内部类
            for (Class e : innerClazz) {
                //获取内部类的类名
                String simpleName = e.getSimpleName();
                if (simpleName.equals(enumClassName)) {
                    //判断类是不是枚举类
                    if (e.isEnum()) {
                        Map<String, String> map = null;
                        //反射获取枚举类
                        Class<Enum> clazz = (Class<Enum>) Class.forName(e.getName());
                        //获取所有枚举实例
                        Enum[] enumConstants = clazz.getEnumConstants();
                        //根据方法名获取方法
                        Method code = clazz.getMethod("code");
                        Method desc = clazz.getMethod("desc");
                        for (Enum en : enumConstants) {
                            //执行枚举方法获得枚举实例对应的值
                            map = new HashMap<String, String>();
                            map.put("code", code.invoke(en) + "");
                            map.put("desc", desc.invoke(en) + "");
                            list.add(map);
                        }
                    }
                }
            }
        } catch (Exception e) {
            list = new ArrayList<Map<String, String>>();
            logger.error(e.getMessage(), e);
        }
        return list;
    }

    public static void main(String[] args) {
        List<Map<String, String>> list = getEnumListByName("MessageTemplateOfType");
        for (Map<String, String> map : list) {
            System.out.println(map);
        }
    }

    public enum FieldType {
        code, desc, value;
    }
}
