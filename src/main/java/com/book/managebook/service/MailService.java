package com.book.managebook.service;

public interface MailService {
    void sendSimpleMail(String to, String subject, String content);
    void processReturnReminder();
    void processResReminder();
}
