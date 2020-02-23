package com.dao;

import com.bean.Order;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface OrderDao {

//    添加订单
    int addOrder(String id, int builder, String name,int trainerId, BigDecimal money,String remark);

//    删除订单
    int deleteOrder(String id);

//    根据订单编号查询订单，只有一个
    Order getOrderById(String id);

//    查询所有订单
    List<Order> getOrderList(@Param("pageNum") int pageNum,
                             @Param("pageSize") int pageSize);


//    根据订单创建者来查询订单，可有多个
    List<Order> getOrderListByBuilder(@Param("pageNum") int pageNum,
                                      @Param("pageSize") int pageSize,
                                      int builder);

//    根据订单名称查询订单，可有多个
    List<Order> getOrderListByName(@Param("pageNum") int pageNum,
                                   @Param("pageSize") int pageSize,
                                   String name);
//    根据交易金额查询订单，可有多个
    List<Order> getOrderListByMoney(@Param("pageNum") int pageNum,
                                   @Param("pageSize") int pageSize,
                                   BigDecimal money);

//    根据创建日期查询订单，可有多个
    List<Order> getOrderListByDateTime(@Param("pageNum") int pageNum,
                                   @Param("pageSize") int pageSize,
                                   String dateTime);
}
