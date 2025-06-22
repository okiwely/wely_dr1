package com.huizu.common.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

public class ImageUtils {

    /**
     * 宣传图片合成
     *
     * @param width
     * @param height
     * @param backgroundImage
     * @param propagandaImage
     * @param qrcodeImage
     * @param goodsImage
     * @param name
     * @param phone
     * @param path
     * @return
     */
    public static File overlapImage(int width, int height, String backgroundImage, String propagandaImage, String goodsImage, String qrcodeImage, String name, String phone, String path) {
        try {
            BufferedImage background = resizeImage(width, height, ImageIO.read(getFile(backgroundImage)));
            BufferedImage propaganda = resizeImage(width, height - 250, ImageIO.read(getOssFile(propagandaImage)));
            BufferedImage goods = resizeImage(150, 150, ImageIO.read(getOssFile(goodsImage)));
            BufferedImage qrcode = resizeImage(150, 150, ImageIO.read(getOssFile(qrcodeImage)));
            Graphics2D g = background.createGraphics();
            g.drawImage(propaganda, 0, 0, propaganda.getWidth(), propaganda.getHeight(), null);
            g.drawImage(goods, width - 705, height - 200, goods.getWidth(), goods.getHeight(), null);
            g.drawImage(qrcode, width - 165, height - 205, qrcode.getWidth(), qrcode.getHeight(), null);
            g.setColor(Color.black);
            g.setFont(new Font("微软雅黑", Font.PLAIN, 26));
            g.drawString(name, width - 525, height - 145);
            g.setFont(new Font("微软雅黑", Font.PLAIN, 22));
            g.setColor(Color.black);
            g.drawString(phone, width - 525, height - 95);
            g.dispose();
            File file = new File(path);
            ImageIO.write(background, "png", file);
            return file;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static File getFile(String url) throws Exception {
        String fileName = url.substring(url.lastIndexOf("."), url.length());
        File file = null;

        URL urlfile;
        InputStream inStream = null;
        OutputStream os = null;
        try {
            file = File.createTempFile("net_url", fileName);
            urlfile = new URL("file:///" + url);
            inStream = urlfile.openStream();
            os = new FileOutputStream(file);

            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = inStream.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != os) {
                    os.close();
                }
                if (null != inStream) {
                    inStream.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return file;
    }

    public static File getOssFile(String url) throws Exception {
        String fileName = url.substring(url.lastIndexOf("/") + 1, url.length());
        File file = null;

        URL urlfile;
        InputStream inStream = null;
        OutputStream os = null;
        try {
            file = File.createTempFile("net_url", fileName);
            urlfile = new URL(url);
            inStream = urlfile.openStream();
            os = new FileOutputStream(file);

            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = inStream.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != os) {
                    os.close();
                }
                if (null != inStream) {
                    inStream.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return file;
    }

    public static BufferedImage resizeImage(int x, int y, BufferedImage bfi) {
        BufferedImage bufferedImage = new BufferedImage(x, y, BufferedImage.TYPE_INT_RGB);
        bufferedImage.getGraphics().drawImage(
                bfi.getScaledInstance(x, y, Image.SCALE_SMOOTH), 0, 0, null);
        return bufferedImage;
    }

}
