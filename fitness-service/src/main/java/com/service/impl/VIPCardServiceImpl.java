package com.service.impl;

import com.bean.VIP;
import com.bean.VIP_Card;
import com.dao.VIPCardDao;
import com.mysql.fabric.xmlrpc.base.Data;
import com.service.VIPCardService;
import com.service.VIPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VIPCardServiceImpl implements VIPCardService {

    @Autowired
    private VIPCardDao vipCardDao;


    @Override
    public VIP_Card getCard(int id) {
        return vipCardDao.getCard(id);
    }

    @Override
    public List<VIP_Card> getCardList(int pageNum, int pageSize) {
        return vipCardDao.getCardList(pageNum,pageSize);
    }

    @Override
    public List<VIP_Card> getCardListByType(int pageNum, int pageSize, int type) {
        return vipCardDao.getCardListByType(pageNum,pageSize,type);
    }

    @Override
    public int addCard(VIP_Card card) {
        return vipCardDao.addCard(card);
    }

    @Override
    public int logoutCard(int id) {
        return vipCardDao.logoutCard(id);
    }

    @Override
    public int changeType(int id, int newType) {
        return vipCardDao.changeType(id,newType);
    }
}
