<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDto dto=(MemberDto)request.getAttribute("dto");
%>
<p>번호: <strong><%=dto.getNum() %></strong></p>
<p>이름: <strong><%=dto.getName() %></strong></p>
<p>주소: <strong><%=dto.getAddr() %></strong></p>
</body>
</html>