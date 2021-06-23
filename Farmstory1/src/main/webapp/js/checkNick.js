/**
 	날짜 : 2021/06/07
	이름 : 김승용
	내용 : 닉네임 중복체크 스트립트
 */
// 정규 표현식
var regNick = /^[a-z가-힣0-9]{2,10}$/;

// 최종 유효성 검증
var isNickOk = false;

$(function(){
    		
    		$('input[name=nick]').focusout(function(){
    			
    			var nick = $(this).val();
    			var param = {'nick':nick};
    			
    			$.ajax({
    				url: '/Farmstory1/user/proc/checkNick.jsp',
    				type: 'get',
    				data: param,
    				datatype: 'json',
    				success: function(data){
						
    					if(data.result == 1){
    						$('.resultNick').css('color','red').text('이미 사용중인 닉네임 입니다.');
							isNickOk = false;
    					}else{
							if(regNick.test(nick) == true){
	    						$('.resultNick').css('color','green').text('사용 가능한 닉네임 입니다.');
								isNickOk = true;
							}else{
	    						$('.resultNick').css('color','red').text('한글,영문,숫자 조합 2~10자까지 가능합니다.');
								isNickOk = false;
							}
    					}
    				}
    			});
    		});
    	});