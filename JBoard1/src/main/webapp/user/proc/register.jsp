<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신	
	request.setCharacterEncoding("utf-8");
	
	String uid 	 = request.getParameter("uid");
	String pass1  = request.getParameter("pass1");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp 	 = request.getParameter("hp");
	String zip 	 = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();

	//DB 정보
	String host = "jdbc:mysql://13.125.215.69:3306/a3539a";
	String user = "a3539a";
	String pass = "1234";

	try{
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_MEMBER);
		psmt.setString(1, uid);
		psmt.setString(2, pass1);
		psmt.setString(3, name);
		psmt.setString(4, nick);
		psmt.setString(5, email);
		psmt.setString(6, hp);
		psmt.setString(7, zip);
		psmt.setString(8, addr1);
		psmt.setString(9, addr2);
		psmt.setString(10, regip);

		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		// 5단계
		// 6단계
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 로그인 페이지로 리다이렉트
	response.sendRedirect("/JBoard1/user/login.jsp");

%>