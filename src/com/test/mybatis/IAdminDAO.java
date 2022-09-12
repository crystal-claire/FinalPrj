package com.test.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.test.util.Search;

public interface IAdminDAO
{
	// 로그인
	//public String loginAdmin(String id, String pw);
	public String loginAdmin(AdminDTO admin);
	
	// 검색 조회
	public AdminDTO search(String member_code);
	
	//전체회원목록 페이징처리
	public int listAllMemberCount(Search search) throws Exception;
	
	// 전체회원출력(조회)
	public ArrayList<MemberDTO> listAllMember(Search search) throws Exception;
	
	//영구정지회원출력(조회)
    public ArrayList<MemberDTO> listBanMember();

    //휴면회원출력(조회)
    public ArrayList<MemberDTO> listSleepMember();

    //탈퇴회원출력(조회)
    public ArrayList<MemberDTO> listWithdrawalMember();

    //포인트충전(조회)
    public ArrayList<PointDTO> listPointCharge();

    //포인트결제(조회)
    public ArrayList<PointDTO> listPointPayment();

    //포인트환불(조회)
    public ArrayList<PointDTO> listPointRefund();

    //포인트인출(조회)
    public ArrayList<PointDTO> listPointWithdrawal();
    
    //완료포인트지급(조회)
    public ArrayList<PointDTO> listPointComplete();
	
    // 공지글 목록
    public ArrayList<AdNoticeListDTO> listNotice() throws SQLException;

    // 공지사항 게시물조회 
    public ArrayList<AdNoticeListDTO> listNoticeArticle(@Param("code") String code);

    // 공지사항 UPDATE FORM
    public ArrayList<AdNoticeListDTO> updateNoticeArticleForm(@Param("code") String code);
    
    // 공지사항 게시물 INSERT
    public int insertNoticeArticle(@Param("title") String title, @Param("content") String content, @Param("admin_code") String admin_code, @Param("photo_path") String photo_path);
    
    // 공지사항 게시물 UPDATE
    public int updateNoticeArticle(@Param("title") String title ,@Param("content") String content ,@Param("photo_path") String photo_path ,@Param("code") String code);
    
    // 공지사항 게시물 DELETE 
    public int deleteNoticeArticle(@Param("code") String code);
    
    
    
    
    
    // 메인카테고리 목록
    public ArrayList<MainCateDTO> listCategory();
	
    // 서브카테고리 목록
    public ArrayList<SubCateDTO> listSubCategory();
    
    // 신고접수내역
    public ArrayList<ReportDTO> listReportReception();
    
    // 신고접수내역 상세
    public ArrayList<ReportDTO> listReportReceptionDetail(String code);
    
    
    
    
    // 1:1 문의 목록조회
    public ArrayList<AdIqListDTO> listInquiry() throws SQLException;

    // 1:1 문의 게시물조회
    public ArrayList<AdIqListDTO> listInquiryArticle(String inquiry_code);
    
    // 1:1 문의 UPDATE FORM 
    public ArrayList<AdIqListDTO> updateInquiryArticleForm(String inquiry_code);
    
    // 1:1 문의 INSERT FORM
    public ArrayList<AdIqListDTO> insertInquiryArticleForm(String inquiry_code);
    
    // 1:1 문의 INSERT 
    public int insertInquiryArticle(@Param("content") String content, @Param("inquiry_code") String inquiry_code, @Param("admin_code") String admin_code);
    
    // 1:1 문의 UPDATE
    public int updateInquiryArticle(@Param("content") String content, @Param("inquiry_code") String inquiry_code);
    
    // 1:1 문의 DELETE
    public int deleteInquiryArticle(@Param("inquiry_code") String inquiry_code);
    
    
    
    
    
    // FAQ 목록 조회
    public ArrayList<AdfaqListDTO> listfaq() throws SQLException;
    
    // FAQ 게시물조회
    public ArrayList<AdfaqListDTO> listfaqArticleForm(String code);
    
    // FAQ UPDATE FORM 
    public ArrayList<AdfaqListDTO> updateFaqArticleForm(String code);
   
    // FAQ INSERT FORM
    //public ArrayList<AdfaqListDTO> createFaqArticle(); 
    
    
    // FAQ INSERT
    public int insertFaqArticle(@Param("title") String title, @Param("content") String content, @Param("admin_code") String admin_code);
    
    // FAQ UPDATE 
    public int updateFaqArticle(@Param("title") String title, @Param("content") String content, @Param("code") String code);
    
    // FAQ DELETE 
    public int deleteFaqArticle(@Param("code") String code);
    
    
    
    
    
    
    
    
}
