package com.book.managebook.dao;


import com.book.managebook.pojo.MailDetail;

import java.util.List;

public interface MailMapper {
    // 还书提醒
    List<MailDetail> returnReminder();

    List<MailDetail> resReminder();
}
