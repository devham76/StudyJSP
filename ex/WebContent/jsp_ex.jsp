<%@page import = "java.util.*" %>
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

	int[] arrs = new int[2];
	arrs[0] = 1;
	out.println(Arrays.toString(arrs));
	for(int i=1; i<10; i++) {
		out.println("2 * "+i+" = "+ (2*i) + "<br>");
%>
	============ <br>
<%
	}
%>

</body>
</html>