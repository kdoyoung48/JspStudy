<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<%
	//session scope에 "id" 라는 키값으로 저장된 문자열이 있는지 읽어와 본다.
	String id=(String)session.getAttribute("id");
%>
</head>
<style>
	#font_bold1{
		font-family: 'Shrikhand', cursive;
	}
	#font_bold2{
		font-family: 'Noto Sans KR', sans-serif;
	}
	#img_size{
  	width: 300px;
  	height: 600px;
  	object-fit: cover;
	}
</style>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container" id="font_bold2">

<%--만일 id가 null 이 아니면 로그인을 한 상태이다. --%>
<%if(id!=null){ %>
	<p>
		<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a> 님 로그인중...
		<a href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
	</p>
<%} %>
<h1 id="font_bold1">Index</h1>

<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
		<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
		<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img id="img_size" src="https://images.unsplash.com/photo-1586788224331-947f68671cf1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
				<h3 id="font_bold1">Text</h3>
				<p>Some representative placeholder content for the first slide.</p>
			</div>
		</div>
		<div class="carousel-item">
			<img id="img_size" src="https://images.unsplash.com/photo-1513593854556-94df5c54a8d6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
				<h3 id="font_bold1">File</h3>
				<p>Some representative placeholder content for the second slide.</p>
			</div>
		</div>
		<div class="carousel-item">
			<img id="img_size" src="https://images.unsplash.com/photo-1520714856721-93c409f8caaf?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1314&q=80" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
				<h3 id="font_bold1">Gallery</h3>
				<p>Some representative placeholder content for the third slide.</p>
			</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>	
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>