<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<!--link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous"-->
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<link href="../assets/css/style.css" rel="stylesheet">

<title>Insert title here</title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="errorPage.jsp"%>

</head>
<%
	// 로그인이 되어있으면 세션정보를 가져온다
	if (session.getAttribute("VaildMem") != null) {
		System.out.println("[head] vaildmem is exist !!");
		String id	 = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
	}
	else{
		System.out.println("[head] vaildmem is null");
	}
		
%>

