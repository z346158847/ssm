package com.neuedu.controller;

import com.neuedu.VO.CountVO;
import com.neuedu.entity.Dept;
import com.neuedu.entity.Emp;
import com.neuedu.service.DeptService;
import com.neuedu.service.EmpService;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = {"/dept"})//模块多加虚拟路径
public class DeptController {

    @Autowired
    private DeptService deptService ;
    @Autowired
    private EmpService empService;



    //@RequestMapping(value = {"/deptlist"})
    @GetMapping(value = {"/deptlist"})
    public String deptListView(ModelMap map){
        map.put("deptList",deptService.listDept());
        return "deptlist";
    }


    //@RequestMapping(value = {"/deleteDeptById"})
    @GetMapping("/deleteDeptById")
    public String deleteDeptById(Integer id){


        deptService.deleteDeptById(id);
        return "redirect:deptlist";
    }

    @GetMapping("/deleteDeptAll")
    public String deleteDeptAll(Integer[] ids){



        deptService.deleteDeptAll(ids);
        return "redirect:deptlist";
    }


    //@RequestMapping(value = {"/addDeptView"})
    @GetMapping("/addDeptView")
    public String addDeptView(){

        return "addDept";
    }

    //@RequestMapping(value = "/addDept",method = {RequestMethod.POST})
    @PostMapping("/addDept")
    public String addDept(Dept dept){
        deptService.saveDept(dept);
        return "redirect:deptlist";
    }

    @GetMapping("/updateDeptView")
    public String updateDeptView(Integer id,ModelMap map){
        map.put("dept",deptService.selectDeptById(id));
        return "updateDept";
    }


    @PostMapping("/updateDept")
    public String updateDept(Dept dept){
        deptService.updateDept(dept);
        return "redirect:deptlist";
    }

    @GetMapping("/countempdeptView")

    public String countsexView(){


        return "countempdept";
    }

    /*@GetMapping("/count")
    public String countEmpDept(HttpServletResponse response){

        List<Emp> empList = empService.listEmp();
        List<Dept> deptList = deptService.listDept();
        List<CountVO> countVOList = new ArrayList<>();


        Integer count = 0;


        for (Dept dept : deptList) {

            for (Emp emp : empList) {
                if (emp.getDept_id().equals(dept.getDept_id())){
                    count++;
                }
            }
            countVOList.add(new CountVO(dept.getDname(),count));
            count=0;
        }


        JSONArray jsonArray = new JSONArray(countVOList);

        try {
            response.setContentType("application/json;charset=utf-8");
            PrintWriter out = response.getWriter();

            out.print(jsonArray.toString());

            out.close();


        } catch (IOException e) {
            e.printStackTrace();
        }
        return "countempdept";
    }*/
    @GetMapping("/count")
    @ResponseBody
    public String countEmpDept(HttpServletResponse response){

        List<Emp> empList = empService.listEmp();
        List<Dept> deptList = deptService.listDept();
        List<CountVO> countVOList = new ArrayList<>();
        Integer count = 0;
        for (Dept dept : deptList) {

            for (Emp emp : empList) {
                if (emp.getDept_id().equals(dept.getDept_id())){
                    count++;
                }
            }
            countVOList.add(new CountVO(dept.getDname(),count));
            count=0;
        }


        JSONArray jsonArray = new JSONArray(countVOList);

        try {
            response.setContentType("application/json;charset=utf-8");
            PrintWriter out = response.getWriter();

            out.print(jsonArray.toString());

            out.close();


        } catch (IOException e) {
            e.printStackTrace();
        }
        return "countempdept";
    }





}
