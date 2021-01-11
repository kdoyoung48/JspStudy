<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/">Home</a>
		</li>
		<li class="breadcrumb-item active">회원가입 폼</li>
	</ul>
</nav>
	<form action="signup.jsp" method="post" id="myForm">
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" name="id" id="id"/>
			<small class="form-text text muted">아이디는 4글자 이상 입력 해야 합니다.</small>
			<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
			<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd"/>
			<small class="form-text text muted">비밀번호는 4글자 이상 입력해야 합니다.</small>
			<div class="invalid-feedback">비밀번호를 확인 하세요</div>
		</div>
		<div class="form-group">
			<label for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password"  id="pwd2"/>
			<small class="form-text text muted">비밀번호를 다시 한번 더 입력해 주세요</small>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control" type="email" name="email" id="email" />
			<small class="form-text text muted">사용 가능한 이메일 주소를 입력해 주세요</small>
		</div>
		<button class="btn btn-outline-success" type="submit">가입</button>
	</form>
</div>
<script>
	//폼에 submit 이벤트가 일어 났을때 jquery 를 활용해서 폼에 입력한 내용 검증하기
	<%--document.querySelector("#myForm").addEventListener("submit",function(){}); --%>
	
	//아이디 유효성 여부를 관리할 변수를 만들고 초기값 부여하기
	let isIdValid=false;
	//비밀번호 유효성 여부를 관리할 변수를 만들고 초기값 부여하기
	let isPwdValid=false;
	
	//id가 myForm 인 요소에 submit 이벤트가 일어 났을때 실행할 함수 등록	
	//id가 myForm 인 요소에 submit 이벤트가 일어 났을 때 실행할 함수 등록
	$("#myForm").on("submit",function(){
		//만일 아이디를 제대로 입력하지 않았으면 폼 전송을 막는다.	
		if(!isIdValid){
			return false;
		}
		if(!isPwdValid){
			return false;
		}
	});
	
	//id가 pwd와 pwd2
	$("#pwd,#pwd2").on("input",function(){
		//input 이벤트가 언제 일어나는지 확인 요망!
		//console.log("input!!");
		
		//입력한 두 비밀번호를 읽어온다.
		let pwd=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		//일단 모든 검증 클래스를 제거하고
		$("#pwd").removeClass("is-valid is-invalid");		
		
		//만일 비밀번호 4글자 이상 입력하지 않았다면
		if(pwd.length<4){
			//비밀번호가 유효하지 않는다고 표시하고
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
			//함수를 여기서 종료
			return;
		}
		//두 비밀번호가 같은지 확인해서
		if(pwd==pwd2){//만일 같으면
			$("#pwd").addClass("is-valid");
			isPwdValid=true;
		}else{//다르면
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
		}
	});	
	//아이디 입력란에 입력했을때 시행할 함수 등록
	$("#id").on("input",function(){
		//1.입력한 아이디를 읽어와서
		let inputId=$("#id").val();
		//2.서버에 ajax 요청으로 보내서 사용 가능 여부를 응답 받아서 반응을 보여준다.
		// 일단 모든 검증 클래스를 제거하고
		$("#id").removeClass("is-valid is-invalid");
		
		//입력한 문자열의 길이를 얻어낸다.
		let length=inputId.length;
		if(length<4){
			//아이디가 유효하지 않다고 표시하고
			$(id).addClass("is-invalid");
			isIdValid=false;
			//함수를 여기서 종료 한다.
			return;
		}
		$.ajax({
			url:"checkid.jsp",
			method:"GET",
			data:"inputId="+inputId,
			success:function(responseData){	
				/*
					checkid.jsp 페이지에서 응답할때
					contextType="application/json" 이라고 설정하면
					함수의 인자로 전달되는 responseData는 Object 이다.
					{isExist:ture} or {isExist:false}
					형식의 object 이기 때문에 바로 사용할 수 있다.
				*/
				console.log(responseData);
				if(responseData.isExist){//이미 존재하는 아이디
					$("#id").addClass("is-invalid");
					isIdValid=false;
				}else{//존재하지 않는 아이디 즉 사용가능한 아이디인 경우
					$("#id").addClass("is-valid");
					//아이디가 유효 하다고 표시한다.
					isIdValid=true;
				}
			}
		});		
	});
</script>
</body>
</html>