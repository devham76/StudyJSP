<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/head.jsp" flush="true" />
<style>
.container {
	max-width: 450px;
}

.lh-condensed {
	line-height: 1.25;
}

input[name=userId] {
	width: 80%
}
</style>

<body class="bg-light">
	<div class="container">
		<div class="text-center pt-3">
			<!--img class="d-block mx-auto mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="42"-->
			<h2>회원가입</h2>
			<p class="lead">안녕하세요 고객님 ! 회원가입 정보를 입력해주세요:)</p>
		</div>
		<div class="row">
			<div class="col align-self-center">
				<form class="needs-validation" method="post" action="joinAction.jsp"
					novalidate>
					<div class="mb-3">
						<div class="input-group">
							<input type="text" class="form-control" name="userId"
								placeholder="아이디">
							<div class="input-group-append">
								<button type="checkId" class="btn btn-secondary">중복확인</button>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<input type="password" class="form-control" name="userPw"
							placeholder="비밀번호" required>
						<div class="invalid-feedback">비밀번호를 입력 해주세요</div>
					</div>
					<div class="mb-3">
						<input type="text" class="form-control" name="userName"
							placeholder="이름">
					</div>

					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">회원
						가입</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-muted text-center text-small">
			<p class="mb-1">&copy; 2019 이혜미</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="login.jsp">로그인</a></li>
				<li class="list-inline-item"><a href="./main.jsp">메인</a></li>
			</ul>
		</footer>
	</div>

	<jsp:include page="/footer.html" flush="true" />