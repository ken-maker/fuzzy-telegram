package com.service;

import com.bean.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseService {

    //根据id查询课程
    Course getCourse(int id);

    //获取全部课程
    List<Course> getCourseList(@Param("pageNum") int pageNum,
                               @Param("pageSize") int pageSize);

    //添加课程
    int addCourse(Course course);

    //注销课程
    int logoutCourse(int id);

    //修改课程名
    int changeCourseName(int id,String newName);

    //修改课程最大人数
    int changePeopleCount(int courseId,int peopleCount);

    //    添加vipId
    int addVIP(String userIDs,int id);//会员id，课程id

    //    修改课程
    int updateCourse(int id,Course course);
}
