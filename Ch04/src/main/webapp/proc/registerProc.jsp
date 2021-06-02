<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>registerProc</title>
</head>
<body>
	<h3>useBean 액션 태그 실습하기</h3>
	
	<%
		// 파라미터 수신
		/*
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobby");
		String addr = request.getParameter("addr");
		*/
	%>
	
	<!-- 똑같은 기능 -->
	<jsp:useBean id="rb" class="sub1.RegisterBean">
		<jsp:setProperty name="rb" property="name"/>
		<jsp:setProperty name="rb" property="gender"/>
		<jsp:setProperty name="rb" property="hobby"/>
		<jsp:setProperty name="rb" property="addr"/>
	</jsp:useBean>
	
	<p>
		이름 : <%= rb.getName() %><br />
		성별 : <%= rb.getGender() == 1 ? "남자" : "여자" %><br />
		취미 : 
		<%
			for(String hobby : rb.getHobby()){
				out.print(hobby+", ");
			}
		%><br />
		주소 : <%= rb.getAddr() %>
	</p>
	
</body>
</html>