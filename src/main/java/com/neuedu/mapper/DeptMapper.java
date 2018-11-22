package com.neuedu.mapper;

import com.neuedu.entity.Dept;

import java.util.List;

public interface DeptMapper {

    List<Dept> listDept();

    int deleteDeptById(Integer id);

    int updateDept(Dept dept);

    int saveDept(Dept dept);

    Dept selectDeptById(Integer id);

    int deleteDeptAll(Integer[] ids);
}
