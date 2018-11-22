package com.neuedu.controller;

import com.neuedu.VO.LoginResult;
import com.neuedu.VO.RegistResult;
import com.neuedu.VO.Result;
import com.neuedu.entity.User;
import com.neuedu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;



    @GetMapping("/loginView")
    public String loginView(){


        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public Result login(User user, HttpSession httpSession,HttpServletResponse response,HttpServletRequest request){
        User dataUser = userService.getUserByUsername(user.getUsername());

        if (dataUser == null){

            return LoginResult.NOT_USERNAME;
        }else {
            if (dataUser.getPassword().equals(user.getPassword())){
                //记住登录状态
                httpSession.setAttribute("user",dataUser);
                Cookie cookie = new Cookie("username",dataUser.getUsername());
                cookie.setPath("/");
                cookie.setMaxAge(60*60);
                response.addCookie(cookie);
                return LoginResult.LOGIN_SUCCESS;
            }else {

                return LoginResult.NOT_PASSWORD;
            }
        }

    }
    @GetMapping("/registView")
    public String registView(){
        return "register";
    }

    @GetMapping("/checkusername")
    @ResponseBody
    public Result checkusername(String username){
        User user =  userService.getUserByUsername(username);
        if (user == null){
            return RegistResult.USERNAME_OK;
        }
        return RegistResult.USERNAME_EXIST;
    }
    @PostMapping("/regist")
    public String regist(String username, String password) {
        System.out.println(username+"" +password);
        //通过request对象获得服务器的真实路径MultipartFile headimg,

        //String serverRealPath = request.getServletContext().getRealPath("/upload");

        //构建一个file
        //File serverFile = new File(serverRealPath);
        //if (!serverFile.exists()){
        //    serverFile.mkdirs();
        //}
        //String fileName = headimg.getOriginalFilename();

        //生成一个新名字
        //1.系统当前毫秒值+随机数
        //2.使用uuid
        //String uuid = UUID.randomUUID().toString();

        //String filePath = serverRealPath + "/" + uuid + fileName.substring(fileName.lastIndexOf("."));
        //拼接文件的file
        //File file = new File(filePath);
        //将上传过来的文件写入file中
        //headimg.transferTo(file);

        //构建user对象
        User user = new User();
        user.setUsername(username);
        /*String headimgPath = filePath.substring(filePath.lastIndexOf("\\upload"));*/
        user.setPassword(password);
        /*user.setHeadimg(headimgPath);*/
        userService.saveUser(user);
        //插入到数据库
        return "redirect:/user/loginView";
    }


    @GetMapping("/createcode")
    public String createcode(HttpServletRequest req,HttpServletResponse resp,HttpSession httpSession){

        BufferedImage image = new BufferedImage(60,30,BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        Random r = new Random();
        g.setColor(new Color(r.nextInt(256),r.nextInt(256),r.nextInt(256)));
        g.fillRect(0,0,60,30);
        g.setColor(new Color(r.nextInt(256),r.nextInt(256),r.nextInt(256)));
        g.setFont(new Font("微软雅黑",Font.BOLD,20));

        Integer code =r.nextInt(8999) + 1000;

        /*HttpSession httpSession = req.getSession();*/
        httpSession.setAttribute("code",code);
        g.drawString(String.valueOf(code),10,25);
        g.setColor(Color.black);
        g.drawLine(r.nextInt(60),r.nextInt(30),r.nextInt(60),r.nextInt(30));
        g.drawLine(r.nextInt(60),r.nextInt(30),r.nextInt(60),r.nextInt(30));
        g.drawLine(r.nextInt(60),r.nextInt(30),r.nextInt(60),r.nextInt(30));

        resp.setContentType("image/jpeg");
        ServletOutputStream sos ;
        try {
            sos = resp.getOutputStream();

            ImageIO.write(image,"jpeg",sos);
            sos.close();

        } catch (IOException e) {
            e.printStackTrace();
        }




        return "registView";
    }

    @GetMapping("/getcode")
    @ResponseBody
    public Integer getcode(HttpServletRequest req){

        HttpSession httpSession = req.getSession();
        Integer code = (Integer) httpSession.getAttribute("code");
       /* PrintWriter out = resp.getWriter();
        out.print(code);

        out.close();*/
        //System.out.println(code);
        return code;
    }



}
