package com.controller.front;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.bean.Employee;
import com.bean.VIP;
import com.service.EmployeeService;
import com.service.OrderService;
import com.service.VIPService;
import com.utils.util.Uuid;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping("/aplyController")
public class AplyController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private VIPService vipService;

    private final String APP_ID = "2016101500690307";
    private final String APP_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCaomV5VJehS7ZohrTu+NbJtYIZZXstyIioDrG16MIjp7B55II+NyTbTM7hXR+L3Lh4uPMRpKBWjZYvJuYNj/B+q/oq/KZ8PHFLRINlHd4A4Im4cOhsWokrzTUV2DqculnQuWulQs8oKSy5ZFTup3MNtoMMdk0VcQXkmVpZe5sbUrK+0rn6s8PYksXrqCtmEGnw+pdB4YIW+1JCzmrK5lgzS8rj8CpQYrU1c0qKuJeiWH1dPYbgCOu/QGtO+cosTxjiLXVDhmtQ5U6WiNavk59+EWycHEa+sFCipuIsN9G+OCHZt3JUsL/pCk2UHHsj61+43tcKpvHnkEeIE+6mlbzXAgMBAAECggEBAIudvMkDm7RCS/usRIjPm/6bJ1AO1FzOBrTWL5XzBfZzXV9w9jd+SoTGoLPSBL2fF9/H/Y8ceLgtNkB0epocMCPu2v0dCKR7Xj97KLePc/aOxUoGh5PtWpR1v0xt4t3HU3ilMZAQ9kFoi70H3bds8PCcrU3/MjH9zjhMTcslUzIi3XyBahvFaFKKBeqA9aYR/lbSZ2ZYKlWAaLNewWrNOSujmHUBt6805IRA8xgfcZ7Pb2+Oa95ecxox3ikYobGAPDUJkevUbuC/7aum3zamej5peorrKoq5Ru4ZXYpVl6GBMSSZxtB7qU+ZGN/6iZR2rglXkmAI9m4piReyjyfWTsECgYEAyJAVAiX+HQtGJcKnEyhhKRGeOAqe0va5bEk0C32N8rSuD/YQCyaVXaUwYUl+wQ5Swd80hbvrb9nWuZgRKp6E6DrV3rgn6uz1942IoyrSv1lNeSUfSzi8EJrMNSit/UiGZKLHQqeZfIXXbk5PuyKjubEs6JehugqYtLW3o/2WBr8CgYEAxWBlMHHqJ++JZofX2uWwEKN7C4GJmVk3FxbD3g7cb/pdRFCYBiuQlWz4GjUVdFwfAYgveh7K2AuIW6Q5V10MmeIAAnAjLxWHaPuWMVlKwwO/bh/Ulc+OGyNZ8SEm3mEzd4SF/CpNeTphyQfL+1mN1CqX3uBF04Mvtzokm4kdp+kCgYA8a2NYzVc7Kq1MLNKmK9DxTVRrr49fIGKFo5vhJka/6fxR5J+6rDntBxmHBVwBDq6RpwssiosHnAlaydvKCg0h5K+PM80asZ37oJCcDweEC4QSTcOappHJMsj37rRTjCioYn1CsDjF0ZAvs7nDN1E5XI2Z2CwpXo3YSrHy3i73AwKBgBq+ZPebd87Rdhyea3ENjj2y6Qk2FB7jJ8PJIeEEwnmpwtlu0iqD3KNikHt8ldueX9UlTsmNQo7jgSZpqhtcUEjJhpbN+vZ2RFLFRCSLpMWnzFhvl6504RxsPdOeWlXndcHMAxuX38d9UaKbm9gC2mTVIJ7iZJO0QtLg3fT1Lz+BAoGAVsB+KTbbDV3mj++Ch/bt+YK2VZZ7GwucevDHPkwAvUO2QD80OBx4o5Rkhsoj1lxigfdR001OxYnp1RnrYMkcXoC7rKj5Uqn5zYtnp1kv3PxuumaeYo0IDaL+sPTQJV3b663zQEIOvZFmOtyKHKtIc52ZqP1u714dciLwOsU65Fk=";
    private final String CHARSET = "UTF-8";
    private final String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw5G8FtbQ4LKCdJbHpKrTyvfnpCcflTmLezJ2sYwrOSmnkq5GxpQK1K9VIkgGhurq3AliEH0JOFdMs8ShNd+iEb+rdtgFdI7SaizNU9j5XNonJcU8Q9dcKxqM8UISVJjf8gaCS4vuH3LP7xfSTTfNSXg84KIWIk2tD6t6i2u5w/o4cLBdVLEkkjtFS/rf4a4BF3iv6Zey8BRXFHqP1mbC09v3NIrBO2zrHTtqRYm1xDaDNkfwTm/lS8kQzdxMIfV1NIyhiE7DDcDpR800qNuvJDIAuDfq2GI8Lu6zo8JqHN5mxmyKhz9tV943JiOt/ZDfHqzwPdvbHBA7K0SRI5hMCQIDAQAB";
    //这是沙箱接口路径,正式路径为https://openapi.alipay.com/gateway.do
    private final String GATEWAY_URL ="https://openapi.alipaydev.com/gateway.do";
    private final String FORMAT = "JSON";
    //签名方式
    private final String SIGN_TYPE = "RSA2";
    //支付宝异步通知路径,付款完毕后会异步调用本项目的方法,必须为公网地址
    private final String NOTIFY_URL = "http://localhost:8080/notifyUrl";
    //支付宝同步通知路径,也就是当付款完毕后跳转本项目的页面,可以不是公网地址
    private final String RETURN_URL = "http://localhost:8080/aplyController/returnUrl";

    //订单创建人id
    private int builderId=0;
    //订单描述
    private String order_remark="";
    //私教id
    private int trainer_Id=0;
