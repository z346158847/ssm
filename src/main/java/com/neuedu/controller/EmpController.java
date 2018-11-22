package com.neuedu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.VO.CountVO;
import com.neuedu.entity.Emp;
import com.neuedu.service.DeptService;
import com.neuedu.service.EmpService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = {"/emp"})
public class EmpController {


    @Autowired
    private EmpService empService;
    @Autowired
    private DeptService deptService;

    //@RequestMapping(value = {"/emplist"})
    /*@GetMapping(value = {"/emplist"})
    public String empListView(ModelMap map){
        map.put("empList",empService.listEmp());
        return "emplist";
    }*/


    //@RequestMapping(value = {"/deleteDeptById"})
    @GetMapping("/deleteEmpById")
    public String deleteEmpById(Integer id, HttpSession httpSession) {
        empService.deleteEmpById(id);
        PageInfo<Emp> pageInfo = (PageInfo<Emp>) httpSession.getAttribute("pageInfo");
        //通过计算出应该回到哪一页
        long x = (pageInfo.getTotal() - 1) % pageInfo.getSize();
        if (x == 0) {
            return "redirect:emplist?pageNum=" + pageInfo.getPrePage();
        }

        return "redirect:emplist?pageNum=" + pageInfo.getPageNum();
    }

    /*@GetMapping("/deleteEmpAll")
    public String deleteEmpAll(Integer[] ids) {
        for (Integer id : ids) {
            if (id == null) {
                return "redirect:emplist";
            }
        }

        empService.deleteEmpAll(ids);
        return "redirect:emplist";
    }*/


    @GetMapping("/deleteEmpAll")
    public String deleteEmpAll(String ids) {

        System.out.println(ids);

       empService.deleteEmpAll(ids);
        return "redirect:emplist";
    }


    //@RequestMapping(value = {"/addDeptView"})
    @GetMapping("/addEmpView")
    public String addDeptView(ModelMap map) {
        /*System.out.println(deptService.listDept().toString());*/
        map.put("empList", empService.listEmp());
        return "addEmp";
    }

    //@RequestMapping(value = "/addDept",method = {RequestMethod.POST})
    @PostMapping("/addEmp")
    public String addEmp(Emp emp) {
        empService.saveEmp(emp);
        return "redirect:emplist";
    }

    /* @RequestMapping("/login")
     public String login(){
         return "login";
     }
 */
    @GetMapping("/emplist")
    public String empList(ModelMap modelMap, @RequestParam(defaultValue = "1") Integer pageNum, HttpSession httpSession) {
        //一定要在查询之前设置页码等信息
        PageHelper.startPage(pageNum, 3);
        //httpSession.setAttribute("pageNum",pageNum);
        List<Emp> empList = empService.listEmp();
        PageInfo<Emp> pageInfo = new PageInfo<>(empList, 5);
        httpSession.setAttribute("pageInfo", pageInfo);
        modelMap.put("empList", empList);
        modelMap.put("pageInfo", pageInfo);
        return "emplist";
    }


    @GetMapping("/getEmpByName")
    public String getEmpByName(String name, ModelMap modelMap, @RequestParam(defaultValue = "1") Integer pageNum, HttpSession httpSession) {
        List<Emp> empList = empService.getEmpByName(name);
        PageHelper.startPage(pageNum, 3);
        //httpSession.setAttribute("pageNum",pageNum);

        PageInfo<Emp> pageInfo = new PageInfo<>(empList, 5);
        httpSession.setAttribute("pageInfo", pageInfo);
        modelMap.put("empList", empList);
        modelMap.put("pageInfo", pageInfo);

        return "emplist";
    }

    @GetMapping("/updateEmpView")
    public String updateEmpView(Integer id, ModelMap map) {
        /*System.out.println(deptService.listDept().toString());*/
        map.put("emp", empService.selectEmpById(id));
        map.put("empList", empService.listEmp());
        return "updateEmp";
    }

    //@RequestMapping(value = "/addDept",method = {RequestMethod.POST})
    @PostMapping("/updateEmp")
    public String updateEmp(Emp emp) {
        empService.updateEmp(emp);
        return "redirect:emplist";
    }





    /*@GetMapping("/countsex")

    public String countsex(ModelMap map){
        List<Emp> empList = empService.listEmp();
        List<CountVO> countVOList = new ArrayList<>();
        Integer mannum = 0;
        Integer womannum = 0;
        for (Emp emp : empList) {
            if (emp.getSex().equals("男")){
                mannum++;
            }else {
                womannum++;
            }
        }
        countVOList.add(new CountVO("男",mannum));
        countVOList.add(new CountVO("女",womannum));





        return "countsex";
    }
*/

    @GetMapping("/countsexView")

    public String countsexView() {


        return "countsex";
    }

   /* @GetMapping("/countsex")
    public String countsex(HttpServletResponse response){

        List<Emp> empList = empService.listEmp();
        List<CountVO> countVOList = new ArrayList<>();

        Integer mannum = 0;
        Integer womannum = 0;
        for (Emp emp : empList) {
            if (emp.getSex().equals("男")){
                ++mannum;
            }else {
                ++womannum;
            }
        }
        countVOList.add(new CountVO("男",mannum));
        countVOList.add(new CountVO("女",womannum));

        JSONArray jsonArray = new JSONArray(countVOList);

        try {
            response.setContentType("application/json;charset=utf-8");
            PrintWriter out = response.getWriter();

            out.print(jsonArray.toString());

            out.close();


        } catch (IOException e) {
            e.printStackTrace();
        }
        return "countsex";
    }*/

    @GetMapping("/countsex")
    @ResponseBody
    public List<CountVO> countsex() {

        List<Emp> empList = empService.listEmp();
        List<CountVO> countVOList = new ArrayList<>();

        Integer mannum = 0;
        Integer womannum = 0;
        for (Emp emp : empList) {
            if (emp.getSex().equals("男")) {
                ++mannum;
            } else {
                ++womannum;
            }
        }
        countVOList.add(new CountVO("男", mannum));
        countVOList.add(new CountVO("女", womannum));


        /* resp.setContentType("application/json;charset=utf-8");*/
        return countVOList;
    }


    @GetMapping("/index")
    public String index() {
        return "index";
    }


    @GetMapping("/getEmpByParam")
    public String getEmpByParam(ModelMap modelMap,String name,String phone,String sex,Integer salary){



        modelMap.put("empList",empService.getEmpByParam(name,phone,sex,salary));
        return "emplist";

    }

}
