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
	// �������� ����
	Cookie cookie = new Cookie("cookieN", "cookieV");	
	// ��Ű ��ü ���� (��Ű�̸�, ��Ű��) ex. new Cookie("id", "hyemiid")
	cookie.setMaxAge(60*60);
	// 1�ð� ���� ����
	response.addCookie(cookie);
%>
	<a href="cookieget.jsp">cookie get</a>
</body>
</html>