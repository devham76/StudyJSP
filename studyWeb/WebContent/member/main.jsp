<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	// 로그인 안되어 있으면 메인으로 이동
	if (session.getAttribute("VaildMem") == null) {
		System.out.println("vaildmem is null");
%>
<jsp:forward page="login2.jsp" />
<!--  
		<script type='text/javascript'>
			location.href = "login2.jsp";
		</script>
		-->
<% 
	}
	else {
		

		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
%>
<jsp:include page="/head.jsp" flush="true" />
<h1> <%= name %> 님 안녕하세요.</h1><br>
<form action = "logout.jsp" method="post">
	<input type="submit" value="로그아웃">
	<input type="button" value="정보수정" onclick="javascript:window.location='modify.jsp'">
</form>
<jsp:include page="/footer.html" flush="true" />
<%
	}
%>