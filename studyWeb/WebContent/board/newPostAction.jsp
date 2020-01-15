<!-- 회원 가입 확인 페이지 입니다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="boardDto" class="board.BoardDTO"></jsp:useBean>
<jsp:setProperty name="boardDto" property="*" />

<!-- dto는 data의 접근, dao는 data의 작업 -->
<%
	System.out.println("new PostAction start");
	BoardDAO boardDao = new BoardDAO();
	int result = boardDao.newPost(boardDto);

	System.out.println("newPost result =>" + result );
	

	if (result == -1) {
%>
	<script type="text/javascript">
		alert("글쓰기에 실패하였습니다");
		history.back();
	</script>
<%
	}  else { 
%>
	<script type="text/javascript">
		alert("작성 되었습니다");
		location.href = "boardList.jsp";
	</script>
<% 
	}
%>


