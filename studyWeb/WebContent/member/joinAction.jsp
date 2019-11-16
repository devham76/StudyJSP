<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO"%>
<%--자바스크립트를 작성하기 위해 만드는 문장 --%>
<%@ page import="java.io.PrintWriter"%>

<%--건너오는 모든 데이터를 utf-8으로 받는다 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%--자바 빈즈를 이용  , 현재페이지에서만 사용 --%>
<jsp:useBean id="user" class="user.UserDTO" scope="page" />
<jsp:setProperty name="user" property="userId" />
<jsp:setProperty name="user" property="userPw" />
<jsp:setProperty name="user" property="userName" />

<!-- 회원 가입 처리 페이지 -->
<%
	PrintWriter script = response.getWriter();

	UserDAO userDAO = new UserDAO();
	// -- 모든 데이터가 들어왔는지 확인
	if (user.getUserId() == null) {
		script.print("<script type='text/javascript'>");
		script.print(" alert('아이디를 입력해주세요'); ");
		script.print(" history.back(); ");
		script.print("</script>");
	} else if (user.getUserPw() == null) {
		script.print("<script type='text/javascript'>");
		script.print(" alert('비밀번호를 입력해주세요'); ");
		script.print(" history.back(); ");
		script.print("</script>");
	} else if (user.getUserName() == null) {
		script.print("<script type='text/javascript'>");
		script.print(" alert('이름을 입력해주세요'); ");
		script.print(" history.back(); ");
		script.print("</script>");
	} else {
		//-- 회원정보 입력
		int result = userDAO.join(user);

		System.out
				.println("join result =>" + result + ", id :" + user.getUserId() + ", pw :" + user.getUserPw());
		script.print("<script type='text/javascript'>");
		if (result == -1) {
			script.print("alert('회원가입에 실패했습니다');");
			script.print("history.back();");
		} else {
			script.print("alert('회원가입에 성공하셨습니다!');");
			script.print(" location.href = 'main.jsp' ");
		}
		script.print("</script>");
	}
%>
