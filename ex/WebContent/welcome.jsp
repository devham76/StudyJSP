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

<h1>��Ű�����Դϴ�</h1>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for (int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id"))
				out.print(cookies[i].getValue()+"�� ȯ���մϴ�!");
		}	
	}	
%>
<h1>���ǹ����Դϴ�</h1>
<%

	Enumeration enumeration = session.getAttributeNames();
	while(enumeration.hasMoreElements()) {
		String sName = enumeration.nextElement().toString();
		String sValue = (String)session.getAttribute(sName);
		
		if(sValue.equals("hyemi")) out.println(sValue+"�� �ȳ��ϼ���");
	}
%>
<br>
<a href="logout.jsp">�α׾ƿ�</a>
</body>
</html>