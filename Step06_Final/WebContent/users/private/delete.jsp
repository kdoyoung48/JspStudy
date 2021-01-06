<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	UsersDao.getInstane().delete(id);
	session.removeAttribute("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/delete.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>알림</h1>
	<p>
		<strong><%=id %></strong> 님 탈퇴 처리 되었습니다.
		<a href="${pageContext.request.contextPath}/">인덱스로 가기</a>
	</p>
</div>
</body>
</html>