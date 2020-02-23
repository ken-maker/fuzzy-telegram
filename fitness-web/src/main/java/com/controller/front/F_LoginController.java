package com.controller.front;

import com.bean.VIP;
import com.google.code.kaptcha.Producer;
import com.service.VIPService;
import com.utils.aliyunutil.SendMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static com.utils.aliyunutil.SendMessage.sendMessage;

@Controller
@RequestMapping("/front_login_controller")
public class F_LoginController {

    @Autowired
    private Producer captchaProducer;
    @Autowired
    private VIPService vipService;

    /**
     * 返回前台账号密码登录的逻辑视图
     * @return
     */
    @RequestMapping("/login")
    public String toLogin(){
        return "client/debris/frontDesk_ID_login";
    }

    /**
     * 手机短信登录逻辑视图
     * @return
     */
    @GetMapping("/phone_login")
    public String phoneLogin(){
        return "client/debris/front_Phone_login";
    }

    /**
     * 登录成功后，带参跳到前台主页面
     * @param userID
     * @param mav
     * @return
     */
    @GetMapping("/home")
    public ModelAndView toHome(HttpServletRequest request,String userID, ModelAndView mav){
        System.out.println(userID);
//        mav.addObject("userID",userID);
        request.getSession().setAttribute("userID",userID);//把登录用户放到session里
        mav.setViewName("client/frontDesk_Page");
        return mav;
    }

    /**
     * 生成图片验证码
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/captchar.jpg")
    public void getCaptchar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //设置内容类型
        response.setContentType("image/jpeg");
        //创建验证码文本
        String capText = captchaProducer.createText();
        //将验证码文本设置到session中
        request.getSession().setAttribute("captcha",capText);
        //创建验证码图片
        BufferedImage bi = captchaProducer.createImage(capText);

        ServletOutputStream outputStream = response.getOutputStream();
        //将图片验证码数据写到响应输出流
        ImageIO.write(bi,"jpg",outputStream);
        try {
            outputStream.flush();
        }finally {
            outputStream.close();
        }
    }

    /**
     * 账号登录验证
     * @param request
     * @param userID
     * @param userPassword
     * @param verification
     * @return
     */
    @GetMapping("/login.do")
    @ResponseBody
    public Map<String,Object> login(HttpServletRequest request, String userID, String userPassword, String verification){
        HashMap<String, Object> map = new HashMap<>();
        VIP vip = vipService.getVIPByUserID(userID);
        String kaptcha = (String) request.getSession().getAttribute("captcha");
        if (userPassword.equals(vip.getPassword())){
            if (kaptcha.equals(verification)){
                map.put("login","success");
            }else{
                map.put("login","验证码错误");
            }
        }else{
            map.put("login","密码错误");
        }
        return map;
    }

    /**
     * 短信登录验证
     * @param request
     * @param verificationCode
     * @return
     */
    @GetMapping("/PhoneLogin.do")
    @ResponseBody
    public Map<String ,Object> PhoneLogin(HttpServletRequest request,String phoneNumber,String verificationCode){
        HashMap<String, Object> map = new HashMap<>();
        //根据号码查找VIP
        VIP vip = vipService.getVIPByPhoneNumber(phoneNumber);
        //从session中取到 短信验证码
        String verifyCode = (String) request.getSession().getAttribute("verifyCode");
        System.out.println(verifyCode);
        if (verificationCode.equals(verifyCode)){
            map.put("message","success");
            map.put("userID",vip.getUserID());
        }else{
            map.put("message","验证码不正确");
        }
        return map;
    }

    /**
     * 判断是否存在ID
     * @param userID
     * @return
     */
    @GetMapping("/judgeID")
    @ResponseBody
    public Map<String,Object> judgeID(String userID){
        VIP vip = vipService.getVIPByUserID(userID);
        Map<String, Object> result = new HashMap<>();
        if (vip!=null){
            result.put("isExist",true);
        }else{
            result.put("isExist",false);
        }
        return result;
    }

    /**
     * 点击获取验证码，这里发送短信到手机
     * @param phoneNumber
     */
    @GetMapping("/getVerifyCode")
    @ResponseBody
    public Map<String,String> getVerifyCode(HttpServletRequest request,String phoneNumber){
        HashMap<String, String> map = new HashMap<>();
        String verifyCode = sendMessage(phoneNumber);
        //把短信验证码放到 session
        request.getSession().setAttribute("verifyCode",verifyCode);
        System.out.println("手机验证码："+verifyCode);
        map.put("message","手机验证码已发送");
        return map;
    }

    /**
     * 判断号码是否存在
     * @param phoneNumber
     * @return
     */
    @GetMapping("/phoneNumberIsExist")
    @ResponseBody
    public Map<String,Object> phoneNumberIsExist(String phoneNumber) {
        HashMap<String, Object> map = new HashMap<>();
        VIP vip = vipService.getVIPByPhoneNumber(phoneNumber);
        if (vip!=null){
            map.put("message",true);
        }else{
            map.put("message",false);
        }
        return map;
    }

    /**
     * 忘记密码提交
     * @param userID
     * @param phoneNumber
     * @return
     */
    @GetMapping("/forgetPassword")
    @ResponseBody
    public Map<String,Object> forgetPassword(String userID,String phoneNumber){
        Map<String, Object> map = new HashMap<>();
        VIP vip = vipService.getVIPByUserID(userID);
        if (vip==null){
            map.put("message","ID无效");
        }else{
            if (phoneNumber.equals(vip.getPhoneNumber())){
                map.put("message","success");
                //验证成功，发送密码过去
                SendMessage.sendUtils(phoneNumber,vip.getPhoneNumber());
            }else{
                map.put("message","号码与ID不匹配");
            }
        }
        return map;
    }


}
