package com.yinjie.bbs_java.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
author:flt-Rottenklutz
**/
@Getter
@Setter
@TableName("bbs_system_log")
@ApiModel(value = "SystemLog对象", description = "")
public class SystemLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("id")
    private Integer id;

    @TableField("uid")
    private String uid;

    @TableField("ip")
    private String ip;

    @TableField("method_name")
    private String methodName;

    @TableField("`describe`")
    private String describe;

    @TableField("url")
    private String url;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private String createTime;

    @TableField(value = "update_time",fill = FieldFill.INSERT_UPDATE)
    private String updateTime;


}
