package com.neuedu.service;

import com.neuedu.entity.Emp;

import java.util.List;

public interface EmpService {

    List<Emp> listEmp();

    int deleteEmpById(Integer id);

    int saveEmp(Emp emp);

    int updateEmp(Emp emp);

    Emp selectEmpById(Integer id);

    //int deleteEmpAll(Integer[] ids);
    int deleteEmpAll(String ids);

    List<Emp> getEmpByName( String name);

    List<Emp> getEmpByParam(String name,String phone,String sex,Integer salary);


    //int deleteAllByDeptId(Integer[] ids);

}
