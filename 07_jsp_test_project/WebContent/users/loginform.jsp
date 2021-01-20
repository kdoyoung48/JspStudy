<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url=request.getParameter("url");
	if(url==null){
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp";
	}
	
	String savedId="";
	String savedPwd="";
	Cookie[] cooks=request.getCookies();
	if(cooks!=null){
		for(Cookie tmp:cooks){
			String key=tmp.getName();
			if(key.equals("savedId")){
				savedId=tmp.getValue();
			}
			if(key.equals("savedPwd")){
				savedPwd=tmp.getValue();
			}
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<style>
	html,
	body {
		height: 100%;
	}
	
	body {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-align: center;
		align-items: center;
		padding-top: 40px;
		padding-bottom: 40px;   	    		
	}		
	.bg-image{
		position:absolute; 
		width:100%; 
		height:100%; 
		background-image: url('https://images.unsplash.com/photo-1488693161025-5f967b74de89?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1341&q=80');
		background-size: cover;
		background-attachment: fixed;
    	background-position: bottom;
		background-color:rgba(0, 0, 0, 0.5); 
		z-index: -1;
	}
	.form-signin {
		width: 100%;
		max-width: 330px;
		padding: 15px;
		margin: auto;
	}
	.form-signin .checkbox {
		font-weight: 400;
	}
	.form-signin .form-control {
		position: relative;
		box-sizing: border-box;
		height: auto;
		padding: 10px;
		font-size: 16px;
	}
	.form-signin .form-control:focus {
		z-index: 2;
	  
	}
	.form-signin input[type="email"] {
		margin-bottom: -1px;
		border-bottom-right-radius: 0;
		border-bottom-left-radius: 0;
	}
	.form-signin input[type="password"] {
		margin-bottom: 10px;
		border-top-left-radius: 0;
		border-top-right-radius: 0;
	}	
	#font_bold1{
		font-family: 'Shrikhand', cursive;
	}
	
	#font_bold2{
		font-family: 'Noto Sans KR', sans-serif;
	}
	div{
		color:orange;
	}
</style>
<body class="text-center">
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="bg-image"></div>
<div class="container" id="font_bold2" >
	<form class="form-signin" action="login.jsp" method="post">
		<input type="hidden" name="url" value="<%=url%>" />
		
		<h1 class="h3 mb-3 font-weight-nomal" id="font_bold1">Please sign in</h1>
		<label class="sr-only" for="inputEmail" >id</label>
		<input class="form-control" type="text" id="id" name="id"  
			placeholder="아이디 입력..." value="<%=savedId %>" required autofocus>
		
		<label class="sr-only" for="pwd" >password</label>
		<input class="form-control" type="password" id="pwd" name="pwd" 
			placeholder="비밀번호 입력..." value="<%=savedPwd %>" required>
		<div class="checkbox mb-3">
			<label>
				<input type="checkbox" name="isSave" value="yes" /> 로그인 정보 저장
			</label>
		</div>	
		<button class="btn btn-lg btn-outline-light btn-block" type="submit">Sign in</button>
		<p class="mt-5 mb-3" id="font_bold1" >© Home Sweet Home</p>
	</form>
</div>
</body>
</html>