<%@ page import="java.util.ArrayList" %>
<%@ page import="com.javalac.daotoex.MemberDTO" %>
<%@ page import="com.javalac.daotoex.MemberDAO" %>
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
	// 데이터 작업
	MemberDAO memberDAO = new MemberDAO();
	// 데이터 모으기
	ArrayList<MemberDAO> dtos = memberDAO.memberSelect();
	
	for(int i=0; i<dtos.size(); i++) {
		MemberDTO dto = dtos.get(i);
		String name = dto.getName();
		String id = dto.getName();
		String pw = dto.getPw();
		
		out.println("이름 :"+name+", 아이디 :"+id+", 비밀번호 :"+pw);
	}
%>

</body>
</html>