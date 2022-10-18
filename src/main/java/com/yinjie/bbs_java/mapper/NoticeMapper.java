package com.yinjie.bbs_java.mapper;

import com.yinjie.bbs_java.entity.Notice;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 */
@Mapper
public interface NoticeMapper extends BaseMapper<Notice> {

    Notice selectNoticeDetail(Integer id);
}
