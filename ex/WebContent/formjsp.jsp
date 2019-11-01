<%@page import = "java.util.*"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!
	String[] hobbys;
	String name, id, pw, test;
%>

<% 
	request.setCharacterEncoding("EUC-KR");
	name = request.getParameter("name");
	id 		= request.getParameter("id");
	pw		= request.getParameter("pw");
	test 	= request.getParameter("name");
	
	hobbys	= request.getParameterValues("hobby");
%>

이름 : <%=name %> <br>
아이디 : <%=id %> <br>
취미 : <%=Arrays.toString(hobbys) %> <br>
뭐지 : <%=test %>

</body>
</html>