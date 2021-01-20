<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
<style>
	/*프로필 이미지를 작은 원형으로 만든다*/
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius:50%;
	}
	/* 프로필 업로드 폼을 화면에 안보이게 숨긴다*/
	#profileForm{
		display:none;
	}
	#font_bold1{
		font-family: 'Shrikhand', cursive;
	}
	#font_bold2{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	UsersDto dto=UsersDao.getInstance().getData(id);
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
	<a id="profileLink" href="javascript:">
	<%if(dto.getProfile()==null){ %>
		<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
		</svg>
	<%}else{ %>
		<img src="${pageContext.request.contextPath}<%=dto.getProfile()%>" id="profileImage"  />
	<%} %>
	</a>
	<form action="update.jsp">
		<div class="form-group">
			<label id="font_bold1" for="id">id</label>
			<input class="form-control" type="text" id="id"  value="<%=dto.getId() %>" disabled/>
		</div>
		<div class="form-group">
			<label id="font_bold1" for="email">e-mail</label>
			<input class="form-control" type="text" id="email" name="email" value="<%=dto.getEmail() %>" />
		</div>
	</form>	
	<form action="profile_upload.jsp" method="post" enctype="multipart/form-data" id="profileForm">
		<label for="image">프로필 이미지 선택</label>
		<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG" />
		<button type="submit">upload</button>
	</form>
</div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
<script>
	//프로필 링크를 클릭했을때 실행할 함수 등록
	$("#profileLink").on("click",function(){
		$("#image").click();
	});
	//이미지를 실행했을때 실행할 함수 등록
	$("#image").on("change",function(){
		$("#profileForm").submit();
	});
</script>
</body>
</html>