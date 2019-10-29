<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/head.jsp" flush="true" />
<head>
<link href="../assets/css/sign.css" rel="stylesheet">
</head>
<body class="text-center">
	<form class="form-signin" method="post" action="loginAction.jsp">
		<img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg"
			alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal"></h1>
		<label for="inputEmail" class="sr-only">아이디</label> 
			<input type="text" name="userId" class="form-control" placeholder="아이디" requiredautofocus> 
		<label for="inputPassword" class="sr-only">비밀번호</label>
			<input type="password" name="userPw" class="form-control" placeholder="비밀번호" required>
		<div class="checkbox mb-3">
			<label> <input type="checkbox" value="remember-me">
				기억하기
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		<p class="mt-5 mb-3 text-muted">&copy; 이혜미</p>
	</form>
</body>
<jsp:include page="/footer.html" flush="true" />