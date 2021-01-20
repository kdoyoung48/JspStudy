<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/ajax_form.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<form action="insert.jsp" method="post" id="insertForm">
		<input class="form-control" type="hidden" name="imagePath" id="imagePath" />	
		<div>
			<label for="caption">caption</label>
			<input class="form-control" type="text" name="caption" id="caption"/>
		</div>
	</form>
	<form action="ajax_upload.jsp" method="post" id="ajaxForm" enctype="multipart/form-data">
		<div>
			<label for="image">image</label>
			<input class="form-control" type="file" name="image" id="image" 
				accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		</div>		
	</form>
	<button id="submitBtn">등록</button>
	<div class="img-wrapper">
		<img />
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<script>
	$("#ajaxForm").ajaxForm(function(data){
		console.log(data);
		let src="${pageContext.request.contextPath}"+data.imagePath;
		$(".img-wrapper img").attr("src",src);
		$("#imagePath").val(data.imagePath);
	});
	
	//이미지를 선택하면 강제로 폼 전송
	$("#image").on("change",function(){
		$("#ajaxForm").submit();			
	});
	//버튼을 누르면 강제 제출 이미지 정보가 저장
	$("#submitBtn").on("click",function(){
		$("#insertForm").submit();
	});
</script>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>