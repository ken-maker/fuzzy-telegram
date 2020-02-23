package com.bean;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class Order {
    private String id;//订单编号
    private Integer builder; //私教（员工表）外键
    private String name;//订单名称
    private BigDecimal money;//交易金额
    private Integer trainerId;//私教
    private String dateTime;//订单创建时间，由数据库自行添加
    private String remark;//订单描述

}
