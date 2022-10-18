package com.yinjie.bbs_java.shiro;

import lombok.Data;

import java.io.Serializable;

@Data
public class AccountProfile implements Serializable {

    private String id;

    private String avatar;

    private String email;

}
