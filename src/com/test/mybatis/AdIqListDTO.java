package com.test.mybatis;

public class AdIqListDTO
{
	 
	    
	// [ad 목록] 번호, 제목, 작성자ID, 작성일, 답변상태, 답변일, 담당자
	// [ad 본문] 작성자, 제목, 내용, 답변 
	
	public String num, code, title, writer_id, write_datetime, state, answer_datetime, answerer
				, inquiry, answer, inquiry_path, answer_path, photo_path, content, inquiry_code, admin_code, inquiry_answer_code;

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getWriter_id()
	{
		return writer_id;
	}

	public void setWriter_id(String writer_id)
	{
		this.writer_id = writer_id;
	}

	public String getWrite_datetime()
	{
		return write_datetime;
	}

	public void setWrite_datetime(String write_datetime)
	{
		this.write_datetime = write_datetime;
	}

	public String getState()
	{
		return state;
	}

	public void setState(String state)
	{
		this.state = state;
	}

	public String getAnswer_datetime()
	{
		return answer_datetime;
	}

	public void setAnswer_datetime(String answer_datetime)
	{
		this.answer_datetime = answer_datetime;
	}

	public String getAnswerer()
	{
		return answerer;
	}

	public void setAnswerer(String answerer)
	{
		this.answerer = answerer;
	}

	public String getInquiry()
	{
		return inquiry;
	}

	public void setInquiry(String inquiry)
	{
		this.inquiry = inquiry;
	}

	public String getAnswer()
	{
		return answer;
	}

	public void setAnswer(String answer)
	{
		this.answer = answer;
	}

	public String getInquiry_path()
	{
		return inquiry_path;
	}

	public void setInquiry_path(String inquiry_path)
	{
		this.inquiry_path = inquiry_path;
	}

	public String getAnswer_path()
	{
		return answer_path;
	}

	public void setAnswer_path(String answer_path)
	{
		this.answer_path = answer_path;
	}

	public String getNum()
	{
		return num;
	}

	public void setNum(String num)
	{
		this.num = num;
	}

	public String getPhoto_path()
	{
		return photo_path;
	}

	public void setPhoto_path(String photo_path)
	{
		this.photo_path = photo_path;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getInquiry_code()
	{
		return inquiry_code;
	}

	public void setInquiry_code(String inquiry_code)
	{
		this.inquiry_code = inquiry_code;
	}

	public String getAdmin_code()
	{
		return admin_code;
	}

	public void setAdmin_code(String admin_code)
	{
		this.admin_code = admin_code;
	}

	public String getInquiry_answer_code()
	{
		return inquiry_answer_code;
	}

	public void setInquiry_answer_code(String inquiry_answer_code)
	{
		this.inquiry_answer_code = inquiry_answer_code;
	}
 
	
	
	
	
} 