/**
author:flt-Rottenklutz
**/
package com.yinjie.bbs_java.entity;

import com.baomidou.mybatisplus.annotation.*;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import lombok.*;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@TableName("bbs_article")
@ApiModel(value = "Article对象", description = "发表的文章")
public class Article implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @NotBlank(message = "标题不能为空")
    @TableField("title")
    private String title;

    @NotBlank(message = "内容不能为空")
    @TableField("content")
    private String content;

    @TableField("category")
    private String category;

    @TableField("status")
    private Integer status;

    @TableField("type_id")
    private Integer typeId;

    @TableField("author_id")
    private String authorId;

    @TableField("views")
    private Integer views;

    @TableField("approves")
    private Integer approves;

    @TableField("comments")
    private Integer comments;

    @TableField("collections")
    private Integer collections;

    @TableLogic
    @TableField("is_delete")
    private Integer isDelete;

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

    @TableField(exist = false)
    private String type;

    @TableField(exist = false)
    private Long approvesCount;

}
