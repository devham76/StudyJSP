<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<% 
	// 서버에서 실행
	Cookie cookie = new Cookie("cookieN", "cookieV");	
	// 쿠키 객체 생성 (쿠키이름, 쿠키값) ex. new Cookie("id", "hyemiid")
	cookie.setMaxAge(60*60);
	// 1시간 동안 유지
	response.addCookie(cookie);
%>
	<a href="cookieget.jsp">cookie get</a>
</body>
</html>