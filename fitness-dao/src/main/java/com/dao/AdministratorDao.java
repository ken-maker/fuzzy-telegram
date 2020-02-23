package com.dao;

import com.bean.Administrator;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdministratorDao {

    //根据ID查询操作员
    Administrator getAdministrator(String userID);

    //获取全部操作员
    List<Administrator> getAdministratorList(@Param("pageNum") int pageNum,
                                             @Param("pageSize") int pageSize);

    //添加操作员
    int addAdministrator(Administrator administrator);

    //注销操作员
    int logoutAdministrator(String userID);

    //修改密码
    int changePassword(String userID,String newUserPassword);

//    //修改使用状态（0:正常，1:被禁用）
//    int changeState(String userID,int newState);
}
