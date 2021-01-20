<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	CafeDto dto=CafeDao.getInstance().getData(num);
	CafeDao.getInstance().addViewCount(num);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<style>
	th{
		font-family: 'Shrikhand', cursive;
	}
</style>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="cafe" name="thisPage"/>
</jsp:include>
<div class="container">
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/">Home</a>
		</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/cafe/list.jsp">글목록</a>
		</li>
		<li class="breadcrumb-item active">글 상세 내용</li>
	</ul>
</nav>
<table class="table table-borderd">
	<tr>
		<th>num</th>
		<td><%=dto.getNum() %></td>
	</tr>
	<tr>
		<th>writer</th>
		<td><%=dto.getWriter() %></td>
	</tr>
	<tr>
		<th>title</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<th>view</th>
		<td><%=dto.getViewCount() %></td>
	</tr>
	<tr>
		<th>date</th>
		<td><%=dto.getRegdate() %></td>
	</tr>
	
</table>
<%
	String id=(String)session.getAttribute("id");
%>
	<div class="row justify-content-center">
		<a class="btn btn-outline-dark" href="list.jsp">목록보기</a>
		<%if(dto.getWriter().equals(id)){ %>
			<a class="btn btn-outline-dark" href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
			<a class="btn btn-dark"href="javascript:deleteConfirm()">삭제</a>
		<%} %>
	</div>
		
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script>
	function deleteConfirm(){
		let isDelete=confirm("글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num=<%=dto.getNum()%>";
		}
	}
</script>
</body>
</html>