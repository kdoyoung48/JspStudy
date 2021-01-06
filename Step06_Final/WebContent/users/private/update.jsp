<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 회원정보를 불러와서
	String id=(String)session.getAttribute("id");
	String email=request.getParameter("email");
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	// 2. DB에 수정 반영하고
	boolean isSuccess=UsersDao.getInstane().update(dto);
	// 3.응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/update.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<script>
	<%if(isSuccess){%>
		alert("수정 했습니다.");
		location.href="info.jsp";
	<%}else{%>
		alert("수정실패");
		location.href="updateform.jsp";
	<%}%>
</script>
</body>
</html>