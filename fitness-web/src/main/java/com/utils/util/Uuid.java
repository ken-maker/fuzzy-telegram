package com.utils.util;

import java.util.UUID;

public class Uuid {

    //获取唯一编码，账单编号
    public static String getUnique(){
        String uuid = UUID.randomUUID().toString();
        return uuid.replace("-","");
    }

    public static void main(String[] args) {
        System.out.println(getUnique());
    }
}
