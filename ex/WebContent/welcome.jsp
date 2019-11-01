<%@ page import="java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>쿠키버전입니다</h1>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for (int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id"))
				out.print(cookies[i].getValue()+"님 환영합니다!");
		}	
	}	
%>
<h1>세션버전입니다</h1>
<%

	Enumeration enumeration = session.getAttributeNames();
	while(enumeration.hasMoreElements()) {
		String sName = enumeration.nextElement().toString();
		String sValue = (String)session.getAttribute(sName);
		
		if(sValue.equals("hyemi")) out.println(sValue+"님 안녕하세요");
	}
%>
<br>
<a href="logout.jsp">로그아웃</a>
</body>
</html>