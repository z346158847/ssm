package com.neuedu.service;

import com.neuedu.entity.User;

public interface UserService {

    User getUserByUsername(String username);

    int saveUser(User user);

}
