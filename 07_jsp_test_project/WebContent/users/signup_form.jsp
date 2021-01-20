<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<style>
	#font_bold{
		font-family: 'Noto Sans KR', sans-serif;
	}	
</style>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container" id="font_bold">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/">Home</a>
			</li>
			<li class="breadcrumb-item active">sign in form</li>
		</ul>
	</nav>
	<form action="signup.jsp" method="post" id="myForm" novalidate>
		<div class="form-group">
			<label for="">아이디</label>
			<input class="form-control" type="text" name="id" id="id"/>
			<small class="form-text text muted">영문자 소문자로 시작하고 5~20글자 이내로 입력하세요.</small>
			<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
			<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd" />
			<small class="form-text text muted">비밀번호는 5~10글자 이내로 입력 하세요.</small>
			<div class="invalid-feedback"></div>
		</div>
		<div class="form-group">
			<label for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" id="pwd2"/>
			<small class="form-text text muted">비밀번호를 다시 한번 더 입력 해 주세요.</small>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control" type="email" name="email" id="email" />
			<div class="invalid-feedback">형식에 맞는 이메일을 입력해주세요.</div>
		</div>
		<div class="row  justify-content-center">
			<button class="btn btn-outline-danger" id="font_bold">create account</button>
		</div>		
	</form>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script>
	//아이디,비밀번호, 이메일 정규 표현식
	let reg_id=/^[a-z].{4,9}/; //영문자 소문자로 시작하고 5~10글자 이내 검증
	let reg_pwd=/^.{5,10}/;
	let reg_email=/@/;
	
	let isIdValid=false;
	let isIdPwdValid=false;
	let isEmailValid=false;
	let isFormValid=false;
	
	//폼을 전송했을 때 실행할 함수
	$("#myForm").on("submit",function(){
		isFormValid=isIdValid && isPwdValid && isEmailValid;
		if(!isFormValid){
			return false; //폼 전송 막기
		}
	});
	
	//이메일 입력했을 때 실행할 함수
	$("#email").on("input",function(){
		let inputEmail=$("#email").val();
		//모든 검증 클래스 제거
		$("#email").removeClass("is-valid is-invalid");
		//만일 정규표현식이 매칭 되지 않는다면
		if(!reg_email.test(inputEmail)){
			isEmailValid=false;
			$("#email").addClass("is-invalid");
		}else{
			isEmailValid=true;
			$("#email").addClass("is-valid");
		}
	});
	
	// id 가 pwd 와  pwd2 인 요소에 input(입력) 이벤트가 일어 났을때 실행할 함수 등록
	$("#pwd,#pwd2").on("input",function(){
		let pwd=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		//모든 검증 클래스 제거
		$("#pwd").removeClass("is-valid is-invalid");
		
		//만일 비밀번호를 4글자 이상 입력하지 않았다면
		if(!reg_pwd.test(pwd)){
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
			return;
		}
		//두 비밀번호가 같은지 확인
		if(pwd==pwd2){
			$("#pwd").addClass("is-valid");
			isPwdValid=true;
		}else{
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
		}
	});
	
	//아이디 입력란에 입력했을때 시행할 함수
	$("#id").on("input",function(){
		let inputId=$("#id").val();
		$("#id").removeClass("is-valid is-invalid");
		
		if(!reg_id.test(inputId)){
			$("#id").addClass("is-invalid");
			isIdValid=false;
			return;
		}
		$.ajax({
			url:"checkid.jsp",
			method:"GET",
			data:"inputId="+inputId,
			success:function(responseData){
				console.log(responseData);
				if(responseData.isExist){
					$("#id").addClass("id-invalid");
				}else{
					$("#id").addClass("is-valid");
					isIdValid=true;
				}
			}
			
		});
	});
</script>
</body>
</html>