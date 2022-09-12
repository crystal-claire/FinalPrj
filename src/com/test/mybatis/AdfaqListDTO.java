package com.test.mybatis;

public class AdfaqListDTO
{
	// [ad 목록] 번호, 제목, 작성자ID, 작성일 
	// [ad 본문] 제목, 내용
	
	public String num, code, title, content, write_datetime, writer, id;

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

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getWrite_datetime()
	{
		return write_datetime;
	}

	public void setWrite_datetime(String write_datetime)
	{
		this.write_datetime = write_datetime;
	}

	public String getWriter()
	{
		return writer;
	}

	public void setWriter(String writer)
	{
		this.writer = writer;
	}

	public String getNum()
	{
		return num;
	}

	public void setNum(String num)
	{
		this.num = num;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}
	
	
	
	
}
