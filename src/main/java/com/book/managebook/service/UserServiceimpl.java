package com.book.managebook.service;

import com.book.managebook.dao.UserMapper;
import com.book.managebook.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceimpl implements UserService {
    @Autowired(required = false)
    UserMapper userMapper;

    @Override
    public User checkUser(User user) {
        return userMapper.checkUser(user);
    }

    @Override
    public User checkManager(User user) {
        return userMapper.checkManager(user);
    }

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }
}
