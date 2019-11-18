<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="user.*"%>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = request.getParameter("id");
	System.out.println("id ->"+id);
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.checkId(id);
	System.out.println("result : "+result);
	PrintWriter script = response.getWriter();
	script.println(result);
%>
