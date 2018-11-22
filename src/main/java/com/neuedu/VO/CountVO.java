package com.neuedu.VO;

import lombok.Data;

@Data
public class CountVO {
    private String name;
    private Integer value;


    public CountVO(String name, Integer value) {
        this.name = name;
        this.value = value;
    }
}
