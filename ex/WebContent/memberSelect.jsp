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
	// ������ �۾�
	MemberDAO memberDAO = new MemberDAO();
	// ������ ������
	ArrayList<MemberDTO> dtos = memberDAO.memberSelect();
	
	for(int i=0; i<dtos.size(); i++) {
		MemberDTO dto = dtos.get(i);
		String name = dto.getUserName();
		String id = dto.getUserId();
		String pw = dto.getUserPw();
		
		out.println("�̸� :"+name+", ���̵� :"+id+", ��й�ȣ :"+pw+"<br>");
	}
%>

</body>
</html>