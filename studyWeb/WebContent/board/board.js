/**
 * 
 */
//---------------------
// 새로운 글 쓰기
//---------------------
function postConfirm(){

	// 아이디 확인
	if (document.post_frm.title.value.length == 0) {
		alert("제목을 입력해주세요");
		post_frm.title.focus();
		return;
	}

	if (document.post_frm.content.value.length == 0) {
		alert("내용을 입력해주세요");
		post_frm.content.focus();
		return;
	}
	
	console.log("confirm 완료");
	// 입력 폼이 정확 하다면 제출한다. 
	document.post_frm.submit();
	
}