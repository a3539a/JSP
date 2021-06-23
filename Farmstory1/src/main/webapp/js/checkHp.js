/**
 	날짜 : 2021/06/07
	이름 : 김승용
	내용 : 휴대폰 중복체크 스트립트
 */

// 최종 유효성 검증
var isHpOk = false;

$(function(){
    		
    		$('input[name=hp]').focusout(function(){
    			
    			var hp = $(this).val();
    			var param = {'hp':hp};
    			
    			$.ajax({
    				url: '/Farmstory1/user/proc/checkHp.jsp',
    				type: 'get',
    				data: param,
    				datatype: 'json',
    				success: function(data){
						
    					if(data.result == 1){
    						$('.resultHp').css('color','red').text('이미 사용중인 번호 입니다.');
							isHpOk = false;
    					}else{
    						$('.resultHp').css('color','green').text('사용 가능한 번호 입니다.');
							isHpOk = true;
    					}
    				}
    			});
    		});
    	});