<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="/Jboard2/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    	jQuery(function(){
    		$('.btnCommentDel').click(function(){
    			if(confirm('정말 삭제 하시겠습니까?')){
    				return true;
    			}else{
    				return false;
    			}
    		});
    		
    		$('.btnCommentModify').click(function(){
    			
    			var btnThis = $(this);
    			var mode = btnThis.text();
    			var textarea = btnThis.parent().prev();
    			
    			if(mode == ' 수정'){
    				// 수정모드
    				
    				$(this).text(' 완료');
    				
        			textarea.attr('readonly', false).focus();
        			textarea.css('outline', '1px grey solid');
        			
    			}else{
    				// 수정완료 모드
    				var content = textarea.val();
    				var seq = textarea.attr('data-seq');
    				
    				var jsonData = {'seq'     : seq,
		    						'content' : content};
    				
    				$.ajax({
    					url: '/JBoard1/proc/commentUpdate.jsp',
    					type: 'post',
    					data: jsonData,
    					datatype: 'json',
    					success: function(data){
    						
    						if(data.result == 1){
    							textarea.attr('readonly', true);
    							textarea.css('outline', 'none');
    							btnThis.text(' 수정');
    							
    							alert('수정 완료!!!');
    						}
    					}
    				});
    				
    			} 
    			    			
    			return false;
    			
    		});
    		
    	});
    </script>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="제목입니다." readonly/></td>
                </tr>
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="#">2020년 상반기 매출자료.xls</a>
                        <span>7회 다운로드</span>
                    </td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly>내용 샘플입니다.</textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="#" class="btnDelete">삭제</a>
                <a href="./modify.html" class="btnModify">수정</a>
                <a href="./list.html" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                <article class="comment">
                    <span>
                        <span>길동이</span>
                        <span>20-05-13</span>
                    </span>
                    <textarea name="comment" readonly>댓글 샘플입니다.</textarea>
                    <div>
                        <a href="#">삭제</a>
                        <a href="#">수정</a>
                    </div>
                </article>
                <p class="empty">
                    등록된 댓글이 없습니다.
                </p>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="#">
                    <textarea name="comment"></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>