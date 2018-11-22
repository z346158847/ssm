package com.neuedu.mapper;


import com.neuedu.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpMapper {
    List<Emp> listEmp();

    int deleteEmpByDeptId(Integer id);

    int deleteEmpById(Integer id);

    int saveEmp(Emp emp);

    //List<Emp> listEmp(Integer start,Integer count);

    int updateEmp(Emp emp);

    Emp selectEmpById(Integer id);

    //int deleteEmpAll(Integer[] ids);
    int deleteEmpAll(@Param("ids")String ids);

    int deleteAllByDeptId(Integer[] ids);

    List<Emp> getEmpByName(@Param("name") String name);

    List<Emp> getEmpByParam(@Param("name")String name,@Param("phone")String phone,@Param("sex")String sex,@Param("salary")Integer salary);


}
