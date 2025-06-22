package com.huizu.common.utils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HttpGet {
    /**
     * 向指定 URL 发送get方法的请求
     *
     * @param url
     * @param param
     * @return 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL(urlNameString);
            URLConnection connection = realUrl.openConnection();
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            connection.connect();
            Map<String, List<String>> map = connection.getHeaderFields();
            in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 向指定 URL 发送POST方法的请求
     *
     * @param url
     * @param param
     * @return 所代表远程资源的响应结果
     * @author lvxb
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            URLConnection conn = realUrl.openConnection();
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setDoOutput(true);
            conn.setDoInput(true);
            out = new PrintWriter(conn.getOutputStream());
            out.print(param);
            out.flush();
            in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 美团POST分发请求
     *
     * @param url
     * @param params
     * @return
     */
    public static String sendPostMT(String url, String params) throws Exception {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setRequestMethod("POST");
            conn.setConnectTimeout(4 * 1000);
            conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            conn.setDoOutput(true);
            conn.setDoInput(true);
            out = new PrintWriter(new OutputStreamWriter(conn.getOutputStream(), "utf-8"));
            out.println(params);
            out.flush();
            InputStream is = null;
            if (conn.getResponseCode() >= 400) {
                is = conn.getErrorStream();
            } else {
                is = conn.getInputStream();
            }
            in = new BufferedReader(new InputStreamReader(is, "utf-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
            throw new IOException("POST MT " + e.getMessage());
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                throw new IOException("POST MT 流关闭异常");
            }
        }
        return result;
    }

    /**
     * 美团POST分发请求
     *
     * @param url
     * @param params
     * @return
     */
    public static String sendgetElm(String url, String params) throws Exception {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(4 * 1000);
            conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            conn.setDoOutput(true);
            conn.setDoInput(true);
            out = new PrintWriter(new OutputStreamWriter(conn.getOutputStream(), "utf-8"));
            out.println(params);
            out.flush();
            InputStream is = null;
            if (conn.getResponseCode() >= 400) {
                is = conn.getErrorStream();
            } else {
                is = conn.getInputStream();
            }
            in = new BufferedReader(new InputStreamReader(is, "utf-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
            throw new IOException("POST MT " + e.getMessage());
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                throw new IOException("POST MT 流关闭异常");
            }
        }
        return result;
    }


    /**
     * @throws IOException @throws ProtocolException @throws MalformedURLException
     * @Title: openCallBackUrl @Description:
     * TODO(这里用一句话描述这个方法的作用) @param: @param url @param: @param
     * params @param: @return @return: Map @throws
     */
    public static Map openCallBackUrl(String url, String params) throws IOException {
        Map result = new HashMap();
        URL service = new URL(url);
        HttpURLConnection httpURLConnection = (HttpURLConnection) service.openConnection();
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setUseCaches(false);

        StringBuffer param = new StringBuffer();
        param.append(params);
        OutputStream os = httpURLConnection.getOutputStream();
        os.write(param.toString().getBytes("utf-8"));
        os.flush();
        os.close();

        InputStream is = httpURLConnection.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
        StringBuffer sb = new StringBuffer();
        do {
            sb.append(br.readLine());
        } while (br.read() != -1);
        br.close();
        is.close();
        return result;
    }

}
