<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:useBean id="member" class="com.javalac.daotoex.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="member" property="userId" value="hyemiId" />
<jsp:setProperty name="member" property="userPw" value="hyemiPw" />
<jsp:setProperty name="member" property="userName" value="������" /> 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

�̸� : <jsp:getProperty name="member" property="userName"/><br>
���̵� : <jsp:getProperty name="member" property="userId"/><br>
��й�ȣ : <jsp:getProperty name="member" property="userPw"/><br>
-----------
�̸� : {member.userName}<br>
���̵� : {member.userId}<br>
��й�ȣ : {member.userPw}<br>

</body>
</html>