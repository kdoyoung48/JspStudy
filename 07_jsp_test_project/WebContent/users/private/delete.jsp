<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	UsersDao.getInstance().delete(id);
	session.removeAttribute("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/delete.jsp</title>
</head>
<body>
	<script>
		alert("<%=id%> 탈퇴 처리 되었습니다.");
		location.href="${pageContext.request.contextPath}/";
	</script>
</body>
</html>