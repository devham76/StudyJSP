<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 빈즈를 이용해서 처리해도 되고
	// 아래 처럼 request에서 parameter값을 가져 와서 처리해도 된다.
	String id = request.getParameter("userId");
	String pw = request.getParameter("usetPw");
	
	UserDAO userDao = new UserDAO(); // 데이터 입력/수정/삭제
	int result  = userDao.login(id, pw);

	if (result == 1) {	
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		// 유효한 멤버임을 저장
		session.setAttribute("ValidMem", "yes");
		response.sendRedirect("main.jsp");
	}
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>