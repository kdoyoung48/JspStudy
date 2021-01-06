<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/send2.jsp</title>
</head>
<body>
<%
	String b=request.getParameter("msg");
	System.out.println("msg:"+b);
%>
	<p>메세지 전송완료</p>
</body>
</html>