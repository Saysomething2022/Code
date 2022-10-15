package com.yinjie.bbs_java.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.yinjie.bbs_java.common.Result;
import com.yinjie.bbs_java.dto.vo.MessageFilter;
import com.yinjie.bbs_java.entity.Message;
import com.yinjie.bbs_java.service.MessageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Api(tags = {"消息接口"})
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @ApiOperation(value = "消息列表",notes = "根据用户id查询消息")
    @GetMapping("/selectAllMessage")
    public Result selectAllMessage(String uid){
        List<Message> messageList = messageService.selectAllMessage(uid);
        return new Result(messageList);
    }

    @ApiOperation(value = "消息列表",notes = "查询所有消息")
    @GetMapping("/selectAllMessage1")
    public Result selectAllMessage1(MessageFilter messageFilter){
        QueryWrapper<Message> messageQueryWrapper = new QueryWrapper<>();
        if (messageFilter != null){
            if (!ObjectUtils.isEmpty(messageFilter.getOriId())){
                messageQueryWrapper.eq("ori_id",messageFilter.getOriId());
            }
            if (!ObjectUtils.isEmpty(messageFilter.getDesId())){
                messageQueryWrapper.eq("des_id",messageFilter.getDesId());
            }
            if (!ObjectUtils.isEmpty(messageFilter.getStartTime())){
                messageQueryWrapper.ge("create_time",messageFilter.getStartTime());
            }
            if (!ObjectUtils.isEmpty(messageFilter.getEndTime())){
                messageQueryWrapper.le("create_time",messageFilter.getEndTime());
            }
        }
        List<Message> messageList = messageService.list(messageQueryWrapper);
        return new Result(messageList);
    }

    @ApiOperation(value = "更新消息状态",notes = "可以将消息设置为已读还是未读")
    @GetMapping("/updateStatus")
    public Result updateStatus(Integer id, Integer status){
        try {
            messageService.update(new UpdateWrapper<Message>().set("status", status).eq("id", id));
            Message message = messageService.getOne(new QueryWrapper<Message>().eq("id", id));
            return new Result(message);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "一键已读接口",notes = "批量将消息改成已读")
    @GetMapping("/updateStatusBatch")
    public Result updateStatusBatch(String uid){
        try {
            messageService.update(new UpdateWrapper<Message>().set("status",1).eq("des_id",uid));
            List<Message> messageList = messageService.selectAllMessage(uid);
            return new Result(messageList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "一键清楚消息接口",notes = "将某个用户的消息全部删除")
    @GetMapping("/deleteMessageBatch")
    public Result deleteMessageBatch(String uid){
        try {
            messageService.remove(new QueryWrapper<Message>().eq("des_id",uid));
            List<Message> messageList = messageService.selectAllMessage(uid);
            return new Result(messageList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "未读消息数量",notes = "可以查询是否有未读的消息")
    @GetMapping("/selectUnread")
    public Result selectUnread(String uid){
        List<Message> messageList = messageService.list(new QueryWrapper<Message>().eq("status",0).eq("des_id",uid));
        return new Result(messageList.size());
    }
}
