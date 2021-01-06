<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/ajax07.jsp</title>
</head>
<body>
	<h1>ajax POST 전송 예제</h1>
	<input type="text" id="inputName" placeholder="이름 입력..." />
	<input type="text" id="inputAddr" placeholder="주소 입력..."/>
	<button id="sendBtn">전송</button>
	<!-- 외부 javascript 로딩 -->
	<script src="${pageContext.request.contextPath}/js/myUtil.js"></script>	
	<script>
	function toQueryString(obj){
		//빈배열을 일단 만든다.
		let arr=[];
		//반복문을 돌면서 obj 에 있는 정보를 "key=value" 형태로 만들어서 배열에 저장한다.
		for(let key in obj){
			let tmp=key+"="+encodeURIComponent(obj[key]);
			arr.push(tmp);
		}
		//query 문자열을 얻어낸다
		let queryString=arr.join("&");
		//결과를 리턴해준다.
		return queryString;
	}
	
	//ajax 요청을 Promise 객체를 리턴 해 주는 함수
	function ajaxPromise(url,method,data){
		//만일 필요한 값이 전달 되지 않으면 기본값을 
		if(method==undefined || method==null){
			method="GET";
		}
		if(data==undefined || data==null){
			data={};
		}
		//Promise 객체를 담을 변수 만들기
		let promise;
		if(method=="GET"){//만일 GET 방식 전송이면
			//fetch() 함수
			priomise=fetch(url+"?"+toQueryString(data));
		}else if(method=="POST"){
			promise=fetch(url,{
				method:"POST",
				headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
				body:toQueryString(data)
			});
		}
		return promise;
	}
		//id myForm 인 곳에 submit 이벤트가 일어 났을 때 실행되는 함수 등록
		document.querySelector("#sendBtn")
		.addEventListener("click",function(){
			//입력한 문자열 읽어오기
			let name=document.querySelector("#inputName").value;
			let addr=document.querySelector("#inputAddr").value;
			
			//입력한 문자열을 object 에 담는다
			let obj={name:name, addr:addr};
			//유틸리티 함수를 이용해서 ajax 요청을 하고 Promise 를 리턴 받는다.
			ajaxPromise("add.jsp","POST",obj)
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			});
			
			
		});		
	</script>
</body>
</html>