<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<jsp:include page="boardHead.jsp" flush="true" />
<style>
.row {
	margin: 10px 0px;
}
#search-text {
	width: 200px;
	margin: 0 3px 0 10px;
}
</style>

<div class="container">
	<div class="row">
		<select name="search-category">
			<option value="all">전체검색</option>
			<option value="title">제목</option>
			<option value="writer">작성자</option>
		</select> <input type="text" class="form-control" id="search-text" size=10>
		<button type="button" class="btn btn-dark" id="search">검색</button>
	</div>
	<div class="row">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">등록일시</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>안녕하세요</td>
					<td>이혜미</td>
					<td>2019.10.29</td>
					<td>10</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row">
	<button type="button" class="btn btn-dark" id="new-post">글쓰기</button>
	</div>
</div>

<jsp:include page="/footer.html" flush="true" />