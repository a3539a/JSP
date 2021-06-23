<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	// 로그인을 하지 않고 List 페이지를 요청할 경우
	if(mb == null){
		response.sendRedirect("/Farmstory1/user/login.jsp?success=101");
		return;
	}
	
	// 전송 파라미터 수신
	String pg = request.getParameter("pg");
	
	// DAO 객체 가져오기
	ArticleDao dao = ArticleDao.getInstance();
	
	// 페이지 번호 계산하기
	int total = dao.selectCountArticle(cate);
	
	int lastPageNum = dao.getLastPageNum(total);
	
	int currentPage = dao.getCurrentPage(pg);
	
	int start = dao.getLimitStart(currentPage);
	
	int pageStartNum = dao.getPageStartNum(total, start);
	
	int[] groups = dao.getPageGroup(currentPage, lastPageNum);
	
	// 게시물 가져오기
	List<ArticleBean> articles = dao.selectArticles(cate, start);

	
	String path = "./_aside_"+group+".jsp";
%>

<jsp:include page="<%= path %>"/>

<section id="board" class="list">
    <h3>글목록</h3>
    <article>

        <table border="0">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>
            <% for(ArticleBean article : articles){ %>
                    <tr>
                        <td><%= pageStartNum-- %></td>
                        <td><a href="/Farmstory1/board/view.jsp?group=<%= group %>&cate=<%= cate %>&seq=<%= article.getSeq() %>"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                        <td><%= article.getNick() %></td>
                        <td><%= article.getRdate().substring(2, 10)%></td>
                        <td><%= article.getHit() %></td>
                    </tr>
                    <%} %>
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
            	
            	<%if(groups[0] > 1){ %>
                	<a href="/Farmstory1/board/list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= groups[0] - 1 %>" class="prev">이전</a>
                <%} %>
                
                <% for (int i = groups[0]; i <= groups[1]; i++){ %>
                	<a href="/Farmstory1/board/list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= i %>" class="num <%= (currentPage == i) ? "current":""%>"><%= i %></a>
                <% } %>
                
                <%if(groups[1] < lastPageNum){ %>
                	<a href="/Farmstory1/board/list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= groups[1] + 1 %>" class="next">다음</a>
                <%} %>
            </div>


    <!-- 글쓰기 버튼 -->
    <a href="/Farmstory1/board/write.jsp?group=<%= group %>&cate=<%= cate %>" class="btnWrite">글쓰기</a>

</section>

            <!-- 내용 끝 -->

        </article>
    </section>

</div>
<%@ include file="../_footer.jsp" %>