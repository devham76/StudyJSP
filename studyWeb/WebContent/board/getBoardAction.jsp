
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*" %>
<%@page import="java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="boardDto" class="board.BoardDTO"></jsp:useBean>
<jsp:setProperty name="boardDto" property="*" />

<!-- dto는 data의 접근, dao는 data의 작업 -->
<%

	System.out.println("getBoardAction start");
	BoardDAO boardDao = new BoardDAO();
	List<BoardDTO> boardList = boardDao.getBoardList();

	for(int i=0; i<boardList.size();i++) {
		System.out.println(boardList.get(i).getTitle());
	}
	
	
%>

	<script type="javascript/text">



	</script>
