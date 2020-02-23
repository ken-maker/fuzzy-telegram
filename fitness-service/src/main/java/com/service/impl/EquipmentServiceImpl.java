package com.service.impl;

import com.bean.Equipment;
import com.dao.EquipmentDao;
import com.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class EquipmentServiceImpl implements EquipmentService {

    @Autowired
    private EquipmentDao equipmentDao;


    @Override
    public Equipment getEquipmentById(int id) {
        return equipmentDao.getEquipmentById(id);
    }

    @Override
    public List<Equipment> getEquipmentList(int pageNum, int pageSize) {
        return equipmentDao.getEquipmentList(pageNum,pageSize);
    }

    @Override
    public List<Equipment> getEquipmentListByPrice(int pageNum, int pageSize, BigDecimal price) {
        return equipmentDao.getEquipmentListByPrice(pageNum,pageSize,price);
    }

    @Override
    public List<Equipment> getEquipmentListByName(int pageNum, int pageSize, String name) {
        return equipmentDao.getEquipmentListByName(pageNum,pageSize,name);
    }

    @Override
    public List<Equipment> getEquipmentListByDamage(int pageNum, int pageSize, BigDecimal damage) {
        return equipmentDao.getEquipmentListByDamage(pageNum,pageSize,damage);
    }

    @Override
    public List<Equipment> getEquipmentListByType(int pageNum, int pageSize, int type) {
        return equipmentDao.getEquipmentListByType(pageNum,pageSize,type);
    }

    @Override
    public List<Equipment> getEquipmentListByState(int pageNum, int pageSize, int state) {
        return equipmentDao.getEquipmentListByState(pageNum,pageSize,state);
    }

    @Override
    public int addEquipment(Equipment equipment) {
        return equipmentDao.addEquipment(equipment);
    }

    @Override
    public int logoutEquipment(int id) {
        return equipmentDao.logoutEquipment(id);
    }

    @Override
    public int changeState(int id, int newState) {
        return equipmentDao.changeState(id,newState);
    }

    @Override
    public int changeType(int id, int newType) {
        return equipmentDao.changeType(id,newType);
    }
}
