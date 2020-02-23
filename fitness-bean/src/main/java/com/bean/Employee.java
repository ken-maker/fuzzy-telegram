package com.bean;

import lombok.Data;

import java.math.BigDecimal;
import java.sql.Date;

@Data
public class Employee {
    private Integer id;
    private String name;
    private Integer age;
    private Integer gender;
    private BigDecimal salary;
    private String idCard;
    private String address;
    private String phoneNumber;
    private Double employmentTerm;//聘用时长。注意：这里的Date类型是sql的
    private Date startEmploy;//开始聘用日期
    private Integer employeeTypeId;
    private String picture;
    private Integer teachAge;

}