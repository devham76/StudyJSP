<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="user.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="user.UserDTO"></jsp:useBean>s
<jsp:setProperty name="dto" property="*" />
<%
	UserDAO userDao = new UserDAO();
	int result = userDao.modifyUserInfo(dto);
	if (result == -2) {
%>
	<script type="javascript/text">
	alert("������ �߻��Ͽ����ϴ�");
	history.back;
	</script>
<%
	} else {
%>
	<script type="javascript/text">
	alert("ȸ�������� �����Ǿ����ϴ�.");
	location.reload;
	</script>
<% 
	}
%>