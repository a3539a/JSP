<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String seq    = request.getParameter("seq");
	String parent = request.getParameter("parent");
	String group   = request.getParameter("group");
	String cate    = request.getParameter("cate");
	
	ArticleDao dao = ArticleDao.getInstance();
	
	// 댓글 삭제
	dao.deleteComment(seq);
	
	// 댓글 카운트 -1
	dao.updateCommentCount(parent, -1);
	
	response.sendRedirect("/Farmstory1/board/view.jsp?group="+group+"&cate="+cate+"&seq="+parent);
%>