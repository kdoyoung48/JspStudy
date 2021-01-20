<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Tomcat 서버를 실행했을때 WebContent/upload 폴더의 실제 경로 얻어오기
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
	
	//업로드된 이미지의 원본 파일명
	String orgFileName=mr.getOriginalFileName("image");
	//upload 폴더에 실제 저장된 파일명
	String saveFileName=mr.getFilesystemName("image");
			
	//로그인된 아이디
	String id=(String)session.getAttribute("id");
	String profile="/upload/"+saveFileName;
	
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setProfile(profile);
	
	//DB반영
	UsersDao.getInstance().updateProfile(dto);
	//개인정보수정 페이지로 리다이렉트
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/users/private/updateform.jsp");
%>