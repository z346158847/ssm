package com.neuedu.VO;

public class RegistResult extends Result{

    public RegistResult(Integer code, String message) {
        super(code, message);
    }

    public static final RegistResult USERNAME_EXIST = new RegistResult(0,"用户名已存在");
    public static final RegistResult USERNAME_OK = new RegistResult(1,"用户名可用");

}
