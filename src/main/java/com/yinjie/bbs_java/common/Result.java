package com.yinjie.bbs_java.common;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
@AllArgsConstructor
@NoArgsConstructor
public class Result<T> {
    private int code;
    private String message;
    private T data;

    public Result(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public Result (ResultCodeMessage result){
        this(result.getCode(), result.getMessage());
    }

    public Result(ResultCodeMessage result,T data){
        this.code = result.getCode();
        this.message = result.getMessage();
        this.data = data;
    }

    public Result(T data){
        this(ResultCodeMessage.SUCCESS,data);
    }

    public Result(Exception e){
        this(ResultCodeMessage.FAIL.getCode(),e.getMessage());
        log.error("请求失败了----》"+e.getMessage());
    }
}
