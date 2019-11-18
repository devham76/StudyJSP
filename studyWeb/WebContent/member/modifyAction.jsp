<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="user.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="user.UserDTO"></jsp:useBean>s
<jsp:setProperty name="dto" property="*" />
<%
	UserDAO userDao = new UserDAO();
	int result = userDao.modify(dto);
%>