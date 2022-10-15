package com.yinjie.bbs_java.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Collection;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

/**
 * <p>
 * 
 * </p>
 *
 * @author Jack
 * @since 2022-03-18 10:23:25
 */
@Getter
@Setter
@TableName("bbs_user_collection")
@ToString
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value = "UserCollection对象", description = "")
public class UserCollection implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("user_id")
    private String userId;

    @TableField("article_id")
    private Integer articleId;

    @TableField(exist = false)
    private Integer isCollection;


}
