package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IInquiryDAO
{
    // 1:1 문의 목록조회
    public ArrayList<InquiryDTO> listInquiryList();

    // 1:1 문의 게시물조회
    public ArrayList<InquiryDTO> listInquiryArticle(@Param("inquiry_code") String inquiry_code);
    
    // 1:1 문의 게시물 Insert
    public ArrayList<InquiryDTO> insertInquiryArticleForm();
  
    // 1:1 문의 게시물 Update
    public ArrayList<InquiryDTO> updateInquiryArticleForm(@Param("inquiry_code") String inquiry_code);
    
    
    // 1:1 문의 게시물 INSERT
    public int insertInquiryArticle(@Param("title") String title, @Param("content") String content, @Param("member_code")  String member_code);
    
    // 1:1 문의 게시물 UPDATE 
    public int updateInquiryArticle(@Param("title") String title, @Param("content") String content, @Param("photo_path") String photo_path, @Param("code") String code);
    
    // 1:1 문의 게시물 DELETE 
    public int deleteInquiryArticle(@Param("code") String code);
    
}
