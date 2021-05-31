package com.book.managebook.service;

import com.book.managebook.pojo.User;

public interface UserService {
    User checkUser(User user);

    User checkManager(User user);
}
