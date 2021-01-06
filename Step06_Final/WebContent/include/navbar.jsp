<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPage=request.getParameter("thisPage");
	if(thisPage==null){
		thisPage="";
	}
%>
<nav class="navbar navbar-dark bg-success navbar-expand-sm">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/">
		<img style="height:50px" src="${pageContext.request.contextPath}/images/corn.png"/>
		Corn</a>
		<button class="navbar-toggler" data-toggle="collapse" data-target="#topNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="topNav">
			<ul class="navbar-nav">
				<li class="nav-itme" <%=thisPage.equals("users")?"active":"" %>>
					<a class="nav-link" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
				</li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-itme" <%=thisPage.equals("login")?"active":"" %>>
					<a class="nav-link" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
				</li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-itme" <%=thisPage.equals("cafe")?"active":"" %>>
					<a class="nav-link" href="${pageContext.request.contextPath}/cafe/list.jsp">카페 글 목록</a>
				</li>
			</ul>
		</div>
	</div>
</nav>