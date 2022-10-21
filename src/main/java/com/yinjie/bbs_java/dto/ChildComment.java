package com.yinjie.bbs_java.dto;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@TableName("bbs_child_comment")
public class ChildComment {

    @TableField("id")
    private Integer id;

    @TableField("article_id")
    private Integer articleId;

    @TableField("parent_id")
    private String parentId;

    @TableField("reply_id")
    private String replyId;

    @TableField("reply_email")
    private String replyEmail;

    @TableField("reply_nick_name")
    private String replyNickName;

    @TableField("reply_avatar")
    private String replyAvatar;

    @TableField("reply_reply_id")
    private String replyReplyId;

    @TableField("reply_reply_email")
    private String replyReplyEmail;

    @TableField("reply_reply_nick_name")
    private String replyReplyNickName;

    @TableField("reply_reply_avatar")
    private String replyReplyAvatar;

    @TableField("content")
    private String content;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private String createTime;

    @TableField(value = "update_time",fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

}
