package com.yinjie.bbs_java.entity;

/**
author:flt-Rottenklutz
**/
import com.baomidou.mybatisplus.annotation.*;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@TableName("bbs_focus_author")
@ToString
@ApiModel(value = "FocusAuthor对象", description = "")
public class FocusAuthor implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("focus_id")
    private String focusId;

    @TableField("focused_id")
    private String focusedId;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private String createTime;

    @TableField(value = "update_time",fill = FieldFill.INSERT_UPDATE)
    private String updateTime;


}
