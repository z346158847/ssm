package com.neuedu.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Emp implements Serializable {


    private static final long serialVersionUID = 809221666143369454L;
    private Integer emp_id;
    private String name;
    private String phone;
    private String sex;
    private Integer salary;
    private Integer dept_id;

    private Dept dept;


}
