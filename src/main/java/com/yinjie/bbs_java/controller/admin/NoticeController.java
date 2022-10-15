package com.yinjie.bbs_java.controller.admin;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.yinjie.bbs_java.common.Result;
import com.yinjie.bbs_java.common.ResultCodeMessage;
import com.yinjie.bbs_java.dto.vo.NoticeFilter;
import com.yinjie.bbs_java.entity.Notice;
import com.yinjie.bbs_java.service.NoticeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Jack
 * @since 2022-04-12 22:57:16
 */
@RestController
@RequestMapping("/notice")
@Api(tags = "公告管理接口")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @ApiOperation(value = "查询最新的3条公告",notes = "展示公告")
    @GetMapping("/selectNotices")
    public Result selectNotices(){
        List<Notice> noticeList = noticeService.list(new QueryWrapper<Notice>().orderByDesc("update_time").last("limit 3"));
        return new Result(noticeList);
    }

    @ApiOperation(value = "公告详情接口",notes = "查询公告详情")
    @GetMapping("/selectNoticeDetail")
    public Result selectNoticeDetail(Integer id){
        Notice notice = noticeService.selectNoticeDetail(id);
        return new Result(notice);
    }

    @RequiresAuthentication
    @ApiOperation(value = "公告接口",notes = "公告列表查询接口")
    @GetMapping("/selectALLNotice")
    public Result selectALLNotice(NoticeFilter noticeFilter){
        QueryWrapper<Notice> noticeQueryWrapper = new QueryWrapper<>();
        if (noticeFilter != null){
            if (!ObjectUtils.isEmpty(noticeFilter.getTitle())){
                noticeQueryWrapper.like("title",noticeFilter.getTitle());
            }
            if (!ObjectUtils.isEmpty(noticeFilter.getCreatorId())){
                noticeQueryWrapper.eq("creator_id",noticeFilter.getCreatorId());
            }
            if (!ObjectUtils.isEmpty(noticeFilter.getStartTime())){
                noticeQueryWrapper.gt("create_time",noticeFilter.getStartTime());
            }
            if (!ObjectUtils.isEmpty(noticeFilter.getEndTime())){
                noticeQueryWrapper.le("create_time",noticeFilter.getEndTime());
            }
        }
        List<Notice> noticeList = noticeService.list(noticeQueryWrapper);
        return new Result(noticeList);
    }

    @RequiresAuthentication
    @ApiOperation(value = "公告发布、修改接口",notes = "管理员发布、修改公告接口")
    @PostMapping("/post")
    public Result post(@Valid @RequestBody Notice notice){
        System.out.println(notice);
        try {
            boolean save = noticeService.saveOrUpdate(notice);
            if (save){
                List<Notice> noticeList = noticeService.list();
                return new Result(noticeList);
            }else {
                return new Result(ResultCodeMessage.FAIL);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }


    @ApiOperation(value = "禁用公告接口",notes = "暂时禁止展示某个公告")
    @RequiresAuthentication
    @GetMapping("/disableNotice")
    public Result disableArticleType(Integer id, Integer status){
        try {
            boolean update = noticeService.update(new UpdateWrapper<Notice>().set("status", status).eq("id", id));
            if (update){
                List<Notice> list = noticeService.list();
                return new Result(list);
            }else {
                return new Result(ResultCodeMessage.FAIL);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "删除公告接口",notes = "管理员单个公告接口")
    @RequiresAuthentication
    @GetMapping("/deleteNotice")
    public Result deleteNotice(Integer id){
        boolean b = noticeService.removeById(id);
        if (b){
            List<Notice> list = noticeService.list();
            return new Result(list);
        }else {
            return new Result(ResultCodeMessage.FAIL);
        }
    }

    @ApiOperation(value = "批量删除公告接口",notes = "管理员批量删除公告的接口")
    @RequiresAuthentication
    @PostMapping("/batchDelNotice")
    public Result batchDelNotice(@RequestBody JSONObject noticeList){
        JSONArray noticeList1 = noticeList.getJSONArray("noticeList");
        List<Notice> noticeList2 = noticeList1.toJavaList(Notice.class);
        try {
            boolean update = noticeService.removeBatchByIds(noticeList2);
            List<Notice> noticeList3 = noticeService.list();
            return new Result(noticeList3);
        }catch (Exception e){
            return new Result(e);
        }
    }
}
