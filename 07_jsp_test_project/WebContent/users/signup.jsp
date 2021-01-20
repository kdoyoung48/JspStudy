<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	boolean isSuccess=UsersDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<style>
	#font_bold1{
		font-family: 'Shrikhand', cursive;
}
	#font_bold2{
		font-family: 'Noto Sans KR', sans-serif;
}
</style>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container" id="font_bold2">
	<h1 id="font_bold1">alarm</h1>
	<%if(isSuccess){ %>
		<p class="alert alert-success">
			<strong><%=id %></strong> 회원님이 가입 되었습니다.
			<a href="loginform.jsp">로그인 하러가기</a>
		</p>
	<%}else{ %>
		<p class="alert alert-danger">
			가입이 실패 했습니다.
		<a href="signup_form.jsp">다시 가입</a>
		</p>
	<%} %>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>