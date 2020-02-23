package com.service.impl;

import com.bean.Course;
import com.dao.CourseDao;
import com.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseDao courseDao;


    @Override
    public Course getCourse(int id) {
        return courseDao.getCourse(id);
    }

    @Override
    public List<Course> getCourseList(int pageNum, int pageSize) {
        return courseDao.getCourseList(pageNum,pageSize);
    }

    @Override
    public int addCourse(Course course) {
        return courseDao.addCourse(course);
    }

    @Override
    public int logoutCourse(int id) {
        return courseDao.logoutCourse(id);
    }

    @Override
    public int changeCourseName(int id, String newName) {
        return courseDao.changeCourseName(id,newName);
    }

    @Override
    public int changePeopleCount(int courseId, int peopleCount) {
        return courseDao.changePeopleCount(courseId,peopleCount);
    }

    @Override
    public int addVIP(String userIDs, int id) {
        return courseDao.addVIP(userIDs,id);
    }

    @Override
    public int updateCourse(int id, Course course) {
        return courseDao.updateCourse(id,course);
    }
}
