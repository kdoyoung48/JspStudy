<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<%
	//세션 영역에 저장된 아이디를 이용해서
	String id=(String)session.getAttribute("id");
	//DB에 저장된 가입정보를 읽어온다.
	UsersDto dto=UsersDao.getInstane().getData(id);
%>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/">Home</a>
		</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/users/private/info.jsp">회원 개인 정보</a>
		</li>
		<li class="breadcrumb-item active">가입정보수정</li>
	</ul>
</nav>
	<form action="update.jsp">
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" id="id" value="<%=dto.getId() %>" disabled/>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control" type="text" id="email" name="email" value="<%=dto.getEmail() %>" />
		</div>
		<button class="btn btn-success" type="submit">수정확인</button>
		<button class="btn btn-danger" type="reset">취소</button>
	</form>
</div>
</body>
</html>