package com.neuedu.mapper;

import com.neuedu.entity.User;

public interface UserMapper {

    User getUserByUsername(String username);

    int saveUser(User user);
}