//====================================================================================================

//    点击支付按钮时，判断是否登录
    @RequestMapping("/isLogin")
    @ResponseBody
    public Map<String,Object> isLogin(HttpServletRequest r){
        String userID = (String) r.getSession().getAttribute("userID");//从session中获取账号
        HashMap<String, Object> map = new HashMap<>();
        if (userID==null){//还没登录,返回false
            map.put("message",false);
        }else{
            map.put("message",true);
        }
        return map;
    }


    //支付操作
    @RequestMapping("/alipay")
    public void alipay(HttpServletRequest r, HttpServletResponse httpResponse,int trainerId,String money,String remark) throws IOException {

        String userID = (String) r.getSession().getAttribute("userID");
        VIP vip = vipService.getVIPByUserID(userID);
        builderId=vip.getId();
        order_remark=remark;
        trainer_Id=trainerId;
        System.out.println("进入支付控制器");
        //实例化客户端,填入所需参数
        AlipayClient alipayClient = new DefaultAlipayClient(GATEWAY_URL, APP_ID, APP_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGN_TYPE);
        System.out.println("得到客户端");
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
        //在公共参数中设置回跳和通知地址
        request.setReturnUrl(RETURN_URL);
        request.setNotifyUrl(NOTIFY_URL);
        //根据订单编号,查询订单相关信息
        String out_trade_no = Uuid.getUnique();//商户订单号，商户网站订单系统中唯一订单号，必填
        String total_amount = money;//付款金额，必填
        String subject = "私教课";//订单名称，必填
        String body = remark;//商品描述，可空
        request.setBizContent("{" +
                "\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        String form = "";
        try {
            form = alipayClient.pageExecute(request).getBody(); // 调用SDK生成表单
            System.out.println("form = " + form);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        httpResponse.setContentType("text/html;charset=" + CHARSET);
        httpResponse.getWriter().write(form);// 直接将完整的表单html输出到页面
        httpResponse.getWriter().flush();
        httpResponse.getWriter().close();
        System.out.println("执行支付结束");
    }


    //同步回调
    @RequestMapping(value = "/returnUrl", method = RequestMethod.GET)
    public String returnUrl(HttpServletRequest request, HttpServletResponse response)
            throws IOException, AlipayApiException {
        System.out.println("=================================同步回调=====================================");
        // 获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = (Map<String, String[]>) request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
            /*valueStr = new String(valueStr.getBytes("utf-8"), "utf-8");*/
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        System.out.println(params);//查看参数都有哪些
        boolean signVerified = AlipaySignature.rsaCheckV1(params, ALIPAY_PUBLIC_KEY, CHARSET, SIGN_TYPE); // 调用SDK验证签名
        System.out.println("signVerified = " + signVerified);
        if (signVerified) {//验证签名通过，支付通过
            // 商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
            // 支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
            // 付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
            //添加订单操作
            int addOrder = orderService.addOrder(out_trade_no,builderId, "私教课",trainer_Id,new BigDecimal(total_amount),order_remark);
            int already = vipService.buy(builderId,trainer_Id);
            if (addOrder>0 && already>0){
                System.out.println("添加成功");
                return "redirect:success";
            } else{
                System.out.println("添加失败");
                return "redirect:fail";
            }
        } else {
            System.out.println("验证不通过，支付失败");
            return "redirect:fail";
        }
    }

    //支付成功
    @RequestMapping("/success")
    public String paySuccess(){
        return "client/debris/paySuccess";
    }
    //支付失败
    @RequestMapping("/fail")
    public String payFail(){
        return "client/debris/payFail";
    }

}
