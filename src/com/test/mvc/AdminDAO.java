package com.test.mvc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Scanner;

import com.test.mybatis.AdNoticeListDTO;
import com.test.util.DBConn;

public class AdminDAO implements IAdminDAO
{
	private Connection conn;

	@Override
	public int insertNoticeArticle(AdNoticeListDTO dto)
	{
		int result = 0;

		try
		{
			conn = DBConn.getConnection();

			String sql = "{CALL PRC_NOTICE_INSERT(?, ?, ?, ?, ?)}";

			CallableStatement cstmt = conn.prepareCall(sql);

			cstmt.setString(1, dto.getTitle());
			cstmt.setString(2, dto.getContent());
			cstmt.setString(3, dto.getAdmin_code());
			cstmt.setString(4, dto.getPath());
			cstmt.setString(5, dto.getName());

			result = cstmt.executeUpdate();

			cstmt.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		} finally
		{
			try
			{
				DBConn.close();
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}

		return result;
	}

	@Override
	public int modifyNoticeArticle(AdNoticeListDTO dto)
	{
		int result = 0;

		try
		{
			conn = DBConn.getConnection();

			String sql = "{CALL PRC_NOTICE_UPDATE(?, ?, ?, ?, ?, ?, ?)}";

			CallableStatement cstmt = conn.prepareCall(sql);

			cstmt.setString(1, dto.getCode());
			cstmt.setString(2, dto.getPhoto_code());
			cstmt.setString(3, dto.getUpdate_datetime());
			cstmt.setString(4, dto.getTitle());
			cstmt.setString(5, dto.getContent());
			cstmt.setString(6, dto.getAdmin_code());
			cstmt.setString(7, dto.getPath());

			result = cstmt.executeUpdate();

			cstmt.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		} finally
		{
			try
			{
				DBConn.close();
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}

		return result;
	}

	public static void main(String[] args)
	{
		try
		{
			
			Connection conn = DBConn.getConnection(); 

			if (conn != null)
			{
				System.out.println("데이터베이스 연결 성공~!!!");

				try
				{
					String sql = "{CALL PRC_NOTICE_UPDATE(?, ?, ?, ?, ?, ?, ?)}";
					
					CallableStatement cstmt = conn.prepareCall(sql);

					
					cstmt.setString(1, "공지사항코드");
					cstmt.setString(2, "공지사항사진코드");
					cstmt.setString(3, "공지사항update시간");
					cstmt.setString(4, "공지제목");
					cstmt.setString(5, "공지내용");
					cstmt.setString(6, "공지관리자코드");
					cstmt.setString(7, "공지사진경로");

					int result = cstmt.executeUpdate();

					if (result > 0)
						System.out.println("프로시저 호출 및 데이터 입력 완료~!!!");

				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
			}

			

			DBConn.close();

			System.out.println("\n데이터베이스 연결 종료~!!!");
			System.out.println("프로그램 종료됨~!!!");

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}

}

/*
 * ====================================================== Test001.java -
 * CallableStatement 를 활용한 SQL 구문 전송 실습
 * =======================================================
 */
