<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//한글이 깨지지 않도록
	request.setCharacterEncoding("utf-8");
	//폼 전송되는 파라미터 추출
	String content=request.getParameter("content");
	//DB에 저장할 내용을 Dto 에 담는다
	TodoDto dto=new TodoDto();
	dto.setContent(content);
	//Dao를 이용해서 DB에 저장한다.
	boolean isSuccess=TodoDao.getInstance().insert(dto);
	//결과에 응답한다.
	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			//javascript 를 클라이언트에게 로딩시켜서 페이지 이동 시키기
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<p>할일 추가 실패  <a href="insertform.jsp">다시 작성</a></p>
	<%} %>

</body>
</html>