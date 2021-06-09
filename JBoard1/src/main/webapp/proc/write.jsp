<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	String regip   = request.getRemoteAddr();
	
	// 세션 사용자 정보 가져오기
	MemberBean mb = (MemberBean)session.getAttribute("sessMember");
	String uid = mb.getUid();
	
	try{
		// 1,2단계
		Connection conn = DBConfig.getInstance().getConnection();
		
		// 3단계
		String sql  = "INSERT INTO `JBOARD_ARTICLE` SET ";
			   sql += "`title`=?,";
			   sql += "`content`=?,";
			   sql += "`uid`=?,";
			   sql += "`regip`=?,";
			   sql += "`rdate`=NOW();";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setString(3, uid);
		psmt.setString(4, regip);
		
		// 4단계
		psmt.executeUpdate();
		
		// 5단계
		// 6단계
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	response.sendRedirect("/JBoard1/list.jsp");
%>