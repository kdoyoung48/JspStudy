<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	FileDto dto=FileDao.getInstance().getData(num);
	
	String orgFileName=dto.getOrgFileName();
	String saveFileName=dto.getSaveFileName();
	//다운로드 시켜줄 경로구성
	String path=request.getServletContext().getRealPath("/upload")+File.separator+saveFileName;
	FileInputStream fis=new FileInputStream(path);
	String encodedName=null;
	System.out.println(request.getHeader("User-Agent"));
	if(request.getHeader("User-Agent").contains("Fifefox")){
		encodedName=new String(orgFileName.getBytes("utf-8"),"ISO-8859-1");
	}else{
		encodedName=URLEncoder.encode(orgFileName,"utf-8");
		encodedName=encodedName.replaceAll("\\+", "");
	}
	//응답 헤더 정보 설정
	response.setHeader("Content-Disposition","attachment;filename="+encodedName);
	response.setHeader("Content-Transfer-Encoding", "binary");
	
	//다운로드할 파일의 크기 읽어와서 다운로드할 파일의 크기 설정
	response.setContentLengthLong(dto.getFileSize());
	
	//클라이언트에게 출력할수 있는 스트림 객체 얻어오기
	BufferedOutputStream bos=
		new BufferedOutputStream(response.getOutputStream());
	//한번에 최대 1M byte 씩 읽어올수 있는 버퍼
	byte[] buffer=new byte[1024*1024];
	int readedByte=0;
	//반복문 돌면서 출력
	while(true){
		//byte[] 객체를 이용해서 파일에서 byte 알갱이 읽어오기
		readedByte = fis.read(buffer);
		if(readedByte == -1)break; //더이상 읽을 데이터가 없다면 반복문 빠져 나오기
		//읽은 만큼 출력하기
		bos.write(buffer, 0, readedByte);
		bos.flush(); //출력
	}
	//FileInputStream 닫아주기 
	fis.close();	
%>    
