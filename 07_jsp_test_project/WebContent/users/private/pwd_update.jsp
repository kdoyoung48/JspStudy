<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");
	
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	
	boolean isSuccess=UsersDao.getInstance().updatePwd(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
<%if(isSuccess){ 
	//다시 로그인 하도록 로그아웃 처리
	session.removeAttribute("id");%>
	<p>
		<strong><%=id %></strong> 비밀번호를 수정했습니다.
		<a href="${pageContext.request.contextPath}/users/loginform.jsp">다시 로그인 하기</a>
	</p>
<%}else{ %>
	<p>
		이전 비밀번호가 일치 하지 않습니다.
		<a href="pwd_updateform.jsp">다시 수정하기</a>
	</p>
<%} %>
</div>
</body>
</html>