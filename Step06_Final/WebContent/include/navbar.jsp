<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPage=request.getParameter("thisPage");
	if(thisPage==null){
		thisPage="";
	}
%>
<nav class="navbar navbar-dark bg-success navbar-expand-sm fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/">
		<img style="height:35px" src="${pageContext.request.contextPath}/images/corn.png"/>
		Corn</a>
		<button class="navbar-toggler" data-toggle="collapse" data-target="#topNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="topNav">	
			<ul class="navbar-nav">
				<li class="nav-itme <%=thisPage.equals("cafe")?"active":"" %>">
					<a class="nav-link" href="${pageContext.request.contextPath}/cafe/list.jsp">카페 글</a>
				</li>
			</ul>
			<ul class="navbar-nav mr-auto">
				<li class="nav-itme <%=thisPage.equals("file")?"active":"" %>">
					<a class="nav-link" href="${pageContext.request.contextPath}/file/list.jsp">자료실</a>
				</li>
			</ul>
			<%
				//로그인 된 아이디가 있는지 읽어와 본다.
				String id=(String)session.getAttribute("id");
			%>
			<%if(id==null){ %>
				<a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
				<a class="btn btn-warning btn-sm ml-1" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
			<%}else{ %>
				<span class="navbar-text">
					<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a>
					<a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
				</span>
			<%} %>	
		</div>				
	</div>
</nav>