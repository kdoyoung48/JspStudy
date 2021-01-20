<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session 영역아이디불러오기
	String id=(String)session.getAttribute("id");
	//DB가입정보 불러오기
	UsersDto dto=UsersDao.getInstance().getData(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<style>
	/*프로필 이미지를 작은 원형으로 만든다*/
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius:50%;
	}
	
	#font_bold1{
		font-family: 'Shrikhand', cursive;
	}
	#font_bold2{
		font-family: 'Noto Sans KR', sans-serif;
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
		<li class="breadcrumb-item active">회원 개인 정보</li>
	</ul>
</nav>
<table class="table">
	<tr>
		<th id="font_bold1">id</th>
		<td><%=dto.getId() %></td>
	</tr>
	<tr>
		<th id="font_bold1">profile</th>
		<td>
			<%if(dto.getProfile() == null){ %>
				<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
		  			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
				</svg>
			<%}else{ %>
				<img src="${pageContext.request.contextPath }<%=dto.getProfile() %>" 
					id="profileImage"/>
			<%} %>
		</td>
	</tr>
	<tr>
		<th id="font_bold1">password</th>
		<td><a href="pwd_updateform.jsp">수정하기</a></td>
	</tr>
	<tr>
		<th id="font_bold1">e-mail</th>
		<td><%=dto.getEmail() %></td>
	</tr>
	<tr>
		<th id="font_bold1">Joined</th>
		<td><%=dto.getRegdate() %></td>
	</tr>	
</table>	
     	<div class="col-3">  
     	<a class="btn btn-dark btn-sm" href="updateform.jsp">회원정보수정</a>
		<a class="btn btn-light btn-sm" href="javascript:deleteConfirm()">탈퇴</a></div>
			
</div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
<script>
	function deleteConfirm(){
		let isDelete=confirm("<%=id%> 회원님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
	
</script>
</body>
</html>