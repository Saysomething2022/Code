package com.yinjie.bbs_java.controller.admin;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.yinjie.bbs_java.common.Result;
import com.yinjie.bbs_java.common.ResultCodeMessage;
import com.yinjie.bbs_java.entity.SystemLog;
import com.yinjie.bbs_java.entity.User;
import com.yinjie.bbs_java.service.SystemLogService;
import com.yinjie.bbs_java.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin")
@Api(tags = "管理员接口")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private SystemLogService systemLogService;

    @RequiresRoles("admin")
    @GetMapping("/login")
    public Result login(){
        System.out.println("查询管理员*******");
        return new Result(ResultCodeMessage.SUCCESS);
    }


    @ApiOperation(value = "查询所有用户接口",notes = "用于管理员查询所有用户信息")
    @RequiresRoles("admin")
    @GetMapping("/selectALLUser")
    public Result selectALLUser(){
        try {
            List<User> userList = userService.selectALLUser();
            return new Result(userList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "修改用户角色接口",notes = "用于管理员修改用户角色")
    @RequiresRoles("admin")
    @GetMapping("/updateRole")
    public Result updateRole(String id,Integer roleId){
        try {
            boolean update = userService.update(new UpdateWrapper<User>().set("role_id", roleId).eq("id", id));
            List<User> users = userService.selectALLUser();
            return new Result(users);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "删除用户接口",notes = "用于管理员删除某个用户")
    @RequiresRoles("admin")
    @GetMapping("/deleteUser")
    public Result deleteUser(String id){
        try {
            userService.removeById(id);
            List<User> users = userService.selectALLUser();
            return new Result(users);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "禁用用户接口",notes = "用于管理员禁用某个用户账号")
    @RequiresRoles("admin")
    @GetMapping("/disableUser")
    public Result disableUser(String id, Integer status){
        try {
            userService.update(new UpdateWrapper<User>().set("status",status).eq("id",id));
            List<User> users = userService.selectALLUser();
            return new Result(users);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "批量删除用户接口",notes = "管理员批量删除用户的接口")
    @RequiresAuthentication
    @PostMapping("/batchDelUser")
    public Result batchDelUser(@RequestBody JSONObject userList){
        JSONArray userList1 = userList.getJSONArray("userList");
        List<User> userList2 = userList1.toJavaList(User.class);
        try {
            boolean update = userService.removeBatchByIds(userList2);
            List<User> userList3 = userService.selectALLUser();
            return new Result(userList3);
        }catch (Exception e){
            return new Result(e);
        }
    }

    @ApiOperation(value = "系统日志接口",notes = "用于管理员查询系统运行状况")
    @RequiresRoles("admin")
    @GetMapping("/selectAllLog")
    public Result selectAllLog(){
        try {
            List<SystemLog> systemLogList = systemLogService.list();
            return new Result(systemLogList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "删除系统日志接口",notes = "用于管理员删除系统日志")
    @RequiresRoles("admin")
    @GetMapping("/deleteLog")
    public Result deleteLog(Integer id){
        try {
            systemLogService.removeById(id);
            List<SystemLog> systemLogList = systemLogService.list();
            return new Result(systemLogList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "批量删除日志接口",notes = "管理员批量删除日志的接口")
    @RequiresAuthentication
    @PostMapping("/batchDelLog")
    public Result batchDelLog(@RequestBody JSONObject systemList){
        JSONArray systemList1= systemList.getJSONArray("systemList");
        List<SystemLog> systemLogList2 = systemList1.toJavaList(SystemLog.class);
        try {
            systemLogService.removeBatchByIds(systemLogList2);
            List<SystemLog> systemLogList3 = systemLogService.list();
            return new Result(systemLogList3);
        }catch (Exception e){
            return new Result(e);
        }
    }


}
