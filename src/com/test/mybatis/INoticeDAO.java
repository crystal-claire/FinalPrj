package com.test.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface INoticeDAO
{
    // 공지사항 목록조회
    public ArrayList<NoticeDTO> listUserNotice() throws SQLException;  

    // 공지사항 게시물조회
    public ArrayList<NoticeDTO> listUserNoticeArticle(String code);
    
    // 공지사항 
    
    // 공지사항 
    
}
