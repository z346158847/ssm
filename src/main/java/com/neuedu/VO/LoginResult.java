package com.neuedu.VO;

import lombok.Data;

@Data

public class LoginResult extends Result{
    public LoginResult(Integer code, String message) {
        super(code, message);
    }





    public static final Result NOT_USERNAME = new LoginResult(0,"用户名不存在");
    public static final Result LOGIN_SUCCESS = new LoginResult(1,"登陆成功");
    public static final Result NOT_PASSWORD = new LoginResult(2,"密码错误");
}
