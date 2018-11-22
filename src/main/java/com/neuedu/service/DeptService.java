package com.neuedu.service;

import com.neuedu.entity.Dept;

import java.util.List;

public interface DeptService {
    List<Dept> listDept();

    int deleteDeptById(Integer id);

    int saveDept(Dept dept);

    int updateDept(Dept dept);

    Dept selectDeptById(Integer id);

    int deleteDeptAll(Integer[] ids);

}
