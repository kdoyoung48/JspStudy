<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String imagePath=request.getParameter("imagePath");
	String caption=request.getParameter("caption");
	
	String id=(String)session.getAttribute("id");
	
	GalleryDto dto=new GalleryDto();
	dto.setImagePath(imagePath);
	dto.setCaption(caption);
	dto.setWriter(id);
	
	GalleryDao.getInstance().insert(dto);
	
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/gallery/list.jsp");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>