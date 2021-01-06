<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.한글 깨지지 않도록 인코딩 설정
	request.setCharacterEncoding("utf-8");
	//2. 수정할 회원의 번호,이름,주소 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//3.MemberDto 객체에 수정할 회원의 정보를 담는다.
	MemberDto dto=new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	//4.DB에 수정 반영하기
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.update(dto);
	//5.응답하기
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.container{
		padding-top:100px;
	}
</style>
</head>
<body>
<div class="container">

</div>
	<%if(isSuccess){ %>
		<script>
			alert("<%=num%> 번 회원의 정보를 수정했습니다.");
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("회원 정보 수정실패");
			location.href="list.jsp";
		</script>
	<%} %>
</body>
</html>