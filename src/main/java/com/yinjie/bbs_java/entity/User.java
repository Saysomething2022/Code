package com.yinjie.bbs_java.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.lang.reflect.Field;

import io.swagger.annotations.ApiModel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

/**
author:flt-Rottenklutz
**/
@Getter
@Setter
@TableName("bbs_user")
@ToString
@ApiModel(value = "User对象", description = "用户")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id",type = IdType.ASSIGN_UUID)
    private String id;

    @NotBlank(message = "邮箱不能为空")
    @Email(message = "邮箱格式不对")
    @TableField("email")
    private String email;

    @NotBlank(message = "邮箱不能为空")
    @TableField("password")
    private String password;

    @TableField("avatar")
    private String avatar;

    @TableField("status")
    private Integer status;

    @TableLogic
    @TableField("is_delete")
    private Integer isDelete;

    @TableField("salt")
    private String salt;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private String createTime;

    @TableField(value = "update_time",fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private String role;

    @TableField("`describe`")
    private String describe;

    @TableField("`nick_name`")
    private String nickName;


}
