package com.service.impl;

import com.bean.VIP;
import com.bean.VIP_Course;
import com.bean.VIP_Trainer;
import com.dao.VIPDao;
import com.mysql.fabric.xmlrpc.base.Data;
import com.service.VIPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VIPServiceImpl implements VIPService {

    @Autowired
    private VIPDao vipDao;


    @Override
    public VIP getVIP(int id) {
        return vipDao.getVIP(id);
    }

    @Override
    public VIP getVIPByUserID(String userID) {
        return vipDao.getVIPByUserID(userID);
    }

    @Override
    public List<VIP> getVIPList(int pageNum, int pageSize) {
        return vipDao.getVIPList(pageNum,pageSize);
    }

    @Override
    public List<VIP> getVIPListByAge(int pageNum, int pageSize, int age) {
        return vipDao.getVIPListByAge(pageNum,pageSize,age);
    }

    @Override
    public List<VIP> getVIPListByGender(int pageNum, int pageSize, int gender) {
        return vipDao.getVIPListByGender(pageNum,pageSize,gender);
    }

    @Override
    public List<VIP> getVIPListByHandingTime(int pageNum, int pageSize, Data handingTime) {
        return vipDao.getVIPListByHandingTime(pageNum,pageSize,handingTime);
    }

    @Override
    public List<VIP> getVIPListByName(int pageNum, int pageSize, String name) {
        return vipDao.getVIPListByName(pageNum,pageSize,name);
    }

    @Override
    public VIP getVIPByPhoneNumber(String phoneNumber) {
        return vipDao.getVIPByPhoneNumber(phoneNumber);
    }

    @Override
    public int addVIP(VIP vip) {
        return vipDao.addVIP(vip);
    }

    @Override
    public int changeVIP(VIP vip) {
        return vipDao.changeVIP(vip);
    }

    @Override
    public int changeVIPCourseId(int courseId,String userID) {
        return vipDao.changeVIPCourseId(courseId,userID);
    }

    @Override
    public int applied(int vipId, int courseId) {
        return vipDao.applied(vipId,courseId);
    }

    @Override
    public int applieding(int vipId, int courseId) {
        return vipDao.applieding(vipId,courseId);
    }

    @Override
    public List<VIP_Course> getVIP_Course(int vipId) {
        return vipDao.getVIP_Course(vipId);
    }

    @Override
    public int cancelCourse(int vipId, int courseId) {
        return vipDao.cancelCourse(vipId,courseId);
    }

    @Override
    public int already(int vipId, int trainerId) {
        return vipDao.already(vipId,trainerId);
    }

    @Override
    public List<VIP_Trainer> getVIP_Trainer(int vipId) {
        return vipDao.getVIP_Trainer(vipId);
    }

    @Override
    public int buy(int vipId, int trainerId) {
        return vipDao.buy(vipId,trainerId);
    }

    @Override
    public int logoutVIP(int id) {
        return vipDao.logoutVIP(id);
    }

    @Override
    public int changePhoneNumber(int id, String phoneNumber) {
        return vipDao.changePhoneNumber(id,phoneNumber);
    }

    @Override
    public VIP getVIPByIdentityCard(String identityCard) {
        return vipDao.getVIPByIdentityCard(identityCard);
    }
}
