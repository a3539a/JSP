<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	
	if(mb == null){
		// 로그인을 안했으면
		pageContext.forward("./user/login.jsp");
	}else{
		// 로그인을 했으면
		pageContext.forward("./list.jsp");
	}

%>