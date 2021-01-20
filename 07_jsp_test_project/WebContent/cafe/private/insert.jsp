<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer=(String)session.getAttribute("id");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	CafeDto dto=new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess=CafeDao.getInstance().insert(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("새 글이 추가 되었습니다.");
			location.href="${pageContext.request.contextPath}/cafe/list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("새 글 추가 실패!")
			location.href="${pageContext.request.contextPath}/cafe/insertform.jsp";
		</script>
	<%} %>
</body>
</html>