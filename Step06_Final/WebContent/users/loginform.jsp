<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/">Home</a>
		</li>
		<li class="breadcrumb-item">로그인</li>
	</ul>
</nav>
	<form action="login.jsp" method="post">
		<div class="form group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" name="id" id="id" />
		</div>
		<div class="form group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="text" name="pwd" id="pwd" />
			<button class="btn btn-success" type="submit">로그인</button>
		</div>
	</form>
</div>
</body>
</html>