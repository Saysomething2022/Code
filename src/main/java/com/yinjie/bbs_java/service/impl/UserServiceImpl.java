package com.yinjie.bbs_java.service.impl;

import com.yinjie.bbs_java.dto.UserDto;
import com.yinjie.bbs_java.entity.User;
import com.yinjie.bbs_java.mapper.UserMapper;
import com.yinjie.bbs_java.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User selectUserByEmail(String email) {
        return userMapper.selectUserByEmail(email);
    }

    @Override
    public List<UserDto> SelectMyFocus(String uid) {
        return userMapper.SelectMyFocus(uid);
    }

    @Override
    public List<UserDto> SelectMyFocused(String uid) {
        return userMapper.SelectMyFocused(uid);
    }

    @Override
    public List<User> selectALLUser() {
        return userMapper.selectALLUser();
    }
}
