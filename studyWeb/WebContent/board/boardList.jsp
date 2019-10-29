<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<jsp:include page="head.html" flush="true" />

<div class="container">
	<div class="row-head">
		<select name="job">
			<option value="all">전체검색</option>
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
		</select>
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
	<div class="row"></div>
</div>

<jsp:include page="footer.html" flush="true" />