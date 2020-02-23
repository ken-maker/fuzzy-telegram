package com.bean;

import lombok.Data;

import java.sql.Date;

@Data
public class VIP {
    private Integer id;//编号
    private String userID;//账号
    private String password;//密码
    private String name;
    private Integer age;
    private Integer gender;
    private String phoneNumber;//
    private Date handingTime;
    private String identityCard;
    private String birthDay;
    private Integer vipCardId;
    private Integer lockerId;
    private Integer trainer;
    private String picture;
    private Double weight;
    private Double height;
    private Double shoulder;
    private Double chest;
    private Double waistline;
    private Double arm;
    private Double hipline;
    private Double BMI;
    private String bodyFatPercent;

}