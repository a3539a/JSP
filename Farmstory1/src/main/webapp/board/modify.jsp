<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String seq   = request.getParameter("seq");
	
	String path = "./_aside_"+group+".jsp";
	
	// 수정 글 가져오기
	ArticleBean article = ArticleDao.getInstance().selectArticle(seq);
%>

<jsp:include page="<%= path %>"/>

<section id="board" class="modify">
    <h3>글수정</h3>
    <article>
        <form action="/Farmstory1/board/proc/modify.jsp" method="post">
            <input type="hidden" name="seq" value="<%= seq %>">
            <input type="hidden" name="group" value="<%= group %>">
            <input type="hidden" name="cate" value="<%= cate %>">
                <table>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="title" value="<%= article.getTitle() %>" placeholder="제목을 입력하세요."/></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="content"><%= article.getContent() %></textarea>                                
                        </td>
                    </tr>
                </table>
            <div>
                <a href="/Farmstory1/board/list.jsp?group=<%= group %>&cate=<%= cate %>" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="수정완료">
            </div>
        </form>
    </article>
</section>

            <!-- 내용 끝 -->

        </article>
    </section>

</div>
<%@ include file="../_footer.jsp" %>