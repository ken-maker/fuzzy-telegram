package com.bean;

import lombok.Data;

@Data
public class VIP_Card {
    private Integer id;
    private Integer type;//卡型，1就是一年
    private String handingDate;
    private String state;//状态：挂失、正常、禁用
}