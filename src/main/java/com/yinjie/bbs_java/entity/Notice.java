package com.yinjie.bbs_java.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.PipedReader;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;

/**
author:flt-Rottenklutz
**/
@Getter
@Setter
@TableName("bbs_notice")
@ApiModel(value = "Notice对象", description = "")
@ToString
public class Notice implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @NotBlank(message = "标题不能为空")
    @TableField("title")
    private String title;

    @NotBlank(message = "内容不能为空")
    @TableField("content")
    private String content;

    @TableField("creator_id")
    private String creatorId;

    @TableField("is_delete")
    private Integer isDelete;

    @TableField("status")
    private Integer status;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private String createTime;

    @TableField(value = "update_time",fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private String avatar;

    @TableField(exist = false)
    private String email;

    @TableField(exist = false)
    private String nickName;

}
