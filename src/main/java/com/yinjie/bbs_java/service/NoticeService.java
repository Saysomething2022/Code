package com.yinjie.bbs_java.service;

import com.yinjie.bbs_java.entity.Notice;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jack
 * @since 2022-04-12 22:57:16
 */
public interface NoticeService extends IService<Notice> {

    Notice selectNoticeDetail(Integer id);
}
