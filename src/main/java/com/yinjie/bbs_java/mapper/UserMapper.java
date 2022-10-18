package com.yinjie.bbs_java.mapper;

import com.yinjie.bbs_java.dto.UserDto;
import com.yinjie.bbs_java.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

        User selectUserByEmail(String email);

        List<UserDto> SelectMyFocus(String uid);

        List<UserDto> SelectMyFocused(String uid);

        List<User> selectALLUser();
}
