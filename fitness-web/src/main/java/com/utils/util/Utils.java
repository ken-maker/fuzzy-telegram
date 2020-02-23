package com.utils.util;

import java.util.Calendar;
import java.util.Date;

public class Utils {

    /**
     * 根据时间戳和随机数获取账号名
     */
    public static String getUserID(){
        String time = String.valueOf(new Date().getTime());
        String s = String.valueOf((int) (Math.random() * 8999) + 1000 + 1);
        System.out.println(time.substring(1, 7)+s);
        return "";
    }

    /**
     * 根据身份编号获取年龄
     *
     * @param idCard
     *            身份编号
     * @return 年龄
     */
    public static int getAgeByIdCard(String idCard) {
        int age =0;
        Calendar cal = Calendar.getInstance();
        int year = Integer.parseInt(idCard.substring(6, 10));
        int iCurrYear = cal.get(Calendar.YEAR);
        age =iCurrYear - year;
        return age;
    }

    /**
     * 根据身份编号获取生日
     *
     * @param idCard 身份编号
     * @return 生日(yyyyMMdd)
     */
    public static String getBirthByIdCard(String idCard) {
        String birthDay=idCard.substring(6, 10)+"-"+idCard.substring(10,12)+"-"+idCard.substring(12,14);
        return birthDay;
    }

    /**
     * 根据身份编号获取生日和生月
     *
     * @param idCard
     *            身份编号
     * @return 生日(MM)
     */
    public static String getMonthAndDayByIdCard(String idCard) {
        String MonthAndDay=idCard.substring(10, 12)+"-"+idCard.substring(12, 14);
        return MonthAndDay;
    }

    /**
     * 根据身份编号获取性别
     *
     * @param idCard 身份编号
     * @return 性别(M-男，F-女，N-未知)
     */
    public static int getGenderByIdCard(String idCard) {
        int Gender = -1;
        String sCardNum = idCard.substring(16, 17);
        if (Integer.parseInt(sCardNum) % 2 != 0) {
            Gender = 1;//男
        } else {
            Gender = 0;//女
        }
        return Gender;
    }
}
