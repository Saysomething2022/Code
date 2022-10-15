package com.yinjie.bbs_java.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
public class UserDto implements Serializable {

    @TableId("id")
    private String id;

    @TableField("email")
    @NotBlank(message = "邮箱不能为空")
    @Email(message = "邮箱格式不正确")
    private String email;

    @NotBlank(message = "密码不能为空")
    @TableField("password")
    private String password;

    @TableField("avatar")
    private String avatar;

    @TableField("role")
    private String role;

    @TableField("create_time")
    private String createTime;

    @TableField("describe")
    private String describe;

    @TableField("nick_name")
    private String NickName;
}


