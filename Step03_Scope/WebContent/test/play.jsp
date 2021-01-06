<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//session scope dp "nick" 이라는 키값으로 저장된 String type 읽어오기
		String nick=(String)session.getAttribute("nick");
	%>
	<h1>play.jsp 페이지 입니다.</h1>
	<%if(nick==null){ %>
		<p>session 영역에 "nick" 이라는 키값을 저장된 값이 없습니다.</p>
	<%}else{ %>
		<strong><%=nick %></strong> 님 놀러 오셨네요?
		<a href="delete.jsp">세션에 저장된 nick 삭제하기</a>
	<%} %>
	<a href="../index.jsp">인덱스로 가기</a>


</body>
</html>