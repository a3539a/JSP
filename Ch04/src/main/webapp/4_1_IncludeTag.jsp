<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4_1_IncludeTag</title>
	<%--
		날짜 : 2021/06/02
		이름 : 김승용
		내용 : JSP Action Tag 실습하기
		
		include 지시자
		 - 공통의 전역파일을 삽입하는 지시자
		 - 일반적으로 UI모듈, 공통의 전역파일의 변수를 참조할 때 사용
		 - 정적타임에 삽입(코드상에서 이미 삽입된 상태)
		 
		include 태그
		 - 공통의 전역파일을 삽입하는 태그
		 - 일반적으로 UI모듈을 삽일 할 때 사용
		 - 동적타임에 삽입(출력시에 삽입된다. 결과적으론 같음)
		
	--%>
</head>
<body>
	<h3>1.Include 태그 실습하기</h3>
	
	<h4>include 지시자로 삽입</h4>
	<%@ include file="./inc/_header.jsp" %>
	<%@ include file="./inc/_footer.jsp" %>
	
	<h4>include 태그로 삽입</h4>
	<jsp:include page="./inc/_header.jsp"/>
	<jsp:include page="./inc/_footer.jsp"/>
	
	
	
</body>
</html>