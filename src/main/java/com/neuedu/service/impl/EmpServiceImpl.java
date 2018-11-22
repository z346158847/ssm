package com.neuedu.service.impl;

import com.neuedu.entity.Emp;
import com.neuedu.mapper.EmpMapper;
import com.neuedu.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpMapper empMapper;



    @Override
    public List<Emp> listEmp() {
        return empMapper.listEmp();
    }

    @Override
    public int deleteEmpById(Integer id) {
        return empMapper.deleteEmpById(id);
    }

    @Override
    public int saveEmp(Emp emp) {

        return empMapper.saveEmp(emp);
    }

    @Override
    public int updateEmp(Emp emp) {
        return empMapper.updateEmp(emp);
    }

    @Override
    public Emp selectEmpById(Integer id) {
        return empMapper.selectEmpById(id);
    }

    @Override
    public int deleteEmpAll(String ids) {
        return empMapper.deleteEmpAll(ids);
    }

    /*@Override
    public int deleteEmpAll(Integer[] ids) {
        return empMapper.deleteEmpAll(ids);
    }*/

    @Override
    public List<Emp> getEmpByName(String name) {
        return empMapper.getEmpByName(name);
    }

    @Override
    public List<Emp> getEmpByParam(String name, String phone, String sex, Integer salary) {
        return empMapper.getEmpByParam(name,phone,sex,salary);
    }

    /*@Override
    public int deleteAllByDeptId(Integer[] ids) {
        return empMapper.deleteAllByDeptId(ids);
    }*/



}
