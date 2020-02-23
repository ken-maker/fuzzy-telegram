package com.service.impl;

import com.bean.Employee;
import com.dao.EmployeeDao;
import com.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;//spring-context.jar

import java.math.BigDecimal;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public int addEmployee(Employee employee) {
        return employeeDao.addEmployee(employee);
    }

    @Override
    public int deleteEmployee(int id) {
        return employeeDao.deleteEmployee(id);
    }

    @Override
    public List<Employee> getEmployeeList(int pageNum, int pageSize) {
        return employeeDao.getEmployeeList(pageNum,pageSize);
    }

    @Override
    public List<Employee> getEmployeeListByGender(int pageNum, int pageSize, int gender) {
        return employeeDao.getEmployeeListByGender(pageNum,pageSize,gender);
    }

    @Override
    public List<Employee> getEmployeeListByAge(int pageNum, int pageSize, int age) {
        return employeeDao.getEmployeeListByAge(pageNum,pageSize,age);
    }

    @Override
    public List<Employee> getEmployeeListBySalary(int pageNum, int pageSize, BigDecimal salary) {
        return employeeDao.getEmployeeListBySalary(pageNum,pageSize,salary);
    }

    @Override
    public List<Employee> getEmployeeListByEmployeeTypeId(int pageNum, int pageSize) {
        return employeeDao.getEmployeeListByEmployeeTypeId(pageNum,pageSize);
    }

    @Override
    public Employee getEmployeeByPhoneNumber(String phoneNumber) {
        return employeeDao.getEmployeeByPhoneNumber(phoneNumber);
    }

    @Override
    public Employee getEmployeeByIdentityCard(String identityCard) {
        return employeeDao.getEmployeeByIdentityCard(identityCard);
    }

    @Override
    public Employee getEmployeeById(int id) {
        return employeeDao.getEmployeeById(id);
    }

    @Override
    public int updateEmployee(int id, Employee newEmployee) {
        return employeeDao.updateEmployee(id,newEmployee);
    }

    @Override
    public List<Employee> getTrainerList(int pageNum, int pageSize) {
        return employeeDao.getTrainerList(pageNum,pageSize);
    }

    @Override
    public Employee getTrainerById(int id) {
        return employeeDao.getTrainerById(id);
    }
}
