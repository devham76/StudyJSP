<!-- 회원 가입 확인 페이지 입니다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="user.UserDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*" />
<!-- dto는 data의 접근, dato는 data의 작업 -->
<%
	UserDAO userDao = new UserDAO();
	int result = userDao.join(dto);

System.out
		.println("join result =>" + result 
		+ ", id :" + dto.getUserId()
		+ ", pw :" + dto.getUserPw());

	if (result == -1) {
%>
	<script type="text/javascript">
		alert("회원가입에 실패했습니다");
		history.back();
	</script>
<%
	}  else { 
%>
	<script type="text/javascript">
		alert("회원가입에 성공했습니다");
		location.href = "main.jsp";
	</script>
<% 
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