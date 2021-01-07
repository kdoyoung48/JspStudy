<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/">Home</a>
		</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/file/list.jsp">자료실</a>
		</li>
		<li class="breadcrumb-item active">파일 업로드</li>
	</ul>	
</nav>
	<!-- 
		파일 업로드 폼 작성법
		1. method="post"
		2. enctype="multipart/form-data"
		3. <input type="file"/>
	 -->
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title" />
		</div>
		<div class="form-group">
			<label for="myFile">첨부파일</label>
			<input class="form-control" type="file" name="myFile" id="myFile" />
		</div>
		<button class="btn btn-success" type="submit">업로드</button>
	</form>
</div>
</body>
</html>