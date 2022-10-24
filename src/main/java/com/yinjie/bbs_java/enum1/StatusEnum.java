package com.yinjie.bbs_java.enum1;

import com.baomidou.mybatisplus.annotation.EnumValue;

/**
author:flt-Rottenklutz
**/

public enum StatusEnum {

    NORMAL(0,"已审核"),
    NOT_NORMAL(1,"待审核"),
    EXIT_DELETE(2,"已删除");

    @EnumValue
    private int status;
    private String descp;

    StatusEnum(int status, String descp) {
        this.status = status;
        this.descp = descp;
    }
}
