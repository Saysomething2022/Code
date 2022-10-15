package com.yinjie.bbs_java.service;

import com.yinjie.bbs_java.dto.UserDto;
import com.yinjie.bbs_java.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jack
 * @since 2022-03-07 10:31:02
 */
public interface UserService extends IService<User> {
        User selectUserByEmail(String email);

        List<UserDto> SelectMyFocus(String uid);

        List<UserDto> SelectMyFocused(String uid);

        List<User> selectALLUser();
}
