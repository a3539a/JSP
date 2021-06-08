/**
 	날짜 : 2021/06/07
	이름 : 김승용
	내용 : 닉네임 중복체크 스트립트
 */
$(function(){
    		
    		$('input[name=nick]').focusout(function(){
    			
    			var nick = $(this).val();
    			var param = {'nick':nick};
    			
    			$.ajax({
    				url: '/JBoard1/user/proc/checkNick.jsp',
    				type: 'get',
    				data: param,
    				datatype: 'json',
    				success: function(data){
						
    					if(data.result == 1){
    						$('.resultNick').css('color','red').text('이미 사용중인 닉네임 입니다.');
    					}else{
    						$('.resultNick').css('color','green').text('사용 가능한 닉네임 입니다.');
    					}
    				}
    			});
    		});
    	});