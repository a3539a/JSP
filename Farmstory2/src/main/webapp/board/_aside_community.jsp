<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sub">
    <div><img src="/Farmstory2/img/sub_top_tit5.png" alt="CROP TALK"></div>
    <section class="cate5">
        <aside>
            <img src="/Farmstory2/img/sub_aside_cate5_tit.png" alt="커뮤니티"/>

            <ul class="lnb">
                <li class="${cate eq 'notice' ? 'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=notice">공지사항</a></li>
                <li class="${cate eq 'menu' ? 'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=menu">오늘의 식단</a></li>
                <li class="${cate eq 'chef' ? 'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=chef">나도 요리사</a></li>
                <li class="${cate eq 'qna' ? 'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=qna">고객문의</a></li>
                <li class="${cate eq 'faq' ? 'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=faq">자주묻는 질문</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="/Farmstory2/img/sub_nav_tit_cate5_${cate}.png" alt="커뮤니티"/>
                <p>
                    HOME > 커뮤니티 > 
                    <c:if test="${cate eq 'notice'}"><em>공지사항</em></c:if>
                    <c:if test="${cate eq 'menu'}"><em>오늘의 식단</em></c:if>
                    <c:if test="${cate eq 'chef'}"><em>나도 요리사</em></c:if>
                    <c:if test="${cate eq 'qna'}"><em>고객문의</em></c:if>
                    <c:if test="${cate eq 'faq'}"><em>자주묻는 질문</em></c:if>
                </p>
            </nav>

            <!-- 내용 시작 -->
