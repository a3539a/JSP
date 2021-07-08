<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<jsp:include page="./_aside_${group}.jsp"/>
<script type="text/javascript">
	function checkFile(el){
	
		// files 로 해당 파일 정보 얻기.
		var file = el.files;
	
		// file[0].size 는 파일 용량 정보입니다.
		if(file[0].size > 1024 * 1024 * 10){
			// 용량 초과시 경고후 해당 파일의 용량도 보여줌
			alert('10MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
		}
	
		// 체크를 통과했다면 종료.
		else return;
	
		// 체크에 걸리면 선택된 내용 취소 처리를 해야함.
		// 파일선택 폼의 내용은 스크립트로 컨트롤 할 수 없습니다.
		// 그래서 그냥 새로 폼을 새로 써주는 방식으로 초기화 합니다.
		// 이렇게 하면 간단 !?
		el.outerHTML = el.outerHTML;
	}
</script>
<section id="board" class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="/Farmstory2/board/write.do" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="group" value="${group}">
            <input type="hidden" name="cate" value="${cate}">
            <input type="hidden" name="uid" value="${sessMember.uid}">
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content"></textarea>                                
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input type="file" name="fname" onchange="checkFile(this)"/></td>
                </tr>
            </table>
            <div>
                <a href="/Farmstory2/board/list.do?group=${group}&cate=${cate}" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="작성완료">
            </div>
        </form>
    </article>
</section>
            <!-- 내용 끝 -->

        </article>
    </section>

</div>
        
<%@ include file="../_footer.jsp" %>