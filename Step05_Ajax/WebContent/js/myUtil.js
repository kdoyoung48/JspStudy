/**
 * 
 */
//인자로 전달하는 object 를 이용해서 query 문자열을 만들어서 리턴해주는 함수를 만들어 보세요.
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