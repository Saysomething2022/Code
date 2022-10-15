package com.yinjie.bbs_java.util.qiniuyun.service.impl;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import com.qiniu.storage.Region;
import com.yinjie.bbs_java.util.qiniuyun.service.UploadPictureService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.Random;

@Service
public class UploadPictureServiceimpl implements UploadPictureService {


    @Override
    public String uploadPicture(MultipartFile file) throws IOException {
        String qiniuUrl = "raugnkxn8.hn-bkt.clouddn.com";
        Configuration configuration = new Configuration(Region.autoRegion());
        UploadManager uploadManager = new UploadManager(configuration);
        String accessKey = "ozA9K4tZHmMxII1WeFoqrc1OpLIFKCMZgemjLK9g";
        String secretKey = "v6tQLXsPvVnaogVe-0bk4ilIM1Gpfm8sDJR2Wfuk";
        String bucket = "jackpicture1";
        String key = getRandomCharacterAndNumber(10) + ".png";//生成随机文件名
        Auth auth = Auth.create(accessKey,secretKey);
        String uptoken = auth.uploadToken(bucket);
        String responseUrl = "";
        try{
            byte[] localFile = file.getBytes();
            Response response = uploadManager.put(localFile,key,uptoken);
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            responseUrl = responseUrl + "http://" + qiniuUrl + "/" + putRet.key;
        }catch (QiniuException e){
            Response r = e.response;
        }
        return responseUrl;
    }

    public static String getRandomCharacterAndNumber(int length) {
        String val = "";
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num"; // 输出字母还是数字

            if ("char".equalsIgnoreCase(charOrNum)) // 字符串
            {
                int choice = random.nextInt(2) % 2 == 0 ? 65 : 97; // 取得大写字母还是小写字母
                val += (char) (choice + random.nextInt(26));
                // int choice = 97; // 指定字符串为小写字母
                val += (char) (choice + random.nextInt(26));
            } else if ("num".equalsIgnoreCase(charOrNum)) // 数字
            {
                val += String.valueOf(random.nextInt(10));
            }
        }
        return val;
    }
}
