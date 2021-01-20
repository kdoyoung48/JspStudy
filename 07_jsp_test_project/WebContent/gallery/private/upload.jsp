<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String realPath=application.getRealPath("/upload");
	System.out.println("realPath:"+realPath);
	
	
	File f=new File(realPath);
	if(!f.exists()){
		f.mkdir();
	}
	
	int sizeLimit=1024*1024*5;
	
	MultipartRequest mr=new MultipartRequest(request,
			realPath,
			sizeLimit,
			"utf-8",
			new DefaultFileRenamePolicy());
	
	String caption=mr.getParameter("caption");
	String orgFileName=mr.getParameter("image");
	String saveFileName=mr.getParameter("image");
	
	String writer=(String)session.getAttribute("id");
	GalleryDto dto=new GalleryDto();
	dto.setWriter(writer);
	dto.setCaption(caption);
	dto.setImagePath("/upload/"+saveFileName);
	
	GalleryDao.getInstance().insert(dto);
	
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/gallery/list.jsp");
%>    