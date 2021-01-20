<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#font_bold1{
		font-family: 'Shrikhand', cursive;
	}
	#font_bold2{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<jsp:include page="../../include/navbar.jsp"></jsp:include>

<body>
<div class="container">
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/">Home</a>
		</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/users/private/info.jsp">회원 개인 정보</a>
		</li>
		<li class="breadcrumb-item active">비밀번호 수정</li>
	</ul>
</nav>	

<form action="pwd_update.jsp" method="post" id="myForm">
	<div class="form-group">
		<label id="font_bold1" for="pwd">password</label>
		<input class="form-control" type="password" name="pwd" id="pwd" />
	</div>
	<div class="form-group">
		<label id="font_bold1" for="newpwd">New password</label>
		<input class="form-control" type="password" name="newPwd" id="newPwd" />
	</div>
	<div class="form-group">
		<label id="font_bold1" for="newpwd2">New password (Confirm)</label>
		<input class="form-control" type="password" id="newPwd2" />
	</div>
	<button class="btn btn-dark" type="submit">수정하기</button>
	<button class="btn btn-light" type="reset">리셋</button>
</form>
</div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
<script>
	$("#myForm").on("submit",function(){
		let pwd1=$("#newPwd").val;
		let pwd2=$("#newPwd2").val;
		if(pwd1!=pwd2){
			alert("비밀번호를 확인하세요!");
			evanet.preventDefault();
		}
	});
</script>
</body>
</html>