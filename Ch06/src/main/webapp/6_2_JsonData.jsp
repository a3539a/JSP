<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//DB 정보
	String host = "jdbc:mysql://13.125.215.69:3306/a3539a";
	String user = "a3539a";
	String pass = "1234";
	
	List<MemberBean> members = new ArrayList<>();

	try{
		// 1 단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2 단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3 단계
		Statement stmt = conn.createStatement();
		
		// 4 단계
		String sql = "SELECT * FROM `MEMBER` ORDER BY `rdate`;";
		ResultSet rs = stmt.executeQuery(sql);
		
		// 5 단계
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
		// 6 단계
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// List를 Json 데이터로 가공처리
	Gson gson = new Gson();
	String json = gson.toJson(members);
	
	// JSON 출력
	out.print(json);
	
%>