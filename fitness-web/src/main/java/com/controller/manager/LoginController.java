package com.controller.manager;

import com.bean.Administrator;
import com.google.code.kaptcha.Producer;
import com.service.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/back_login_controller")
public class LoginController {

    @Autowired
    private AdministratorService administratorService;
    @Autowired
    private Producer captchaProducer;

    /**
     * 返回后台账号密码登录的逻辑视图
     * @return
     */
    @RequestMapping("/login")
    public String toLogin(){
        return "manager/backStage_ID_login";
    }

    /**
     * 带参跳到后台主页面
     * @param userID
     * @param mav
     * @return
     */
    @GetMapping("/home")
    public ModelAndView toHome(String userID,ModelAndView mav){
        System.out.println(userID);
        mav.addObject("userID",userID);
        mav.setViewName("manager/backStage_Page");
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
    public Map<String,Object> login(HttpServletRequest request,String userID, String userPassword, String verification){
        Administrator administrator = administratorService.getAdministrator(userID);
        HashMap<String, Object> map = new HashMap<>();
        String kaptcha = (String) request.getSession().getAttribute("captcha");
        if (administrator.getUserPassword().equals(userPassword)){
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
     * 判断是否存在ID
     * @param userID
     * @return
     */
    @GetMapping("/judgeID")
    @ResponseBody
    public Map<String,Object> judgeID(String userID){
        Administrator administrator = administratorService.getAdministrator(userID);
        System.out.println(userID+","+administrator);
        Map<String, Object> result = new HashMap<>();
        if (administrator==null){
            result.put("isExist",false);
        }else{
            result.put("isExist",true);
        }
        return result;
    }

    /**
     * 返回后台手机短信登录的逻辑视图，后台手机登录暂时不弄
     * @return
     */
    /*@GetMapping("/phone_login")
    public String toPhone_login(){
        return "manager/backStage_Phone_login";
    }*/

    /**
     * 点击获取验证码，这里发送短信到手机，暂时不弄
     * @param phoneNumber
     */
    /*@GetMapping("/getVerifyCode")
    @ResponseBody
    public Map<String,String> getVerifyCode(HttpServletRequest request,String phoneNumber){
        HashMap<String, String> map = new HashMap<>();
        String verifyCode = sendMessage(phoneNumber);
        //把短信验证码放到 session
        request.getSession().setAttribute("verifyCode",verifyCode);
        System.out.println("手机验证码："+verifyCode);
        map.put("message","手机验证码已发送");
        return map;
    }*/

    /**
     * 后台短信登录验证，暂时不弄
     * @param request
     * @param verificationCode
     * @return
     */
    /*@GetMapping("/PhoneLogin.do")
    @ResponseBody
    public Map<String ,Object> PhoneLogin(HttpServletRequest request,String phoneNumber,String verificationCode){
        HashMap<String, Object> map = new HashMap<>();
        //依据号码找到操作员，方便到主界面进行操作
        Administrator administrator = administratorService.getAdministratorByPhoneNumber(phoneNumber);
        //从session中取到 短信验证码
        String verifyCode = (String) request.getSession().getAttribute("verifyCode");
        System.out.println(verifyCode);
        if (verificationCode.equals(verifyCode)){
            map.put("message","success");
            map.put("userID",administrator.getUserID());
        }else{
            map.put("message","验证码不正确");
        }
        return map;
    }*/

    /**
     * 后台判断号码是否存在，暂时不弄
     * @param phoneNumber
     * @return
     */
    /*@GetMapping("/phoneNumberIsExist")
    @ResponseBody
    public Map<String,Object> phoneNumberIsExist(String phoneNumber) {
        HashMap<String, Object> map = new HashMap<>();
        Administrator administrator = administratorService.getAdministratorByPhoneNumber(phoneNumber);
        if (administrator!=null){
            map.put("message",true);
        }else{
            map.put("message",false);
        }
        return map;
    }*/

    /**
     * 忘记密码提交,暂时不弄
     * @param userID
     * @param phoneNumber
     * @return
     */
    /*@GetMapping("/forgetPassword")
    @ResponseBody
    public Map<String,Object> forgetPassword(String userID,String phoneNumber){
        Map<String, Object> map = new HashMap<>();
        Administrator administrator = administratorService.getAdministrator(userID);
        Employee employee = employeeDao.getEmployeeByAdminId(administrator.getUserID());
        if (administrator==null){
            map.put("message","ID无效");
        }else{
            if (employee.getPhoneNumber().equals(phoneNumber)){
                map.put("message","success");
                //验证成功，发送密码过去
                SendMessage.sendUtils(phoneNumber,administrator.getUserPassword());
            }else{
                map.put("message","号码与ID不匹配");
            }
        }
        return map;
    }*/
}
