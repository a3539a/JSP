<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list</title>

</head>
<body>
	<a href="/Ch08/member/register.do">직원등록</a>
	
	<h4>직원목록</h4>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>관리</th>
		</tr>
		
		<c:forEach var="member" items="${members}">
		<tr>
			<th>${member.uid}</th>
			<th>${member.name}</th>
			<th>${member.hp}</th>
			<th>${member.pos}</th>
			<th>${member.dep}</th>
			<th>${member.rdate.substring(2, 10)}</th>
			<th>
				<a href="/Ch08/member/modify.do?uid=${member.uid}">수정</a>
				<a href="#">삭제</a>
			</th>
		</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html>