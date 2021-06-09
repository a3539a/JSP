$(function(){
	
	// 유효성 검사
	$('#regForm').submit(function(){

		if(!isUidOk){
			alert('아이디를 유효하지 않습니다. 다시 확인 하세요');
			return false;
		}
		if(!isPassOk){
			alert('비밀번호가 유효하지 않습니다. 다시 확인 하세요');
			return false;
		}
		if(!isNameOk){
			alert('이름이 유효하지 않습니다. 다시 확인 하세요');
			return false;
		}
		if(!isNickOk){
			alert('별명이 유효하지 않습니다. 다시 확인 하세요');
			return false;
		}
		if(!isEmailOk){
			alert('이메일이 유효하지 않습니다. 다시 확인 하세요');
			return false;
		}
		if(!isHpOk){
			alert('휴대폰번호가 유효하지 않습니다. 다시 확인 하세요');
			return false;
		}
		
		return true;
	});
});