<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/*
		날짜 : 2021/06/03
		이름 : 김승용
		내용 : JSON 실습하기
	*/
	
	String json = "{\"uid\":\"a101\", \"name\" : \"홍길동\", \"hp\" : \"010-0011-3214\", \"age\" : 25}";
	out.print(json);

%>