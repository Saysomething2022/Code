package com.yinjie.bbs_java.service.impl;

import com.yinjie.bbs_java.entity.Message;
import com.yinjie.bbs_java.mapper.MessageMapper;
import com.yinjie.bbs_java.service.MessageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Jack
 * @since 2022-04-25 11:10:37
 */
@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements MessageService {

    @Autowired
    private MessageMapper messageMapper;

    @Override
    public List<Message> selectAllMessage(String uid) {
        return messageMapper.selectAllMessage(uid);
    }
}
