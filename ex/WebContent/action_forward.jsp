<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
action_foward.jsp ������

<%!
	String id1,pw1;
%>
<%
	id1 = request.getParameter("id");
	pw1 = request.getParameter("pw");
%>
���̵� : <%=id1 %> <br>
��� : <%=pw1 %>
</body>
</html>