<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.*" %>
<%@page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 빈즈를 이용해서 처리해도 되고
	// 아래 처럼 request에서 parameter값을 가져 와서 처리해도 된다.
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	
	UserDAO userDao = new UserDAO(); // 데이터 입력/수정/삭제
	int result  = userDao.login(id, pw);
	PrintWriter script = response.getWriter();
	if (result == 1) {	
		UserDTO dto = userDao.getUserInfo(id);
		String name = dto.getUserName();
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		// 유효한 멤버임을 저장
		session.setAttribute("VaildMem", "yes");
		System.out.println("vaildmem ->"+session.getAttribute("VaildMem"));
		
		response.sendRedirect("main.jsp");
		//script.print(" location.href = '/studyWeb/main.jsp' ");
		//script.print(" location.href = 'main.jsp' ");
	}
	else if (result == 0) {
%>
		<script type='text/javascript'>
		alert("비밀번호가 틀립니다.");
		history.back();
		</script>
<%
	}
	else if (result == -1) {
%>
		<script type='text/javascript'>
		alert("존재하지 않는 아이디 입니다.");
		history.back();
		</script>
<%
	}
	else if (result == -2) {
%> 
		<script type='text/javascript'>
		alert("데이터베이스 오류가 발생했습니다.");
		history.back();
		</script>
<%
	}
%>