<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<style>
	label{
		font-family: 'Shrikhand', cursive;
	}
</style>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container ">
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/">Home</a>
		</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/file/list.jsp">file</a>
		</li>
		<li class="breadcrumb-item active">파일 업로드</li>
	</ul>	
</nav>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="title">title</label>
		<input class="form-group" type="text" name="title" id="title"/>
	</div>
	<div class="form-group">
		<label for="myFile">file</label>
		<input class="form-group" type="file" name="myFile" id="myFile"  />
	</div>
	<button class="btn btn-outline-dark" type="submit">업로드</button>
</form>
</div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>