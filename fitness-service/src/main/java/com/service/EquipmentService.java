package com.service;

import com.bean.Equipment;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface EquipmentService {

    //根据id查询器材
    Equipment getEquipmentById(int id);

    //获取全部器材
    List<Equipment> getEquipmentList(@Param("pageNum") int pageNum,
                                     @Param("pageSize") int pageSize);

    //根据价格来查询器材
    List<Equipment> getEquipmentListByPrice(@Param("pageNum") int pageNum,
                                            @Param("pageSize") int pageSize,
                                            BigDecimal price);

    //根据器材名来查询器材
    List<Equipment> getEquipmentListByName(@Param("pageNum") int pageNum,
                                           @Param("pageSize") int pageSize,
                                           String name);

    //根据赔偿金来查询器材
    List<Equipment> getEquipmentListByDamage(@Param("pageNum") int pageNum,
                                             @Param("pageSize") int pageSize,
                                             BigDecimal damage);

    //根据类型来查询器材（如：胸部、腿部）
    List<Equipment> getEquipmentListByType(@Param("pageNum") int pageNum,
                                           @Param("pageSize") int pageSize,
                                           int type);

    //根据状态来查询器材（如：正常、禁用）
    List<Equipment> getEquipmentListByState(@Param("pageNum") int pageNum,
                                            @Param("pageSize") int pageSize,
                                            int state);

    //添加器材
    int addEquipment(Equipment equipment);

    //注销器材
    int logoutEquipment(int id);

    //修改状态
    int changeState(int id,int newState);

    //修改类型
    int changeType(int id,int newType);
}
