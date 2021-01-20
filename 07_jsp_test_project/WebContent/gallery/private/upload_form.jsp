<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/upload_form.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<style>
	label{
		font-family: 'Shrikhand', cursive;
	}
</style>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/">Home</a>
		</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/gallery/list.jsp">Gallery List</a>
		</li>
		<li class="breadcrumb-item active">pic upload form</li>
	</ul>
</nav>
<form action="upload.jsp" method="post" enctype="multipart/form-date">
	<div class="form-group">
		<label for="caption">caption</label>
		<input class="form-control" type="text" name="caption" id="caption" />
	</div>
	<div class="form-group">
		<label for="image">image</label>
		<input class="form-control" type="file" name="image" id="image"
			accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
	</div>
	<button class="btn btn-outline-dark" type="submit">업로드</button>
</form>
</div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>