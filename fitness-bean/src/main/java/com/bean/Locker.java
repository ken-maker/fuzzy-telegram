package com.bean;

import lombok.Data;

import java.math.BigDecimal;

//储物柜
@Data
public class Locker {
    private Integer id;
    private String size;//小、中、大号柜
    private BigDecimal aMothMoney;//月租
    private String state;//正常；损坏
    private String picture;//照片名
    private String place;//柜子位置（001）

}