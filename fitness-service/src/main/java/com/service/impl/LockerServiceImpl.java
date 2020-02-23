package com.service.impl;

import com.bean.Locker;
import com.dao.LockerDao;
import com.service.LockerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class LockerServiceImpl implements LockerService {

    @Autowired
    private LockerDao lockerDao;

    @Override
    public Locker getLocker(int id) {
        return lockerDao.getLocker(id);
    }

    @Override
    public List<Locker> getLockerList(int pageNum, int pageSize) {
        return lockerDao.getLockerList(pageNum,pageSize);
    }

    @Override
    public List<Locker> getLockerListByState(int pageNum, int pageSize, int state) {
        return lockerDao.getLockerListByState(pageNum,pageSize,state);
    }

    @Override
    public int addLocker(Locker locker) {
        return lockerDao.addLocker(locker);
    }

    @Override
    public int logoutLocker(int id) {
        return lockerDao.logoutLocker(id);
    }

    @Override
    public int changeState(int id, int newState) {
        return lockerDao.changeState(id,newState);
    }


}
