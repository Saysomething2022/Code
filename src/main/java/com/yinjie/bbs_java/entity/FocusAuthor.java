package com.yinjie.bbs_java.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * <p>
 * 
 * </p>
 *
 * @author Jack
 * @since 2022-03-13 17:01:47
 */
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
