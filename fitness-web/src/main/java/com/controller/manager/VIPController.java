package com.controller.manager;

import com.bean.VIP;
import com.github.pagehelper.PageInfo;
import com.service.VIPService;
import com.utils.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/vipController")
public class VIPController {

    @Autowired
    private VIPService vipService;

    /**
     * 使用分页查询所有会员
     * @param pageNum
     * @param pageSize
     * @param mav
     * @return
     */
    @GetMapping("/vipList")
    public ModelAndView vipList(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize",required = false,defaultValue = "8") int pageSize,
                             ModelAndView mav){
        List<VIP> vipList = vipService.getVIPList(pageNum, pageSize);
        PageInfo<VIP> vipPageInfo = new PageInfo<>(vipList);
        mav.addObject("vipList",vipPageInfo);
        mav.setViewName("manager/debris/VIPList");
        return mav;
    }

    /**
     * 添加会员
     * @param vip
     */
    @GetMapping("/addVIP")
    @ResponseBody
    public String addVIP(VIP vip){
        HashMap<String, Object> map = new HashMap<>();
        String identityCard = vip.getIdentityCard();
        vip.setAge(Utils.getAgeByIdCard(identityCard));//从身份证获取年龄
        vip.setGender(Utils.getGenderByIdCard(identityCard));//从身份证获取性别
        vip.setBirthDay(Utils.getBirthByIdCard(identityCard));//从身份证获取生日
        vip.setUserID(Utils.getUserID());//获取随机userID
        vip.setPassword("000000");//这是默认密码
        System.out.println(vip.toString());
        vipService.addVIP(vip);

        return "redirect:vipList";
    }

    /**
     * 执行删除会员
     * @param id
     * @return
     */
    @GetMapping("/deleteVIP")
    public String deleteVIP(int id){
        vipService.logoutVIP(id);
        return "redirect:vipList";
    }

    /**
     * 跳转到修改页面
     * @param id
     * @param mav
     * @return
     */
    @GetMapping("/updateVIP")
    public ModelAndView updateVIP(int id ,ModelAndView mav){
        VIP vip = vipService.getVIP(id);
        mav.addObject("vip",vip);
        mav.setViewName("manager/debris/vip_Update");
        return mav;
    }

    /**
     * 执行修改
     * @param vip
     * @return
     */
    @PostMapping("/updateVIP.do")
    public String doUpdate(VIP vip){
        String identityCard = vip.getIdentityCard();
        vip.setName(vip.getName());
        vip.setAge(Utils.getAgeByIdCard(identityCard));
        vip.setGender(Utils.getGenderByIdCard(identityCard));
        vip.setBirthDay(Utils.getBirthByIdCard(identityCard));
        System.out.println(vip.toString());
        vipService.changeVIP(vip);
        return "redirect:vipList";
    }

}

