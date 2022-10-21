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
import lombok.ToString;

/**
 * <p>
 *
 * </p>
 *
 * @author Jack
 * @since 2022-04-25 11:10:37
 */
@Getter
@Setter
@TableName("bbs_message")
@ApiModel(value = "Message对象", description = "")
@ToString
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("id")
    private Integer id;

    @TableField("ori_id")
    private String oriId;

    @TableField("des_id")
    private String desId;

    @TableField("mes_type")
    private Integer mesType;

    @TableField("content")
    private String content;

    @TableField("is_delete")
    private Integer isDelete;

    @TableField("status")
    private Integer status;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private String createTime;

    @TableField(value = "update_time",fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private String  email;

    @TableField(exist = false)
    private String  nickName;

    @TableField(exist = false)
    private String  avatar;
}
