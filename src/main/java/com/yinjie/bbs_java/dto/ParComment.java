package com.yinjie.bbs_java.dto;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@TableName("bbs_par_comment")
public class ParComment {

    @TableField("id")
    private Integer id;

    @TableField("article_id")
    private Integer articleId;

    @TableField("user_id")
    private String userId;

    @TableField("user_email")
    private String userEmail;

    @TableField("user_avatar")
    private String userAvatar;

    @TableField("content")
    private String content;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private String createTime;

    @TableField(value = "update_time",fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField("nick_name")
    private String nickName;

    @TableField(exist = false)
    private List<ChildComment> childCommentList;

}
