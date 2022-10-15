package com.yinjie.bbs_java.service.impl;

import com.yinjie.bbs_java.entity.Notice;
import com.yinjie.bbs_java.mapper.NoticeMapper;
import com.yinjie.bbs_java.service.NoticeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Jack
 * @since 2022-04-12 22:57:16
 */
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice> implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public Notice selectNoticeDetail(Integer id) {
        return noticeMapper.selectNoticeDetail(id);
    }
}
