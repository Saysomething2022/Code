package com.yinjie.bbs_java.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 *
 * </p>
 *
 * @author Jack
 * @since 2022-03-10 11:33:38
 */
@Getter
@Setter
@TableName("bbs_article_type")
@ApiModel(value = "ArticleType对象", description = "")
public class ArticleType implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("type")
    private String type;

    @TableField("status")
    private Integer status;

    @TableField("is_delete")
    private Integer isDelete;

    @TableField("creator_id")
    private String creatorId;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private String createTime;

    @TableField(value = "update_time",fill = FieldFill.INSERT_UPDATE)
    private String updateTime;


}
