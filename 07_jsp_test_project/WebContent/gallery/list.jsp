<%@page import="java.util.List"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=8;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//startRowNum 과 endRowNum  을 GalleryDto 객체에 담고
	GalleryDto dto=new GalleryDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//GalleryDao 객체를 이용해서 회원 목록을 얻어온다.
	List<GalleryDto> list=GalleryDao.getInstance().getList(dto);
	
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	
	//전체 row 의 갯수
	int totalRow=GalleryDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해 준다. 
	}
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/imgLiquid.js"></script>
<style>
	/* card 이미지 부모요소의 높이 지정 */
	.img-wrapper{
		height: 250px;
		/* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
		transition: transform 0.3s ease-out;
	}
	/* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
	.img-wrapper:hover{
		/* 원본 크기의 1.1 배로 확대 시키기*/
		transform: scale(1.05);
	}
	
	.card .card-text{
		/* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
		display:block;
		white-space : nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
	}
	
	/* img  가  가운데 정렬 되도록 */
	.back-drop{
		/* 일단 숨겨 놓는다. */
		display:none;
	
		/* 화면 전체를 투명도가 있는 회색으로 덮기 위한  css*/
		position: fixed;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		background-color: #cecece;
		padding-top: 300px;
		z-index: 10000;
		opacity: 0.5;
		text-align: center;
	}
	
	.back-drop img{
		width: 100px;
		/* rotateAnimation 이라는 키프레임을 2초 동한 일정한 비율로  무한 반복하기 */
		animation: rotateAnimation 2s ease-out infinite;
	}
	/* 회전하는 rotateAnimation 이라는 이름의 키프레임 정의하기 */
	@keyframes rotateAnimation{
		0%{
			transform: rotate(0deg);
		}
		100%{
			transform: rotate(360deg);
		}
	}
	#font_bold1{
		font-family: 'Shrikhand', cursive;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="gallery" name="thisPage"/>
</jsp:include>
<div class="container">
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/">Home</a>
		</li>
		<li class="breadcrumb-item active">gallerylist</li>
	</ul>
</nav>
	<a class="btn btn-outline-dark" id="font_bold1" href="private/upload_form.jsp">Pic upload..</a>
	<a class="btn btn-warning" id="font_bold1" href="private/ajax_form.jsp">Pic2 upload..</a>
	<div class="row" id="galleryList">
		<%for(GalleryDto tmp:list){ %>
			<div class="col-6 col-md-4 col-lg-3">
				<div class="cord mb-3">
					<a href="detail.jsp?num=<%=tmp.getNum()%>">
						<div class="img-wrapper">
							<img class="card-img-top" src="${pageContext.request.contextPath}<%=tmp.getImagePath() %>"  />
						</div>
					</a>
					<div class="card-body">
						<p class="card-text"><strong><%=tmp.getCaption() %></strong></p>
						<p class="card-text">by <%=tmp.getWriter() %></p>
						<p><small><%=tmp.getRegdate()%></small></p>
					</div>
				</div>
			</div>
		<%} %>
	</div>
</div>
<div class="back-drop">
	<img src="${pageContext.request.contextPath}/svg/spinner-solid.svg" />
</div>
<script>
	$(".img-wrapper").imgLiquid();
	
	//페이지 로딩 초기값
	let currentPage=1;
	
	//현재 페이지가 로딩중인지 여부
	let isLoading=false;
	
	//웹브라우저 창을 스크롤 호출된는 함수
	$(window).on("scroll",function(){
		console.log("scroll!");
		let scrollTop=$(window).scrollTop();
		let windowHeight=$(window).height();
		let documentHeight=$(document).height();
		//바닥까지 스크롤 되었는지 여부
		let isBottom=scrollTop+windowHeight+10>=documentHeight;
		if(isBottom){
			console.log("스크롤 바닥!!");
			if(currentPage==<%=totalPageCount%>||isLoading){
				return;
			}
			isLoading=true;
			
			$(".back-drop").show();
			currentPage++;
			$.ajax({
				url:"ajax_page.jsp",
				method:"GET",
				data:"pageNum="+currentPage,
				success:function(data){
					console.log(data);
					$("#galleryList").append(data);
					$(".back-drop").hide();
					$(".page"+currentPage).imgLiquid();
					isLoading=false;
				}				
			});
		}
	});	
</script>
</body>
</html>