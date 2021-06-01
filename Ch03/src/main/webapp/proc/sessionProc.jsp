<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sessionProc</title>
	<%--
		��¥ : 2021/
		�̸� : ��¿�
		���� : 
	--%>
</head>
<body>
	<h3>사용자 세션 처리</h3>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
	
		session.setAttribute("uid", uid);
		session.setAttribute("name", name);
	%>
	
	<h4>사용자 정보 세션 저장 완료</h4>
	<a href="./sessionConfirm.jsp">사용자 세션값 확인</a>
</body>
</html>