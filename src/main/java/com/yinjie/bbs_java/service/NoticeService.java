package com.yinjie.bbs_java.service;

import com.yinjie.bbs_java.entity.Notice;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 */
public interface NoticeService extends IService<Notice> {

    Notice selectNoticeDetail(Integer id);
}
