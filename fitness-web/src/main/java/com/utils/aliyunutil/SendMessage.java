package com.utils.aliyunutil;

import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.CommonRequest;

import java.sql.Date;
import java.util.Calendar;

public class SendMessage {

    /**
     * 发送消息的包装工具类
     * @param phoneNumber
     * @return
     */
    public static void sendUtils(String phoneNumber,String content){
        //默认的支持文件
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4FkDgQ84ktDaDXwVWCyw", "P211XtAXFWBuFCF8wgpIvVSeBHB6tP");
        //设置默认的 Acs用户
        DefaultAcsClient client = new DefaultAcsClient(profile);
        //设置请求参数
        CommonRequest commonRequest = new CommonRequest();
        commonRequest.setMethod(MethodType.POST );//设置请求方法
        commonRequest.setDomain("dysmsapi.aliyuncs.com");//设置域，接口地址固定无需修改
        commonRequest.setVersion("2017-05-25");
        commonRequest.setAction("SendSms");
        //发送信息的相关参数
        commonRequest.putQueryParameter("RegionId","cn-hangzhou");//设置区域id
        commonRequest.putQueryParameter("PhoneNumbers",phoneNumber);//设置发送对象
        commonRequest.putQueryParameter("SignName","乌合之众");//设置签名
        commonRequest.putQueryParameter("TemplateCode","SMS_179605833");//设置短信模板
        commonRequest.putQueryParameter("TemplateParam","{\"code\":\""+content+"\"}");
        CommonResponse commonResponse=null;
        try {
            commonResponse= client.getCommonResponse(commonRequest);
        } catch (ClientException e) {
            e.printStackTrace();
        }finally {
            System.out.println(commonResponse.getData());
        }
    }

    /**
     * 发送验证码
     * @param phoneNumber
     * @return
     */
    public static String sendMessage(String phoneNumber){
        //生成随机验证码
        String verificationCode=getVerication();
        sendUtils(phoneNumber, verificationCode);
        return verificationCode;
    }

    /**
     * 随机生成四位数字
     * @return
     */
    public static String getVerication(){
        return String.valueOf((int)(Math.random()*8999)+1000+1);
    }

}

