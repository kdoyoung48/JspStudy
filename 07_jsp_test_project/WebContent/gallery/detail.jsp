<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	GalleryDto dto=GalleryDao.getInstance().getData(num);
%>    
<!DOCTYPE html>
<html>
<head>
<style>
	#font_bold1{
		font-family: 'Shrikhand', cursive;
	
	}
	#img_size{
  	width: 300px;
  	height: 600px;
  	object-fit: cover;
	}
</style>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="gallery" name="thisPage"/>
</jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/gallery/list.jsp">Gallery List</a>
			</li>
			<li class="breadcrumb-item active">Gallery Detail</li>
		</ul>
	</nav>
	<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">		
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img id="img_size" src="${pageContext.request.contextPath}/<%=dto.getImagePath() %>" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h3 id="font_bold1"><%=dto.getCaption() %></h3>
					<p><%=dto.getWriter() %></p>
					<p><small><%=dto.getRegdate() %></small></p>
					<p><small><%=dto.getNum() %></small></p>
				</div>
			</div>
		</div>
	<%if(dto.getPrevNum()!=0){ %> 	
	<a class="carousel-control-prev" href="detail.jsp?num=<%=dto.getPrevNum()%>" role="button" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
  	</a>
  	<%} %>
  	<%if(dto.getNextNum()!=0){ %> 
  	<a class="carousel-control-next" href="detail.jsp?num=<%=dto.getNextNum()%>" role="button" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	 </a>
	 <%} %>
	</div>
	
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>