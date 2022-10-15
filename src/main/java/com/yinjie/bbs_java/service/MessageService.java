package com.yinjie.bbs_java.service;

import com.yinjie.bbs_java.entity.Message;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jack
 * @since 2022-04-25 11:10:37
 */
public interface MessageService extends IService<Message> {

    List<Message> selectAllMessage(String uid);
}
