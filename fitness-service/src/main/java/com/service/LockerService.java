package com.service;

import com.bean.Locker;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LockerService {
    //根据id查询储物柜
    Locker getLocker(int id);

    //查询全部储物柜
    List<Locker> getLockerList(@Param("pageNum") int pageNum,
                               @Param("pageSize") int pageSize);

    //根据状态查询全部储物柜
    List<Locker> getLockerListByState(@Param("pageNum") int pageNum,
                                      @Param("pageSize") int pageSize,
                                      int state);

    //添加储物柜
    int addLocker(Locker locker);

    //注销储物柜
    int logoutLocker(int id);

    //修改状态
    int changeState(int id,int newState);

}
