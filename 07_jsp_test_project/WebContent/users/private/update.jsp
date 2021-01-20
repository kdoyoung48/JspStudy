<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id=(String)session.getAttribute("id");
	String email=request.getParameter("email");
	
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	
	boolean isSuccess=UsersDao.getInstance().update(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/update.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<script>
	<%if(isSuccess){%>
		alert("수정 했습니다.");
		location.href="info.jsp";
	<%}else{%>
		alery("수정실패!");
		location.href="updateform.jsp";
	<%}%>	
</script>
</body>
</html>