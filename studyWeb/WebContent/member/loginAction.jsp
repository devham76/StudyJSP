<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDAO" %>
<%--자바스크립트를 작성하기 위해 만드는 문장 --%>
<%@ page import="java.io.PrintWriter" %>

<%--건너오는 모든 데이터를 utf-8으로 받는다 --%>
<% request.setCharacterEncoding("UTF-8"); %>

<%--자바 빈즈를 이용  , 현재페이지에서만 사용 --%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userId" />
<jsp:setProperty name="user" property="userPw" />

<!-- 회원 가입 처리 페이지 -->
<%

	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user.getUserId(), user.getUserPw(), user.getUserName());
	
	System.out.println("join result =>"+result+", id :"+user.getUserId()+", pw :"+user.getUserPw());
	PrintWriter script = response.getWriter();
	script.print("<script type='text/javascript'>");
	if (result == 1) {
		script.print("alert('회원가입에 성공하셨습니다!');");
		script.print(" location.href = 'login.jsp' ");
	}
	else if (result == -1) {
		script.print("alert('회원가입에 실패했습니다');");
		script.print("history.back();");
	}
	else if (result == -2) {
		script.print("alert('데이터베이스 오류가 발생했습니다');");
		script.print("history.back();");
	}
	script.print("</script>");
%>
