package com.dao;

import com.bean.Employee;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface EmployeeDao {

    //添加员工
    int addEmployee(Employee employee);

    //删除员工
    int deleteEmployee(int id);

    //查询全部员工
    List<Employee> getEmployeeList(@Param("pageNum") int pageNum,
                                   @Param("pageSize") int pageSize);

    //根据性别查询员工
    List<Employee> getEmployeeListByGender(@Param("pageNum") int pageNum,
                                           @Param("pageSize") int pageSize,
                                           int gender);

    //根据年龄查询员工
    List<Employee> getEmployeeListByAge(@Param("pageNum") int pageNum,
                                           @Param("pageSize") int pageSize,
                                           int age);

    //根据工资查询员工
    List<Employee> getEmployeeListBySalary(@Param("pageNum") int pageNum,
                                           @Param("pageSize") int pageSize,
                                           BigDecimal salary);

    //根据职位类型查询员工
    List<Employee> getEmployeeListByEmployeeTypeId(@Param("pageNum") int pageNum,
                                           @Param("pageSize") int pageSize);


    //根据号码查询员工
    Employee getEmployeeByPhoneNumber(String phoneNumber);

    //根据身份证查询员工
    Employee getEmployeeByIdentityCard(String identityCard);

    //根据id查询员工
    Employee getEmployeeById(int id);

    //修改员工信息
    int updateEmployee(int id, Employee newEmployee);

   //----------------------私教----------------------------

    //查询全部私教
    List<Employee> getTrainerList(@Param("pageNum") int pageNum,
                                   @Param("pageSize") int pageSize);

    //根据id查询私教
    Employee getTrainerById(int id);


}
