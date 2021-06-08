/**
 	날짜 : 2021/06/07
	이름 : 김승용
	내용 : 이메일 중복체크 스트립트
 */
$(function(){
    		
    		$('input[name=email]').focusout(function(){
    			
    			var email = $(this).val();
    			var param = {'email':email};
    			
    			$.ajax({
    				url: '/JBoard1/user/proc/checkEmail.jsp',
    				type: 'get',
    				data: param,
    				datatype: 'json',
    				success: function(data){
						
    					if(data.result == 1){
    						$('.resultEmail').css('color','red').text('이미 사용중인 이메일 입니다.');
    					}else{
    						$('.resultEmail').css('color','green').text('사용 가능한 이메일 입니다.');
    					}
    				}
    			});
    		});
    	});