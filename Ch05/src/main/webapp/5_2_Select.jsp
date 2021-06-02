<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//DB 정보
	String host = "jdbc:mysql://54.180.160.240:3306/a3539a";
	String user = "a3539a";
	String pass = "1234";
	
	List<MemberBean> members = new ArrayList<>();
	
	try{
	// 1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	// 2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계 - SQL 객체 생성
	Statement stmt = conn.createStatement();
	
	// 4단계 - SQL 실행
	String sql = "SELECT * FROM `MEMBER` ORDER BY 'rdate'";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계 - 결과셋 처리
	while(rs.next()){
		MemberBean mb = new MemberBean();
		
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		
		members.add(mb);
	}
	
	// 6단계 - SQL 종료
	conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5_2_Select</title>
	<%--
		날짜 : 2021/06/02
		이름 : 김승용
		내용 : JDBC 프로그래밍 실습하기
	--%>
</head>
<body>
	<h3>2.select 실습하기</h3>
	
	<a href="./5_1_Insert.jsp">직원등록</a>
	
	<h4>직원목록</h4>
	<table border= "1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>기타</th>
		</tr>
		
		<% for(MemberBean mb : members){ %>
		<tr>
			<td><%= mb.getUid() %></td>
			<td><%= mb.getName() %></td>
			<td><%= mb.getHp() %></td>
			<td><%= mb.getPos() %></td>
			<td><%= mb.getDep() %></td>
			<td><%= mb.getRdate().substring(2, 10) %></td>
			<td>
				<a href="./5_3_Update.jsp?uid=<%= mb.getUid() %>">수정</a>
				<a href="./5_4_Delete.jsp?uid=<%= mb.getUid() %>">삭제</a>
			</td>
		</tr>
		<% } %>
		
	</table>
	
</body>
</html>