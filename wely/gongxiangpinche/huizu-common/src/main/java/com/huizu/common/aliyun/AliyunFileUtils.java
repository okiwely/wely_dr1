package com.huizu.common.aliyun;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.*;
import com.huizu.common.utils.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 阿里云上传服务
 *
 * @author bisj
 */
public class AliyunFileUtils {

    /**
     * 上传Byte数组
     *
     * @param content
     * @return
     */
    public static String uploadFile(byte[] content, String objectName) {
        OSS ossClient = new OSSClientBuilder().build(AliyunUtils.endpoint, AliyunUtils.accessKeyId, AliyunUtils.accessKeySecret);
        ossClient.putObject(AliyunUtils.bucketName, objectName, new ByteArrayInputStream(content));
        ossClient.shutdown();
        return AliyunUtils.downpoint + objectName;
    }

    /**
     * 上传File文件
     *
     * @param file
     * @return
     */
    public static String uploadFile(File file) {
        if (file == null) {
            return null;
        } else {
            String imageName = System.currentTimeMillis() + "";
            OSS ossClient = new OSSClientBuilder().build(AliyunUtils.endpoint, AliyunUtils.accessKeyId, AliyunUtils.accessKeySecret);
            PutObjectRequest putObjectRequest = new PutObjectRequest(AliyunUtils.bucketName, imageName, file);
            ossClient.putObject(putObjectRequest);
            ossClient.shutdown();
            file.delete();
            return AliyunUtils.downpoint + imageName;
        }
    }

    /**
     * 本地文件上传云服务
     *
     * @param file
     * @param type 0.不删除 1.删除源文件
     * @return
     */
    public static String uploadFile(File file, int type) {
        if (file == null) {
            return null;
        } else {
            String imageName = System.currentTimeMillis() + "";
            OSS ossClient = new OSSClientBuilder().build(AliyunUtils.endpoint, AliyunUtils.accessKeyId, AliyunUtils.accessKeySecret);
            PutObjectRequest putObjectRequest = new PutObjectRequest(AliyunUtils.bucketName, imageName, file);
            ossClient.putObject(putObjectRequest);
            ossClient.shutdown();
            if (type == 1) {
                file.delete();
            }
            return AliyunUtils.downpoint + imageName;
        }
    }

    /**
     * 上传MultipartFile文件
     *
     * @param file
     * @return
     */
    public static String uploadFile(MultipartFile file) throws Exception {
        if (file == null) {
            return null;
        } else {
            File imageFile = MultipartFileToFile.multipartFileToFile(file);
            String filename = file.getOriginalFilename();
            if (StringUtils.isNotBlank(filename)) {
                int index = filename.indexOf(".");
                filename = filename.substring(index);
            }
            String imageName = System.currentTimeMillis() + filename;
            OSS ossClient = new OSSClientBuilder().build(AliyunUtils.endpoint, AliyunUtils.accessKeyId, AliyunUtils.accessKeySecret);
            PutObjectRequest putObjectRequest = new PutObjectRequest(AliyunUtils.bucketName, imageName, imageFile);
            ossClient.putObject(putObjectRequest);
            ossClient.shutdown();
            imageFile.delete();
            return AliyunUtils.downpoint + imageName;
        }
    }

    /**
     * 分片上传视频文件
     *
     * @param file
     * @return
     * @throws Exception
     */
    public static String abortMultipartUploadFile(MultipartFile file) throws Exception {
        if (file == null) {
            return null;
        } else {
            File imageFile = MultipartFileToFile.multipartFileToFile(file);
            String imageName = System.currentTimeMillis() + "";
            OSS ossClient = new OSSClientBuilder().build(AliyunUtils.endpoint, AliyunUtils.accessKeyId, AliyunUtils.accessKeySecret);
            InitiateMultipartUploadRequest request = new InitiateMultipartUploadRequest(AliyunUtils.bucketName, imageName);
            InitiateMultipartUploadResult upresult = ossClient.initiateMultipartUpload(request);
            String uploadId = upresult.getUploadId();
            List<PartETag> partETags = new ArrayList<PartETag>();
            final long partSize = 1024 * 1024L;

            final File sampleFile = imageFile;
            long fileLength = sampleFile.length();
            int partCount = (int) (fileLength / partSize);
            if (fileLength % partSize != 0) {
                partCount++;
            }
            for (int i = 0; i < partCount; i++) {
                long startPos = i * partSize;
                long curPartSize = (i + 1 == partCount) ? (fileLength - startPos) : partSize;
                InputStream instream = new FileInputStream(sampleFile);
                instream.skip(startPos);
                UploadPartRequest uploadPartRequest = new UploadPartRequest();
                uploadPartRequest.setBucketName(AliyunUtils.bucketName);
                uploadPartRequest.setKey(imageName);
                uploadPartRequest.setUploadId(uploadId);
                uploadPartRequest.setInputStream(instream);
                uploadPartRequest.setPartSize(curPartSize);
                uploadPartRequest.setPartNumber(i + 1);
                UploadPartResult uploadPartResult = ossClient.uploadPart(uploadPartRequest);
                partETags.add(uploadPartResult.getPartETag());
            }
            CompleteMultipartUploadRequest completeMultipartUploadRequest =
                    new CompleteMultipartUploadRequest(AliyunUtils.bucketName, imageName, uploadId, partETags);
            CompleteMultipartUploadResult completeMultipartUploadResult = ossClient.completeMultipartUpload(completeMultipartUploadRequest);
            System.out.println(completeMultipartUploadResult.getETag());
            ossClient.shutdown();
            imageFile.delete();
            return AliyunUtils.downpoint + imageName;
        }
    }

    /**
     * 上传MultipartFile[]文件组
     *
     * @param files
     * @return
     */
    public static List<String> uploadFiles(MultipartFile[] files) throws Exception {
        if (files == null || files.length == 0) {
            return null;
        } else {
            List<String> images = new ArrayList<>();
            for (MultipartFile file : files) {
                File imageFile = MultipartFileToFile.multipartFileToFile(file);
                String imageName = System.currentTimeMillis() + "";
                OSS ossClient = new OSSClientBuilder().build(AliyunUtils.endpoint, AliyunUtils.accessKeyId, AliyunUtils.accessKeySecret);
                PutObjectRequest putObjectRequest = new PutObjectRequest(AliyunUtils.bucketName, imageName, imageFile);
                ossClient.putObject(putObjectRequest);
                ossClient.shutdown();
                imageFile.delete();
                images.add(AliyunUtils.downpoint + imageName);
            }
            return images;
        }
    }

}
