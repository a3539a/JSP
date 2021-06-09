<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");

	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	// DB 정보
	String host = "jdbc:mysql://13.125.215.69:3306/a3539a";
	String user = "a3539a";
	String pw = "1234";
	
	MemberBean mb = null;
	
	try{
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계
		Connection conn = DriverManager.getConnection(host, user, pw);
		
		//3단계
		Statement stmt = conn.createStatement();
		
		//4단계
		String sql = "SELECT * FROM `JBOARD_MEMBER` WHERE `uid`='"+uid+"' AND `pass`=PASSWORD('"+pass+"');";
		ResultSet rs = stmt.executeQuery(sql);
		
		//5단계
		if(rs.next()){
			// 회원일 경우
			mb = new MemberBean();
			mb.setUid(rs.getString(1));
			mb.setPass(rs.getString(2));
			mb.setName(rs.getString(3));
			mb.setNick(rs.getString(4));
			mb.setEmail(rs.getString(5));
			mb.setHp(rs.getString(6));
			mb.setGrade(rs.getInt(7));
			mb.setZip(rs.getString(8));
			mb.setAddr1(rs.getString(9));
			mb.setAddr2(rs.getString(10));
			mb.setRegip(rs.getString(11));
			mb.setRdate(rs.getString(12));
		}
		
		//6단계
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 세션처리
	if(mb != null){
		// 회원일 경우
		session.setAttribute("sessMember", mb);
		
		response.sendRedirect("/JBoard1/list.jsp");
		
	}else{
		// 회원이 아닐 경우
		response.sendRedirect("/JBoard1/user/login.jsp?success=100");
	}
	
	
%>