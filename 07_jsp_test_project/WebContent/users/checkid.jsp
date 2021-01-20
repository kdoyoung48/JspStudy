<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String inputId=request.getParameter("inputId");
	System.out.println("inputId:"+inputId);
	boolean isExist=UsersDao.getInstance().isExist(inputId);
%>
{"isExist":<%=isExist %>}