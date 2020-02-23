package com.service.impl;

import com.bean.Order;
import com.dao.OrderDao;
import com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public int addOrder(String id, int builder, String name,int trainerId, BigDecimal money, String remark) {
        return orderDao.addOrder(id,builder,name,trainerId,money,remark);
    }

    @Override
    public int deleteOrder(String id) {
        return orderDao.deleteOrder(id);
    }

    @Override
    public Order getOrderById(String id) {
        return orderDao.getOrderById(id);
    }

    @Override
    public List<Order> getOrderList(int pageNum, int pageSize) {
        return orderDao.getOrderList(pageNum,pageSize);
    }

    @Override
    public List<Order> getOrderListByBuilder(int pageNum, int pageSize, int builder) {
        return orderDao.getOrderListByBuilder(pageNum,pageSize,builder);
    }

    @Override
    public List<Order> getOrderListByName(int pageNum, int pageSize, String name) {
        return orderDao.getOrderListByName(pageNum,pageSize,name);
    }

    @Override
    public List<Order> getOrderListByMoney(int pageNum, int pageSize, BigDecimal money) {
        return orderDao.getOrderListByMoney(pageNum,pageSize,money);
    }

    @Override
    public List<Order> getOrderListByDateTime(int pageNum, int pageSize, String dateTime) {
        return getOrderListByDateTime(pageNum,pageSize,dateTime);
    }
}
