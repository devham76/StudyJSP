<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:useBean id="member" class="com.javalac.daotoex.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="member" property="userId" value="hyemiId" />
<jsp:setProperty name="member" property="userPw" value="hyemiPw" />
<jsp:setProperty name="member" property="userName" value="이혜미" /> 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

이름 : <jsp:getProperty name="member" property="userName"/><br>
아이디 : <jsp:getProperty name="member" property="userId"/><br>
비밀번호 : <jsp:getProperty name="member" property="userPw"/><br>
-----------
이름 : {member.userName}<br>
아이디 : {member.userId}<br>
비밀번호 : {member.userPw}<br>

</body>
</html>