<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="boardHead.jsp" flush="true" />
<style>
.form-small {
	width: 200px;
}

.btn {
	margin-right: 10px;
}
</style>

<div class="container">
	게시판 등록
	<form method=post action="newPostAction.jsp" name="post_frm">
	<div class="row">
		<table class="table">
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" class="form-control form-small"
						name="title"></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td><input type="text" class="form-control form-small"
						name="writer" disable>
						<% if(session.getAttribute("name") != null) out.println(session.getAttribute("name")); %>
						</td>
				</tr>
				<tr>
					<td colspan=2><textarea class="form-control"
							name="content" rows="3"></textarea></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row">
		<button type="button" class="btn btn-dark" onclick="javascript:window.location='boardList.jsp'">목록</button>
		<button type="button" class="btn btn-dark" onclick="postConfirm()">글쓰기</button>
	</div>
	</form>
</div>
<script lauguage="JavaScript" src="board.js"></script>
<jsp:include page="/footer.html" flush="true" />