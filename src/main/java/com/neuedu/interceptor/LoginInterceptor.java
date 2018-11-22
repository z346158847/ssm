package com.neuedu.interceptor;

import com.neuedu.entity.User;
import com.neuedu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService userService;

    //在controller方法执行前执行，如果此方法返回true才向下执行
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession httpSession = httpServletRequest.getSession();
        User user = (User) httpSession.getAttribute("user");
        if (user == null){
            Cookie[] cookies = httpServletRequest.getCookies();
            if (cookies == null) {
                httpServletResponse.sendRedirect(httpServletRequest.getServletContext().getContextPath() + "/user/loginView");
                return false;
            }else {
                boolean isLogin = false;
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        String username = cookie.getValue();
                        User user1 = userService.getUserByUsername(username);
                        httpSession.setAttribute("user", user1);
                        isLogin = true;
                        return true;
                    }
                }
                if (!isLogin){
                    httpServletResponse.sendRedirect(httpServletRequest.getServletContext().getContextPath() + "/user/loginView");
                    return false;
                }

            }

            httpServletResponse.sendRedirect(httpServletRequest.getServletContext().getContextPath() + "/user/loginView");
            return false;
        }
        return true;



    }

    //在controller方法执行之后并且处理结果之前执行
    //补充moderView的值
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    //处理完结果之后，在http响应之前
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
