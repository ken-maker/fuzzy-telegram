package com.bean;

import lombok.Data;

import java.math.BigDecimal;

//器材
@Data
public class Equipment {
    private Integer id;
    private String name;
    private BigDecimal price;
    private Integer state;//1：正常 ，2：禁用
    private Integer type;
    private String picture;

}