

<% 
	//--- 로그인 했다면, 메인 페이지로 바로 이동한다.
	if(session.getAttribute("ValidMem") != null) { %>
	<jsp:forward page="main.jsp"></jsp:forward>
<% } else { %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/head.jsp" flush="true" />
<head>
<link href="../assets/css/sign.css" rel="stylesheet">
</head>

<body class="text-center">
	<form class="form-signin" method="post" action="loginAction2.jsp">
		<h1 class="h3 mb-3 font-weight-normal"></h1>
		<label for="inputEmail" class="sr-only">아이디</label> 
		<input type="text"
			name="userId" class="form-control" placeholder="아이디"
			requiredautofocus value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id")); %>" >
		
		<label for="inputPassword" class="sr-only">비밀번호</label> <input
			type="password" name="userPw" class="form-control" placeholder="비밀번호"
			required>

		<button class="btn  btn-primary btn-block" type="submit">로그인</button>
		<button class="btn btn-primary btn-block" onclick="javascript:window.location='join2.jsp'">회원가입</button>
		<p class="mt-5 mb-3 text-muted">&copy; 이혜미</p>
	</form>
</body>
<jsp:include page="/footer.html" flush="true" />
<% 
}
%>