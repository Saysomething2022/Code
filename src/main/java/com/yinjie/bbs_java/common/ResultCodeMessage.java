package com.yinjie.bbs_java.common;

public enum ResultCodeMessage {
    SUCCESS(0,"请求成功"),
    FAIL(1,"请求失败"),
    TOKEN_FAILURE(2,"token已经失效，请重新登录"),

    USERNAME_OR_PASSWORD_EMPTY(100,"账号密码不能为空"),
    NOT_EXIST_USER(101, "账号不存在"),
    PASSWORD_ERROR(102, "账号或密码错误"),
    EXIST_USER(103,"账号已经存在,请去登录"),
    NOT_PERMISSIONS(104,"没有权限，请先登录"),
    EXIST_SENSITIVE_WORDS(105,"文章存在敏感词"),
    NOT_FOCUS_OWN(106,"不能关注自己");
    private int code;
    private String message;

    ResultCodeMessage(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
