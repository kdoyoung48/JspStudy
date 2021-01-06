<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test01.jsp</title>
</head>
<body>
	<h1>비동기 테스트</h1>
<script>
	//주어진 작업을 처리 하는 함수 (주어진 작업을 처리하는데 5초가 걸린다고 가정하자)
	/*function work(job,callback){
		setTimeout(function(){
			console.log(job+" 을(를) 수행 완료 했습니다.")
			callback();
		},5000);
	}
	work("달리기",function(){
		work("쉬기",function(){
			work("물마시기",function(){				
			});
		});
	});
	*/
	
	//1. Promise 객체를  생성해서 참조값을 p1
	let p1=new Promise(function(resolve){
		/*
		 	함수의 인자로 전달되는 resolve 와 reject는 함수이다.
		 	resolve 는 작업이 완료 했을 때 호출 해야하는 함수
		 	reject 는 작업이 실패 했을 때 호출 해야하는 함수
		*/
		resolve();
		console.log("resolve 함수를 호출 했습니다.");
	});
	//2. p1 Promise 가 resolve 되었을 때 호출되는 함수 등록
	p1.then(function(){
		console.log("then 안에 있는 함수가 호출 되었습니다.")
	});
	
	console.log("bye!");
</script>
</body>
</html>