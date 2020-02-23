package com.controller.manager;

import com.bean.Course;
import com.github.pagehelper.PageInfo;
import com.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/courseController")
public class CourseController {

    @Autowired
    private CourseService courseService;

    /**
     * 全部课程
     * @param pageNum
     * @param pageSize
     * @param mav
     * @return
     */
    @RequestMapping("/courseList")
    public ModelAndView list(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize",required = false,defaultValue = "5") int pageSize,
                             ModelAndView mav){
        List<Course> employeeList = courseService.getCourseList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(employeeList);
        mav.addObject("courseList",pageInfo);
        mav.setViewName("manager/debris/courseList");
        return mav;
    }

    /**
     * 添加
     * @param course
     * @return
     */
    @GetMapping("/add")
    @ResponseBody
    public Map<String,Object> addEmployee(Course course){
        HashMap<String, Object> map = new HashMap<>();
        int i = courseService.addCourse(course);
        if (i>0){
            map.put("message",true);
        }else{
            map.put("message",false);
        }
        return map;
    }

    /**
     * 执行删除
     * @param id
     * @return
     */
    @GetMapping("/deleteCourse")
    public String deleteCourse(int id){
        courseService.logoutCourse(id);
        return "redirect:courseList";
    }

    /**
     * 跳转到修改页面
     * @param id
     * @param mav
     * @return
     */
    @GetMapping("/updateCourse")
    public ModelAndView updateCourse(int id ,ModelAndView mav){
        final Course course = courseService.getCourse(id);
        mav.addObject("course",course);
        mav.setViewName("manager/debris/course_Update");
        return mav;
    }

    /**
     * 执行修改
     * @return
     */
    @GetMapping("/updateCourse.do")
    @ResponseBody
    public Map<String,Object> doUpdate(Course course){
        HashMap<String, Object> map = new HashMap<>();
        int i = courseService.updateCourse(course.getId(), course);
        if (i>0){
            map.put("message",true);
        }else{
            map.put("message",false);
        }
        return map;
    }
}
