// 회원가입 버튼 클릭시 
function infoConfirm() {
	// 아이디 확인
	if (document.reg_frm.userId.value.length == 0) {
		alert("아이디를 입력해주세요");
		reg_frm.userId.focus();
		return;
	}
	// 
	if (document.reg_frm.userPw.value.length == 0) {
		alert("비밀번호를 입력해주세요");
		reg_frm.userPw.focus();
		return;
	}
	if (document.reg_frm.userPw2.value.length == 0) {
		alert("비밀번호를 다시 입력해주세요");
		reg_frm.userPw2.focus();
		return;
	}
	if (document.reg_frm.userPw.value.length != document.reg_frm.userPw2.value.length) {
		alert("비밀번호가 일치 하지 않습니다");
		reg_frm.userPw2.focus();
		return;
	}
	if (document.reg_frm.userName.value.length == 0) {
		alert("이름을 입력해주세요");
		reg_frm.userName.focus();
		return;
	}
	
	// 입력 폼이 정확 하다면 제출한다. 
	document.reg_frm.submit();
}