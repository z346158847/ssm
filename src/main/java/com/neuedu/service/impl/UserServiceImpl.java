package com.neuedu.service.impl;

import com.neuedu.entity.User;
import com.neuedu.mapper.UserMapper;
import com.neuedu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserByUsername(String username) {

        return userMapper.getUserByUsername(username);
    }

    @Override
    public int saveUser(User user) {

        return userMapper.saveUser(user);
    }
}
