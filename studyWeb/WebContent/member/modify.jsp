<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/head.jsp" flush="true" />
<link href="../assets/css/join.css" rel="stylesheet">

<%@page import ="user.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
	String id = (String)session.getAttribute("id");
id = "hyemi3";
	UserDAO userDao = new UserDAO();
	UserDTO userDto = userDao.getUserInfo(id);
%>
<body class="bg-light">
	<div class="container">
		<div class="text-center pt-3">
			<h2>회원정보 수정</h2>
		</div>
		<div class="row">
			<div class="col align-self-center">
				<form class="needs-validation" method="post"
					action="modifyAction.jsp" name="modify_frm">
					<div class="mb-3">
						<div class="input-group">
							<input type="text" class="form-control" name="userId"
								value="<%= userDto.getUserId()%>" disabled >
						</div>
					</div>
					<div class="mb-3">
						<input type="password" class="form-control" name="userPw"
							placeholder="비밀번호" value="<%= userDto.getUserPw()%>" required>
						<div class="invalid-feedback">비밀번호를 입력 해주세요</div>
					</div>
					<div class="mb-3">
						<input type="password" class="form-control" name="userPw2"
							placeholder="비밀번호 확인" required>
						<div class="invalid-feedback">비밀번호를 다시 입력 해주세요</div>
					</div>
					<div class="mb-3">
						<input type="text" class="form-control" name="userName"
							placeholder="이름" value="<%= userDto.getUserName()%>" required>
					</div>

					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="button"
						onclick="modifyConfirm()">정보 수정</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-muted text-center text-small">
			<p class="mb-1">&copy; 2019 이혜미</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="./main.jsp">메인</a></li>
			</ul>
		</footer>
	</div>


	<script lauguage="JavaScript" src="member.js"></script>
	<jsp:include page="/footer.html" flush="true" />