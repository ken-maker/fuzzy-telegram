package com.controller.manager;

import com.bean.Locker;
import com.github.pagehelper.PageInfo;
import com.service.LockerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/lockerController")
public class LockerController {

    @Autowired
    private LockerService lockerService;

    /**
     * 使用分页查询所有储物柜
     * @param pageNum
     * @param pageSize
     * @param mav
     * @return
     */
    @GetMapping("/lockerList")
    public ModelAndView lockerList(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                                   @RequestParam(value = "pageSize",required = false,defaultValue = "8") int pageSize,
                                   ModelAndView mav){
        List<Locker> lockerList = lockerService.getLockerList(pageNum, pageSize);
        PageInfo<Locker> lockerPageInfo = new PageInfo<>(lockerList);
        mav.addObject("lockerList",lockerPageInfo);
        mav.setViewName("manager/debris/lockerList");
        return mav;
    }

    /**
     * 添加
     * @param locker
     * @return
     */
    @GetMapping("/add")
    @ResponseBody
    public Map<String,Object> addEmployee(Locker locker){
        HashMap<String, Object> map = new HashMap<>();
        return map;
    }

    /**
     * 执行删除
     * @param id
     * @return
     */
    @GetMapping("/delete")
    public String deleteEmployee(int id){
        lockerService.logoutLocker(id);
        return "redirect:courseList";
    }

    /**
     * 跳转到修改页面
     * @param id
     * @param mav
     * @return
     */
    @GetMapping("/update")
    public ModelAndView updateEmployee(int id ,ModelAndView mav){
        return mav;
    }

    /**
     * 执行修改
     * @return
     */
    @PostMapping("/update.do")
    public String doUpdate(Locker locker){
        return "";
    }
}
