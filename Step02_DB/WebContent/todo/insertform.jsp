<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="../css/bootstrap.css" />
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
		<li class="breadcrumb-item active">할일추가 폼</li>
	</ul>
</nav>
	
<form action="${pageContext.request.contextPath}/todo/insert.jsp" method="post">
	<div class="form-group">
		<label for="content">할일</label>
		<input class="form-control" type="text" name="content" id="content" />
		<small class="form-text text-muted">추가로 할일을 적으세요</small>
	</div>
	<button class="btn btn-success" type="submit">추가</button>

<%-- 
	<label for="content">할일</label>
	<input type="text" name="content" id="content" />
	<button type="submit">추가</button>
--%>
</form>
</div>
</body>
</html>