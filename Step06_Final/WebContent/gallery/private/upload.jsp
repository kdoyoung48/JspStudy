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
	int sizeLimit=1024*1024*50;
	
	MultipartRequest mr=new MultipartRequest(request,
			realPath,
			sizeLimit,
			"utf-8",
			new DefaultFileRenamePolicy());
	
	//이미지 설명
	String caption=mr.getParameter("caption");
	//원본 파일명
	String orgFileName=mr.getOriginalFileName("image");
	//upload 폴더에 저장된 파일명
	String saveFileName=mr.getFilesystemName("image");
	//업로드한 클라이언트의 아이디	
	String writer=(String)session.getAttribute("id");
	//업로드된 파일 정보를 GalleryDto 에 담아서
	GalleryDto dto=new GalleryDto();
	dto.setWriter(writer);
	dto.setCaption(caption);
	dto.setImagePath("/upload/"+saveFileName);
	//DB에 저장
	GalleryDao.getInstance().insert(dto);
	//목록보기 리다일렉트 이동 응답
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/gallery/list.jsp");
	
%>