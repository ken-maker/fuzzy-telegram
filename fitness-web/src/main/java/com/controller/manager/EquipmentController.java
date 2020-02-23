package com.controller.manager;

import com.bean.Equipment;
import com.github.pagehelper.PageInfo;
import com.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/equipmentController")
public class EquipmentController {

    @Autowired
    private EquipmentService equipmentService;

    /**
     * 使用分页查询所有器材
     * @param pageNum
     * @param pageSize
     * @param mav
     * @return
     */
    @GetMapping("/equipmentList")
    public ModelAndView equipmentList(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                                      @RequestParam(value = "pageSize",required = false,defaultValue = "8") int pageSize,
                                      ModelAndView mav){
        List<Equipment> equipmentList = equipmentService.getEquipmentList(pageNum, pageSize);

        PageInfo<Equipment> equipmentPageInfo = new PageInfo<>(equipmentList);
        mav.addObject("equipmentList",equipmentPageInfo);
        mav.setViewName("manager/debris/equipmentList");
        return mav;
    }

    /**
     * 执行删除
     * @param id
     * @return
     */
    @GetMapping("/deleteEquipment")
    public String deleteEquipment(int id){
        equipmentService.logoutEquipment(id);
        return "redirect:equipmentList";
    }

    /**
     * 执行添加器材
     * @param equipment
     * @return
     */
    @PostMapping("/addEquipment")
    public String addEquipment(Equipment equipment){
        equipmentService.addEquipment(equipment);
        return "redirect:equipmentList";
    }
}
