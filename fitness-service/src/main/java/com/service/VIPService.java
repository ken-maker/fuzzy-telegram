package com.service;

import com.bean.VIP;
import com.bean.VIP_Course;
import com.bean.VIP_Trainer;
import com.mysql.fabric.xmlrpc.base.Data;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VIPService {


    //根据ID查询会员
    VIP getVIP(int id);

    //根据账号名找会员
    VIP getVIPByUserID(String userID);

    //查询全部VIP
    List<VIP> getVIPList(@Param("pageNum") int pageNum,
                         @Param("pageSize") int pageSize);

    //根据年龄查询VIP
    List<VIP> getVIPListByAge(@Param("pageNum") int pageNum,
                              @Param("pageSize") int pageSize,
                              int age);

    //根据性别查询VIP
    List<VIP> getVIPListByGender(@Param("pageNum") int pageNum,
                                 @Param("pageSize") int pageSize,
                                 int gender);

    //根据办理会员日期查询VIP
    List<VIP> getVIPListByHandingTime(@Param("pageNum") int pageNum,
                                      @Param("pageSize") int pageSize,
                                      Data handingTime);
    //根据名字查询VIP
    List<VIP> getVIPListByName(@Param("pageNum") int pageNum,
                               @Param("pageSize") int pageSize,
                               String name);

    //根据电话号码来查询VIP
    VIP getVIPByPhoneNumber(String phoneNumber);

    //根据身份证来查询VIP
    VIP getVIPByIdentityCard(String identityCard);

    //添加VIP
    int addVIP(VIP vip);

    //注销VIP
    int logoutVIP(int id);

    //修改手机号码，到时候要发短信验证
    int changePhoneNumber(int id,String phoneNumber);

    //    修改所有的信息
    int changeVIP(VIP vip);

    //    根据用户名修改课程
    int changeVIPCourseId(int courseId,String userID);


    //    某用户是否已报名某课程
    int applied(int vipId,int courseId);

    //    向账号课程表添加数据，也就是报名操作
    int applieding(int vipId,int courseId);

    //    根据会员id 查询课程
    List<VIP_Course> getVIP_Course(int vipId);

    //    取消课程
    int cancelCourse(int vipId,int courseId);

    //    =============私教==================

    //    某用户是否已买某私教的课，用于判断
    int already (int vipId,int trainerId);

    //    根据会员id 查询课程
    List<VIP_Trainer> getVIP_Trainer(int vipId);


    //    向账号课程表添加数据，也就是报名操作
    int buy(int vipId,int trainerId);
}
