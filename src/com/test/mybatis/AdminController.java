package com.test.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.util.Search;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 회원 > 전체회원 (목록, 페이징, 검색)
	@RequestMapping(value = "/admin_member_all.lion", method = RequestMethod.GET)
	public String listMember(Model model, @RequestParam(required = false, defaultValue = "1") int page
						   				, @RequestParam(required = false, defaultValue = "1") int range
										, @RequestParam(required = false, defaultValue = "") String searchType
										, @RequestParam(required = false, defaultValue = "") String keyword) throws Exception
	{
		String result  = null;
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		// 전체 게시글 개수
		int listCnt = dao.listAllMemberCount(search);
		
		search.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", search);
		model.addAttribute("list", dao.listAllMember(search));
		
		result = "/WEB-INF/view/admin/admin_member_all.jsp";
		
		return result;
	}
	
	//영구정지회원목록
	@RequestMapping(value="/admin_member_permanentBan.lion")
    public String banMember(Model model)
    {
        String result=null;
        
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
        
        model.addAttribute("list", dao.listBanMember());
        
        result = "/WEB-INF/view/admin/admin_member_permanentBan.jsp";

        return result;
    }
	
	//휴면회원목록
	@RequestMapping(value="/admin_member_sleep.lion")
    public String sleepMember(Model model)
    {
        String result=null;
        
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
        
        model.addAttribute("list", dao.listSleepMember());
        
        result = "/WEB-INF/view/admin/admin_member_sleep.jsp";

        return result;
    }
	
	
	//탈퇴회원목록
	@RequestMapping(value="/admin_member_withdrawal.lion")
    public String withdrawalMember(Model model)
    {
        String result=null;
        
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
        
        model.addAttribute("list", dao.listWithdrawalMember());
        
        result = "/WEB-INF/view/admin/admin_member_withdrawal.jsp";

        return result;
    }
	
	//포인트충전
	@RequestMapping(value="/admin_point_charge.lion")
    public String pointCharge(Model model)
    {
        String result=null;
        
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
        
        model.addAttribute("list", dao.listPointCharge());
        
        
        result = "/WEB-INF/view/admin/admin_point_charge.jsp";

        return result;
    }
	
	//포인트결제
	@RequestMapping(value="/admin_point_payment.lion")
    public String pointPayment(Model model)
    {
        String result=null;
        
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
        
        model.addAttribute("list", dao.listPointPayment());
        
        result = "/WEB-INF/view/admin/admin_point_payment.jsp";

        return result;
    }
	
	//포인트환불
	@RequestMapping(value="/admin_point_refund.lion")
    public String PointRefund(Model model)
    {
        String result=null;
        
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
        
		model.addAttribute("list", dao.listPointRefund()); 
        
        result = "/WEB-INF/view/admin/admin_point_refund.jsp";

        return result;
    }
	
	//포인트인출
	@RequestMapping(value="/admin_point_withdrawal.lion")
    public String PointWithdrawal(Model model)
    {
        String result=null;
        
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
        
		model.addAttribute("list", dao.listPointWithdrawal());  
        
        result = "/WEB-INF/view/admin/admin_point_withdrawal.jsp";

        return result;
    }
	
	//완료포인트지급
	@RequestMapping(value="/admin_point_complete.lion")
    public String PointComplete(Model model)
    {
        String result=null;
        
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
        
		model.addAttribute("list", dao.listPointComplete());  
        
        result = "/WEB-INF/view/admin/admin_point_complete.jsp";

        return result;
    }
	
	// 카테고리
	@RequestMapping(value="/admin_homepage_categoryList.lion")
    public String listCategory(Model model)
    {
        String result=null;
        
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
        
		model.addAttribute("list", dao.listCategory());  
		model.addAttribute("sub", dao.listSubCategory());  
        
        result = "/WEB-INF/view/admin/admin_homepage_categoryList.jsp";

        return result;
    }
	
	// 공지사항 메인
    @RequestMapping(value = "/ad_notice_list.lion")
    public String noticeList(Model model) throws SQLException
    {
        String result = null;

        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

        model.addAttribute("list", dao.listNotice());

        result = "/WEB-INF/view/admin/admin_homepage_noticeList.jsp";

        return result;
    }



    //공지글조회
    @RequestMapping(value= "/ad_notice_article.lion")
    public String noticeArticle(String code, Model model) 
    {
        String result = null;

        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class); 
        ArrayList<AdNoticeListDTO> dto = dao.listNoticeArticle(code); 
 

        model.addAttribute("article", dto);
        result = "/WEB-INF/view/admin/admin_homepage_noticeArticle.jsp";

        return result;
    }

    // 공지글 INSERT FORM
    @RequestMapping(value="/ad_notice_insertForm.lion")
    public String noticeInsertForm()
    {
        String result=null;

        result = "/WEB-INF/view/admin/admin_homepage_noticeInsertForm.jsp";

        return result;
    }



    //공지글 UPDATE FORM
    @RequestMapping(value="/ad_notice_updateForm.lion", method=RequestMethod.GET)
    public String noticeUpdateForm(String code, Model model)
    {
        String result = null;

        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class); 
        ArrayList<AdNoticeListDTO> dto = dao.updateNoticeArticleForm(code); 
 

        model.addAttribute("article", dto);

        result = "/WEB-INF/view/admin/admin_homepage_noticeUpdateForm.jsp";

        return result;
    }
    
    
    // 공지글 INSERT
	 @RequestMapping(value="/ad_notice_insert.lion",  method = RequestMethod.GET)
	 public String insertNotice(String title, String content, String admin_code, String photo_path)
	 {
	  	// 이 안에서 insert 진행하기
		String result = null; 
		
	  	IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);  
 
	  	dao.insertNoticeArticle(title, content, admin_code, photo_path);
 
	  	result = "redirect:ad_notice_list.lion";

        return result;
	 }
	 
 
    
    // 공지글 UPDATE
    @RequestMapping(value="/ad_notice_update.lion",  method = RequestMethod.GET)
    public String updateNotice(String title, String content, String photo_path, String code)
    {
    	// update 수행
    	String result = null;
    	
    	IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
    	dao.updateNoticeArticle(title, content, photo_path, code);
    	
    	result = "redirect:ad_notice_article.lion?code=" + code;
    	//result = "/WEB-INF/view/admin/admin_homepage_noticeList.jsp";
    	
    	return result;
    } 
     
    // 공지글 DELETE
    @RequestMapping(value="/ad_notice_delete.lion", method = RequestMethod.GET)
    public String deleteNotice(String code)
    {
    	// delete 수행
    	String result = null;
    	
    	IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
    	
    	dao.deleteNoticeArticle(code);
    	
    	result = "redirect:ad_notice_list.lion"; 
    	
    	return result;
    	
    }
  
    
    
    
    
    
	
    
    // 신고접수내역
    @RequestMapping(value = "/admin_report_receptionList.lion")
    public String reportReceptionList(Model model) 
    {
        String result = null;

        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

        model.addAttribute("list", dao.listReportReception());

        result = "/WEB-INF/view/admin/admin_report_receptionList.jsp";

        return result;
    }
    
    //신고접수내역 상세
    @RequestMapping(value = "/admin_report_receptionDetail.lion", method = RequestMethod.POST)
    public String reportReceptionDetail(String code, Model model) 
    {
        String result = null;

        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
        ArrayList<ReportDTO> dto = dao.listReportReceptionDetail(code);
        
        model.addAttribute("list", dto);
        
        //model.addAttribute("list", dao.listReportReceptionDetail(code));
        
        result = "/WEB-INF/view/admin/admin_report_receptionDetail.jsp";
        
        
        return result;
        
        
    }
    
    
    
    
    //
    
    
    // 1:1 문의 목록조회
    @RequestMapping(value = "/ad_inquiry_list.lion")
    public String inquieryList(Model model) throws SQLException
    {
        String result = null;

        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

        model.addAttribute("list", dao.listInquiry());

        result = "/WEB-INF/view/admin/admin_inquiry_inquiryList.jsp";

        return result;
    }

    // 1:1 문의 게시물조회
    @RequestMapping(value = "/ad_inquiry_article.lion")
    public String inquieryArticle(String inquiry_code, Model model) 
    {
        String result = null;

        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class); 
        ArrayList<AdIqListDTO> dto = dao.listInquiryArticle(inquiry_code); 


        model.addAttribute("article", dto);

        result = "/WEB-INF/view/admin/admin_inquiry_inquiryAnswerArticle.jsp";

        return result;
    }
    
    
    //  1:1 문의 UPDATE FORM 
    @RequestMapping(value="/ad_inquiry_articleUpdate.lion")
    public String inquiryArticleUpdateForm(String inquiry_code, Model model)
    {
    	String result = null;
    	
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class); 
        ArrayList<AdIqListDTO> dto = dao.updateInquiryArticleForm(inquiry_code); 


        model.addAttribute("article", dto);

        result = "/WEB-INF/view/admin/admin_inquiry_inquiryAnswerUpdateForm.jsp";
    	
    	
    	return result;
    }
    
    
    // 1:1 문의 INSERT FORM
    @RequestMapping(value="/ad_inquiry_articleInsert.lion")
    public String inquiryArticleInsertForm(String inquiry_code, Model model)
    {
    	String result = null;
    	
    	
        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class); 
        ArrayList<AdIqListDTO> dto = dao.insertInquiryArticleForm(inquiry_code); 


        model.addAttribute("article", dto);

        result = "/WEB-INF/view/admin/admin_inquiry_inquiryAnswerInsertForm.jsp";    	
    	
    	return result;
    	
    }
    
    
    // 1:1 문의 INSERT
    @RequestMapping(value="/ad_inquiry_insert.lion", method = RequestMethod.GET)
    public String insertInquiry(String content, String inquiry_code, String admin_code)
    {
    	String result = null;
    	
    	IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
    	
    	dao.insertInquiryArticle(content, inquiry_code, admin_code);
    	
    	result = "redirect:ad_inquiry_article.lion?inquiry_code="+inquiry_code;
    	
    	return result;
    }
    
    // 1:1 문의 UPDATE 
    @RequestMapping(value="/ad_inquiry_update.lion",  method = RequestMethod.GET)
    public String updateInquiry(String content, String inquiry_code)
    {
    	// update 수행
    	String result = null;
    	
    	IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
    	
    	dao.updateInquiryArticle(content, inquiry_code);
    	
    	result =  "redirect:ad_inquiry_article.lion?inquiry_code="+inquiry_code;
    	
    	return result;
    }
    
    // 1:1 문의 DELETE
    @RequestMapping(value="/ad_inquiry_delete.lion", method=RequestMethod.GET)
    public String deleteInquiry(String inquiry_code)
    {
    	String result = null;
    	
    	IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
    	
    	dao.deleteInquiryArticle(inquiry_code);
    	
    	result = "redirect:ad_inquiry_list.lion";
    			
    	return result;
    }
    
    
 
    
    // faq 목록 조회
    @RequestMapping(value = "/ad_faq_list.lion")
    public String faqList(Model model)  throws SQLException
    {
        String result = null;

        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

        model.addAttribute("list", dao.listfaq());

        result = "/WEB-INF/view/admin/admin_inquiry_faqList.jsp";

        return result;
    }

    // faq 게시물조회
    @RequestMapping(value = "/ad_faq_article.lion")
    public String faqArticle(String code, Model model) 
    {
        String result = null;

        IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class); 
        ArrayList<AdfaqListDTO> dto = dao.listfaqArticleForm(code); 


        model.addAttribute("article", dto);

        result = "/WEB-INF/view/admin/admin_inquiry_faqArticle.jsp";

        return result;
    }

    
    // faq UPDATE FORM
    @RequestMapping(value="/ad_faq_updateArticle.lion")
    public String faqArticleUpdate(String code, Model model)
    {
    	String result = null;
    	
    	IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
    	ArrayList<AdfaqListDTO> dto = dao.updateFaqArticleForm(code);
    	
    	model.addAttribute("article", dto);
    	
        result = "/WEB-INF/view/admin/admin_inquiry_faqUpdateForm.jsp";
    	
    	return result; 
    }
    
    // faq CREATE FORM
    @RequestMapping(value="/ad_faq_createArticle.lion")
    public String faqArticleCreate(String code, Model model)
    {
    	String result = null;
    	
        result = "/WEB-INF/view/admin/admin_inquiry_faqInsertForm.jsp";
 
    	return result;
    }

    
    // faq INSERT
    @RequestMapping(value="/ad_faq_insert.lion", method = RequestMethod.GET)
    public String faqInsert(String title, String content, String admin_code)
    {
    	String result = null;
    	
    	IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
    	
    	dao.insertFaqArticle(title, content, admin_code);
    	
    	result = "redirect:ad_faq_list.lion";
    	
    	return result;
    }
    
    
    // faq UPDATE
    @RequestMapping(value="/ad_faq_update.lion",  method = RequestMethod.GET)
    public String faqUpdate(String title, String content, String code)
    {
    	// update 수행
    	String result = null;
    	
    	IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
    	dao.updateFaqArticle(title, content, code);
    	
    	result = "redirect:ad_faq_article.lion?code="+code;
    	
    	return result;
    }
    
    
    
    // faq DELETE
    @RequestMapping(value="/ad_faq_delete.lion", method = RequestMethod.GET)
    public String faqDelete(String code)
    {
    	String result = null;
    	
    	IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
    	
    	dao.deleteFaqArticle(code);
    	
    	result = "redirect:ad_faq_list.lion";
    	
    	return result;
    }
    
    
    
    
    
    // 관리자 메인
    @RequestMapping(value="/ad_main.lion")
    public String adMain(Model model)
    {
    	String result = null;
    			
		//IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//ArrayList<AdminDTO> list = dao.listNotice();
    	
    	
		//model.addAttribute("list", list);
		
    	result = "/WEB-INF/view/admin/admin_main.jsp";
    			
    	return result;
    }
    
	// 헤더 페이지
	/*
	 * @RequestMapping(value="/ad_header.lion") public String header(Model model) {
	 * String result = null; result = "/WEB-INF/view/user/admin_header.jsp"; return
	 * result; }
	 */
    
    
    //
    
}
