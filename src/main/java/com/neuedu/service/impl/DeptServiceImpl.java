package com.neuedu.service.impl;

import com.neuedu.entity.Dept;
import com.neuedu.mapper.DeptMapper;
import com.neuedu.mapper.EmpMapper;
import com.neuedu.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    @Autowired
    private EmpMapper empMapper;

    @Override
    public List<Dept> listDept() {
        return deptMapper.listDept();
    }

    @Override
    public int deleteDeptById(Integer id) {

        empMapper.deleteEmpByDeptId(id);
        int count = deptMapper.deleteDeptById(id);
        return count;
    }

    @Override
    public int saveDept(Dept dept) {

        return deptMapper.saveDept(dept);
    }

    @Override
    public int updateDept(Dept dept) {
        return deptMapper.updateDept(dept);
    }

    @Override
    public Dept selectDeptById(Integer id) {


        return deptMapper.selectDeptById(id);
    }

    @Override
    public int deleteDeptAll(Integer[] ids) {
        empMapper.deleteAllByDeptId(ids);
        return deptMapper.deleteDeptAll(ids);
    }


}
