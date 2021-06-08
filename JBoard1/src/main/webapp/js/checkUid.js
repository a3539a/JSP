/**
 	날짜 : 2021/06/07
	이름 : 김승용
	내용 : 아이디 중복체크 스트립트
 */
$(function(){
    		
    		$('input[name=uid]').focusout(function(){
    			
    			var uid = $(this).val();
    			var param = {'uid':uid};
    			
    			$.ajax({
    				url: '/JBoard1/user/proc/checkUid.jsp',
    				type: 'get',
    				data: param,
    				datatype: 'json',
    				success: function(data){
						
    					if(data.result == 1){
    						$('.resultId').css('color','red').text('이미 사용중인 아이디 입니다.');
    					}else{
    						$('.resultId').css('color','green').text('사용 가능한 아이디 입니다.');
    					}
    				}
    			});
    		});
    	});