package com.neuedu.VO;

import lombok.Data;

@Data
public abstract class Result {

    private Integer code;
    private String message;



    public Result(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

   /* public static final Result NOT_USERNAME = new Result(0,"用户名不存在");
    public static final Result LOGIN_SUCCESS = new Result(1,"登陆成功");
    public static final Result NOT_PASSWORD = new Result(2,"密码错误");*/


}
