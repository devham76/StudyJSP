<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

actiontag.jsp페이지
<jsp:forward page="action_forward.jsp" >
	<jsp:param name="id" value="hyemi id"/>
	<jsp:param name="pw" value="1234"/> 
</jsp:forward>

</body>
</html>