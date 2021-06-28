<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7_1_Expression Language</title>
	<%--
		날짜 : 2021/06/28
		이름 : 김승용
		내용 : JSP 표현언어(EL) 실습
	--%>
</head>
<body>
	<h3>1. 표현언어(Expression Language)</h3>
	<%
		String name = "홍길동";
		int num1 = 1;
		int num2 = 2;
		
		// JSP 내장객체
		pageContext.setAttribute("name", name);
		request.setAttribute("num1", num1);
		session.setAttribute("num2", num2);
	%>
	
	<h4>표현식</h4>
	<p>
		name : <%= name %> <br>
		num1 : <%= num1 %> <br>
		num2 : <%= num2 %> <br>
		num1 + num2 : <%= num1 + num2 %>
	</p>
	
	<h4>표현 언어</h4>
	<p>
		name : ${name}  <br>
		num1 : ${num1}  <br>
		num2 : ${num2}  <br>
		num1 + num2 : ${num1 + num2}
	</p>
</body>
</html>