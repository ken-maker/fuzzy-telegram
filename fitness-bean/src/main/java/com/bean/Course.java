package com.bean;

import lombok.Data;

//课程
@Data//这个注解自动生成
public class Course {
    private Integer id;
    private String name;
    private String type;
    private Integer peopleCount;
    private String picture;
    private Integer nowPeople;
    private String classTime;

}
