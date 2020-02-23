package com.controller.manager;

import com.bean.Employee;
import com.github.pagehelper.PageInfo;
import com.service.EmployeeService;
import com.sun.xml.internal.ws.developer.StreamingAttachment;
import com.utils.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/employeeController")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    /**
     * 全部员工
     * @param pageNum
     * @param pageSize
     * @param mav
     * @return
     */
    @RequestMapping("/employeeList")
    public ModelAndView list(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize",required = false,defaultValue = "5") int pageSize,
                             ModelAndView mav){
        List<Employee> employeeList = employeeService.getEmployeeList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(employeeList);
        mav.addObject("employeeList",pageInfo);
        mav.setViewName("manager/debris/employeeList");
        return mav;
    }

    /**
     * 添加
     * @param employee
     * @return
     */
    @GetMapping("/add")
    @ResponseBody
    public Map<String,Object>  addEmployee(Employee employee){
        HashMap<String, Object> map = new HashMap<>();
        String idCard = employee.getIdCard();
        employee.setAge(Utils.getAgeByIdCard(idCard));
        employee.setGender(Utils.getGenderByIdCard(idCard));

        System.out.println(employee.toString());
        int i = employeeService.addEmployee(employee);
        if (i>0){
            map.put("message",true);
        }else{
            map.put("message",false);
        }
        return map;
    }

    /**
     * 执行删除员工
     * @param id
     * @return
     */
    @GetMapping("/deleteEmployee")
    public String deleteEmployee(int id){
        employeeService.deleteEmployee(id);
        return "redirect:employeeList";
    }

    /**
     * 跳转到修改页面
     * @param id
     * @param mav
     * @return
     */
    @GetMapping("/updateEmployee")
    public ModelAndView updateEmployee(int id ,ModelAndView mav){
        Employee emp = employeeService.getEmployeeById(id);
        mav.addObject("emp",emp);
        mav.setViewName("manager/debris/employee_Update");
        return mav;
    }

    /**
     * 执行修改
     * @return
     */
    @PostMapping("/updateEmployee.do")
    public String doUpdate(Employee employee){
        return "";
    }



    /**
     * 号码是否存在
     * @param phoneNumber
     * @return
     */
    @GetMapping("/numberIsExist")
    @ResponseBody
    public Map<String,Object>  numberIsExist(String phoneNumber){
        HashMap<String, Object> map = new HashMap<>();
        Employee emp = employeeService.getEmployeeByPhoneNumber(phoneNumber);
        if (emp==null){
            map.put("message",true);//号码不存在
        }else{
            map.put("message",false);//号码存在
        }
        System.out.println("号码"+map.get("message"));
        return map;
    }

    /**
     * 身份证是否存在
     * @param identityCard
     * @return
     */
    @GetMapping("/identityCardIsExist")
    @ResponseBody
    public Map<String,Object> identityIsExist(String identityCard){
        HashMap<String, Object> map = new HashMap<>();
        Employee emp = employeeService.getEmployeeByIdentityCard(identityCard);
        if (emp==null){
            map.put("message",true);//身份证不存在
        }else{
            map.put("message",false);//身份证存在
        }
        System.out.println("身份证："+map.get("message"));
        return map;
    }

}
