package com.test.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserCsCenterController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 공지 목록
	@RequestMapping(value="/user_cscenter_listNotice.lion")
	public String UserNoticeList(Model model) throws SQLException
	{
        String result = null;

        INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);

        model.addAttribute("list", dao.listUserNotice());

        result = "/WEB-INF/view/user/user_cscenter_noticeMain.jsp";

        return result;
	}
 
	 
	
	// 공지 상세페이지
	@RequestMapping(value="/user_cscenter_listNoticeArticle.lion")
	public String UserNoticeArticle(String code, Model model) 
	{
        String result = null;

        INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class); 
        ArrayList<NoticeDTO> dto = dao.listUserNoticeArticle(code); 
 

        model.addAttribute("article", dto);
        result = "/WEB-INF/view/user/user_cscenter_noticeArticle.jsp";

        return result;		
	}
	
	
	// 1:1 목록
	@RequestMapping(value="/user_cscenter_listIq.lion")
	public String UserIqList(Model model) throws SQLException
	{
		String result = null;
		IInquiryDAO dao = sqlSession.getMapper(IInquiryDAO.class);
		model.addAttribute("list", dao.listInquiryList());
		result = "/WEB-INF/view/user/user_cscenter_inquiryMain.jsp";
		
		return result;
	}
	
	// 1:1 상세페이지
	@RequestMapping(value="/user_cscenter_listIqArticle.lion")
	public String UserIqArticle(String inquiry_code, Model model)
	{
		String result = null;
		
		IInquiryDAO dao = sqlSession.getMapper(IInquiryDAO.class);

		ArrayList<InquiryDTO> dto = dao.listInquiryArticle(inquiry_code); 
		 

        model.addAttribute("article", dto);
        result = "/WEB-INF/view/user/user_cscenter_inquiryArticle.jsp";
		
		return result;
	}
	
	
	// 1:1 INSERT FORM
	@RequestMapping(value="/user_cscenter_insertIqArticle.lion")
	public String UserIqInsertArticle(Model model)
	{
		String result = null;
		
		IInquiryDAO dao = sqlSession.getMapper(IInquiryDAO.class);
		model.addAttribute("list", dao.insertInquiryArticleForm());
		result = "/WEB-INF/view/user/user_cscenter_inquiryInsertForm.jsp";
		  
		return result;
	}
	
	
	
	// 1:1 UPDATE FORM
	@RequestMapping(value="/user_cscenter_updateIqArticle.lion")
	public String UserIqUpdateArticle(String code, Model model)
	{
		String result = null;
		
		IInquiryDAO dao = sqlSession.getMapper(IInquiryDAO.class);

		ArrayList<InquiryDTO> dto = dao.updateInquiryArticleForm(code); 
		 
        model.addAttribute("article", dto);
        result = "/WEB-INF/view/user/user_cscenter_inquiryUpdateForm.jsp";
		
		return result;
	}
	
	
	// 1:1 INSERT
	@RequestMapping(value="/user_cscenter_insertIq.lion", method=RequestMethod.GET)
	public String UserIqInsert(String title, String content, String member_code)
	{
		String result = null;
		
		IInquiryDAO dao = sqlSession.getMapper(IInquiryDAO.class);
		
		dao.insertInquiryArticle(title, content, member_code);
		
		result = "redirect:user_cscenter_listIq.lion"; 
		
		return result;
	}
	
	// 1:1 UPDATE
	@RequestMapping(value="/user_cscenter_updateIq.lion", method=RequestMethod.GET)
	public String UserIqUpdate(String title, String content, String photo_path, String code)
	{
		String result = null;
		
		IInquiryDAO dao = sqlSession.getMapper(IInquiryDAO.class);
		
		dao.updateInquiryArticle(title, content, photo_path, code);
		
		result = "redirect:user_cscenter_listIq.lion"; 
		
		return result;
	}
	
	// 1:1 DELETE
	@RequestMapping(value="/user_cscenter_deleteIq.lion", method=RequestMethod.GET)
	public String UserIqDelete(String code)
	{
		String result = null;
		
		IInquiryDAO dao = sqlSession.getMapper(IInquiryDAO.class);
		
		dao.deleteInquiryArticle(code);
		
		result = "redirect:user_cscenter_listIq.lion";
		
		return result;
		
	}

	
	
	// faq 목록
	@RequestMapping(value="/user_cscenter_listfaq.lion")
	public String UserFaqList(Model model) throws SQLException
	{
		String result = null;
		
		IFaqDAO dao = sqlSession.getMapper(IFaqDAO.class);
		model.addAttribute("list", dao.listUserFaq());
		
		result = "/WEB-INF/view/user/user_cscenter_faqMain.jsp";
		
		return result;
	}
	
	
	
	
	
	 
	  
	  
	 

}
