<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPage=request.getParameter("thisPage");
	if(thisPage==null){
		thisPage="";
	}
%>
<nav class="navbar navbar-light bg-light navbar-expand-sm fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/">
		<img style="height:35px" src="${pageContext.request.contextPath}/image2/macaron_blue.png"/>
		Home</a>
		<button class="navbar-toggler" data-toggle="collapse" data-target="#topNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="topNav">
			<ul class="navbar-nav">
				<li class="nav-item <%=thisPage.equals("cafe")?"active":"" %>">
					<a  class="nav-link" href="${pageContext.request.contextPath}/cafe/list.jsp">text</a>					
				</li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item <%=thisPage.equals("file")?"active":"" %>">
					<a  class="nav-link" href="${pageContext.request.contextPath}/file/list.jsp">file</a>					
				</li>
			</ul>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item <%=thisPage.equals("gallery")?"active":""%>">
					<a class="nav-link" href="${pageContext.request.contextPath}/gallery/list.jsp">gallery</a>
				</li>
			</ul>
			<%
				String id=(String)session.getAttribute("id");
			%>
			<%if(id==null){ %>
				<a class="btn btn-dark btn-sm" href="${pageContext.request.contextPath}/users/loginform.jsp">login</a>
				<a class="btn btn-light btn-sm ml-1" href="${pageContext.request.contextPath}/users/signup_form.jsp">sign in</a>
			<%}else{ %>
				<span class="navbar-text">
					<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a>
					<a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/users/logout.jsp"> logout</a>
				</span>
			<%} %>
		</div>
	</div>
</nav>