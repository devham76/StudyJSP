<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<jsp:include page="/head.jsp" flush="true" />
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
	<div class="row">
		<table class="table">
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" class="form-control form-small"
						id="title"></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td><input type="text" class="form-control form-small"
						id="writer"></td>
				</tr>
				<tr>
					<td colspan=2><textarea class="form-control"
							id="exampleFormControlTextarea1" rows="3"></textarea></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row">
		<button type="button" class="btn btn-dark" id="go-list">목록</button>
		<button type="button" class="btn btn-dark" id="new-post">글쓰기</button>
	</div>
</div>

<jsp:include page="/footer.html" flush="true" />