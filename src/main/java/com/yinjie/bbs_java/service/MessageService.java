package com.yinjie.bbs_java.service;

import com.yinjie.bbs_java.entity.Message;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 */
public interface MessageService extends IService<Message> {

    List<Message> selectAllMessage(String uid);
}
