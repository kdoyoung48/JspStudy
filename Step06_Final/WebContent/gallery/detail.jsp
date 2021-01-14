<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET방식 파라미터로 전달되는 자세히 보여줄 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	
	//2. 글 번호를 이용해서 DB에서 글 정보를 읽어온다.
	GalleryDto dto=GalleryDao.getInstance().getData(num);
	

	//3. 응답한다.
	
%>    
<!DOCTYPE html>
<html>
<head>
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
			<a href="${pageContext.request.contextPath}/gallery/list.jsp">글 목록</a>
		</li>
		<li class="breadcrumb-item active">글 상세 내용</li>
	</ul>
</nav>	
<div class="card mb-3">	
	<div class="img-wrapper">
			
			<img class="card-img-top" src="${pageContext.request.contextPath}/<%=dto.getImagePath() %>" />
		</div>
	<div class="card-body">	
		<p class="card-text"><strong><%=dto.getCaption() %></strong></p>
		<p class="card-text">by <%=dto.getWriter() %></p>
		<p><small><%=dto.getRegdate() %></small></p>
		<p><small><%=dto.getNum() %></small></p>
	</div>
</div>
	<%if(dto.getPrevNum()!=0){ %>
		<a href="detail.jsp?num=<%=dto.getPrevNum()%>">이전</a>
	<%} %>
	<%if(dto.getNextNum()!=0){ %>
		<a href="detail.jsp?num=<%=dto.getNextNum()%>">다음</a>
	<%} %>	
</div>	
</body>
</html>