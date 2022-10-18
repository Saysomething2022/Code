package com.yinjie.bbs_java.mapper;

import com.yinjie.bbs_java.entity.Message;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 */
@Mapper
public interface MessageMapper extends BaseMapper<Message> {

    List<Message> selectAllMessage(String uid);

}
