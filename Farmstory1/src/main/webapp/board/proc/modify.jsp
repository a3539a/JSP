<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송데이터 가져오기
	request.setCharacterEncoding("utf-8");
	String group   = request.getParameter("group");
	String cate    = request.getParameter("cate");
	String seq     = request.getParameter("seq");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 
	ArticleDao dao = ArticleDao.getInstance();
	
	dao.updateArticle(title, content, seq);
	
	response.sendRedirect("/Farmstory1/board/view.jsp?group="+group+"&cate="+cate+"&seq="+seq);
	
%>