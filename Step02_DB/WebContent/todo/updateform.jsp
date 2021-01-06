<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	TodoDto dto=TodoDao.getInstance().getDate(num);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/todo/list.jsp">할일목록</a>
			</li>
			<li class="breadcrumb-item active">할일수정 폼</li>
		</ul>
	</nav>
<form action="update.jsp" method="post">
	<div class="form-group">
		<label for="num">번호</label>
		<input class="form-control" type="hidden" name="num" value="<%=dto.getNum()%>"/>
		<input class="form-control" type="text" name="num" value="<%=dto.getNum()%>"disabled/>
	</div>
	<div class="form-group">
		<label for="content">할일</label>		
		<input class="form-control" type="text" id="content" name="content" value="<%=dto.getContent()%>"/>
		<small class="form-text text-muted">수정할 이름을 입력하세요</small>
	</div>
	<div class="form-group">
		<label for="regdate">등록일</label>
		<input class="form-control" type="text" id="regdate" name="regdate" value="<%=dto.getRegdate()%>" disabled/>
		<small class="form-text text-muted">수정할 주소를 입력하세요</small>
	</div>
	<button class="btn btn-success" type="submit">수정</button>
	<button class="btn btn-danger" type="reset">취소</button>

<%--
	<form action="update.jsp" method="post">
	<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
	<label for="num">번호</label>
	<input type="text" id="num" value="" disabled/><br />
	<label for="content">할일</label>
	<input type="text" name="content" id="content" value="<%=dto.getContent()%>"/><br />
	<label for="regdate">등록일</label>
	<input type="text" id="regdate" value="<%=dto.getRegdate()%>" disabled /><br />
	<button type="submit">수정 확인</button>
	<button type="reset">취소</button>
--%>		

</form>
</div>
</body>
</html>