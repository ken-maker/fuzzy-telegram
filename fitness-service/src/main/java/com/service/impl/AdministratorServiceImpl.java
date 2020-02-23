package com.service.impl;

import com.bean.Administrator;
import com.dao.AdministratorDao;
import com.service.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdministratorServiceImpl implements AdministratorService {

    @Autowired
    private AdministratorDao administratorDao;

    @Override
    public Administrator getAdministrator(String userID) {
        return administratorDao.getAdministrator(userID);
    }

    @Override
    public List<Administrator> getAdministratorList(int pageNum, int pageSize) {
        return administratorDao.getAdministratorList(pageNum,pageSize);
    }
    @Override
    public int addAdministrator(Administrator administrator) {
        return administratorDao.addAdministrator(administrator);
    }

    @Override
    public int logoutAdministrator(String userID) {
        return administratorDao.logoutAdministrator(userID);
    }

    @Override
    public int changePassword(String userID, String newUserPassword) {
        return administratorDao.changePassword(userID,newUserPassword);
    }

}
