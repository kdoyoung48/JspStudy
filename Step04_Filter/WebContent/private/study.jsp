<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/sutdy.jsp</title>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
%>
<p><strong><%=id %></strong>열공 열공 </p>
<a href="../index.jsp">인덱스로 가기</a>
</body>
</html>