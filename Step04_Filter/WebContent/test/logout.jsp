<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	//1. 세션 영역에 "id" 키값으로 저장된 값을 삭제한다.
	session.removeAttribute("id");
	//2. 응답하기(특정페이지(index.jsp)로 요청을 다시 하라고 리다이렉트 응답)
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/index.jsp");
	
	
%>
<title>/test/logout.jsp</title>
</head>
<body>

</body>
</html>