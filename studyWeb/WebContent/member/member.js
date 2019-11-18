//-- 회원정보 수정 버튼 클릭시
function modifyConfirm() {
	if (document.modify_frm.userPw.value.length == 0) {
		alert("비밀번호를 입력해주세요");
		reg_frm.userPw.focus();
		return;
	}
	if (document.modify_frm.userPw2.vale.length == 0) {
		alert("비밀번호를 다시 입력해주세요");
		reg_frm.userPw2.focus();
		return;
	}
	if (document.modify_frm.userPw.value != document.reg_frm.userPw2.value) {
		alert("비밀번호가 일치 하지 않습니다");
		reg_frm.userPw2.focus();
		return;
	}
	if (document.modify_frm.userName.value.length == 0) {
		alert("이름을 입력해주세요");
		reg_frm.userName.focus();
		return;
	}
	// 입력 폼이 정확 하다면 제출한다. 
	document.modify_frm.submit();
}
//-- 회원가입 버튼 클릭시 
function infoConfirm() {
	// 아이디 확인
	if (document.reg_frm.userId.value.length == 0) {
		alert("아이디를 입력해주세요");
		reg_frm.userId.focus();
		return;
	}
	if (document.reg_frm.is_check_id.value == 0 ){
		alert("아이디 중복체크를 해주세요");
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
	if (document.reg_frm.userPw.value != document.reg_frm.userPw2.value) {
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

//-- 아이디 중복확인
function checkId(){
	var id =  document.reg_frm.userId.value;
	
	if (id.length == 0){
		alert("아이디를 입력해주세요.");
		reg_frm.userId.focus();
		return;
	}
	else if( (id < "0" || id >"9" ) && (id < "A" || id > "Z") && (id < "a" || id > "z")) {
			alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
			return false;
	}
	else {
		
		$.ajax({
			 type : "POST"
			, url : "checkId.jsp"
			, data : {id: id}
			, success : function(data){
				
				if (data == -1){
					alert("이미 존재하는 아이디 입니다."); 
					reg_frm.userId.focus();
				}
				else if (data == -2) {
					alert("오류가 발생하였습니다. (db연결 실패)"); 
					reg_frm.userId.focus();
				}
				else if (data == 1) {
					alert("사용 하 실 수 있는 아이디 입니다.");
					document.reg_frm.is_check_id.value = 1;
				}
					
			}
			, error : function(data) {
				alert("오류가 발생했습니다.");
			}
				
		});
		
	}
	
}