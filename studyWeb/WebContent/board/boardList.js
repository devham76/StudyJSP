
init();
function boardListInit(){
	
	$.ajax({
		 type : "GET"
		, url : "getBoardAction.jsp"
		, data : {action:"getBoardList"}
		, success : function(data){
			console.log(data);
		}
		, error : function(data) {
			console.log("오류가 발생했습니다.");
		}
			
	});
	
	/*
	 * 		
	 * <table class="table" id="boardListTable">
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
		*/
}