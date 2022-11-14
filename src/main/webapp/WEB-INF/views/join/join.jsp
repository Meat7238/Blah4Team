<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;800&display=swap');

.join {
	margin: auto;
	margin-top: 150px;
}

.logo, .submit {
	text-align: center;
}

.btn-dark {
	background-color: $gray-800;
}

.row {
	margin-bottom: 10px;
}

.btn {
	margin-top: 20px;
}

</style>


<title>블라블라 :: 회원가입</title>
</head>
<body>
		<form class="container join needs-validation" action="${root}joinAction" method="post" id="joinForm">
			<div class="row logo align-items-end justify-content-center">
				<div class="col-md-6 col-lg-4">
					<a href="${path}/"> 
						<img class="logo" src="${path}/resources/images/logo.png" alt="블라블라" width="auto" height="auto" margin="auto">
					</a>
				</div>
			</div>
			
			<div class="row align-items-start justify-content-center needs-validation">	
				<div class="col-md-6 col-lg-4">
					<label for="validationCustom01" class="form-label">아이디</label>
					<input type="text" name="user_id" class="form-control is-invalid" id="validationCustom01" placeholder="아이디" required>
					<div class="valid-feedback">사용 가능한 아이디입니다.</div>
					<div class="invalid-feedback">영문 소문자와 숫자를 조합해서 5글자 이상 12글자 이하로 입력해주세요</div>
				</div>
			</div>
			
			<div class="row align-items-end justify-content-center needs-validation">
				<div class="col-md-6 col-lg-4">
					<label for="validationCustom02" class="form-label">비밀번호</label> 
					<input type="password" name="user_password" class="form-control is-invalid" id="validationCustom02" placeholder="비밀번호" required>
    				<div class="valid-feedback">사용 가능한 비밀번호입니다.</div>
    				<div class="invalid-feedback">영문자와 숫자를 조합해서 8글자 이상 20글자 이하로 입력해주세요</div>
				</div>
			</div>
			<div class="row align-items-end justify-content-center needs-validation">
				<div class="col-md-6 col-lg-4">
					<label for="validationCustom02" class="form-label">비밀번호 확인</label>
					<input type="password" name="user_password2"  class="form-control is-invalid" id="validationCustom03" placeholder="비밀번호 확인" required>
					<div class="invalid-feedback">입력하신 비밀번호가 일치하지 않습니다.</div>
				</div>
			</div>
			<div class="row align-items-end justify-content-center needs-validation">
				<div class="col-md-6 col-lg-4">
					<label for="validationCustom03" class="form-label">이메일</label> 
					<input type="email" name="user_email" class="form-control is-invalid" id="validationCustom04" placeholder="회사 계정의 이메일 주소를 입력하세요" required>
    				<div class="invalid-feedback">유효한 이메일 주소를 입력해주세요.</div>
				</div>
			</div>
			<div class="row align-items-end justify-content-center needs-validation">
				<div class="col-md-6 col-lg-4">
					<label for="validationCustom05" class="form-label">직장</label>
					<input type="text"  name="user_workspace" class="form-control" id="validationCustom05" placeholder="직장" disabled required>
				</div>
			</div>
			<div class="row align-items-end justify-content-center needs-validation">
				<div class="col-md-3 col-lg-2">
					<label for="validationCustom06" class="form-label">직군</label>
					<select name="user_jobgroup" form="joinForm" class="form-select" id="validationCustom06" required>
  						<option selected disabled value="직군">직군</option>
  						<option value="홍보">홍보</option>
						<option value="회계">회계</option>
						<option value="세무">세무</option>
						<option value="마케팅">마케팅</option>
						<option value="기획">기획</option>
						<option value="영업">영업</option>
						<option value="판매">판매</option>
						<option value="생산">생산</option>
						<option value="기술">기술</option>
						<option value="IT">IT</option>
						<option value="디자인">디자인</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<div class="col-md-3 col-lg-2">
					<input class="form-control" id="excForm" type="text" placeholder="직접 입력" aria-label="Disabled input example" disabled>	
				</div>
			</div>
			<div class="row submit align-items-end justify-content-center needs-validation">
				<div class="col-md-6 col-lg-4">
					<button class="w-100 btn btn-lg btn-dark" type="submit" value="회원가입">회원가입</button>
				</div>
			</div>
		</form>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		<script type="text/javascript">



//id의 유효성 여부를 저장할 변수를 만들고 초기값 false 부여
let isIdValid=false;
//pwd의 유효성 여부(선택했는지여부)를 저장할 변수를 만들고 초기값 false 부여
let isPwdValid=false;
//email의 유효성 여부(선택했는지여부)를 저장할 변수를 만들고 초기값 false 부여
let isEmailValid=false;

// id 가 id인 input 이벤트가 일어났을때 실행할 함수 등록 
document.querySelector("#validationCustom01").addEventListener("input", function(){
   //1. 입력한 value 값을 읽어온다.
   let inputId= this.value;
   //2. 정규식 지정
   let idPattern = /^[a-z0-9]{5,12}$/;
   
   //3. 유효성을 검증한다.
   isIdValid = idPattern.test(inputId);
   console.log(isIdValid);
   //4. 유효하다면 input 요소에 is-valid 클래스 추가, 아니라면 is-invalid 클래스 추가
   if(isIdValid){
		this.classList.remove("is-invalid");
		this.classList.add("is-valid");
	}else{
		this.classList.remove("is-valid");
	    this.classList.add("is-invalid");
	}
});

let inputPwd="";
// 비밀번호 유효성 검사
document.querySelector("#validationCustom02").addEventListener("input", function(){
	//1. 입력한 value 값을 읽어온다.
	inputPwd=this.value;
	//2. 정규식 지정
	let pwdPattern = /^[A-Za-z0-9]{8,20}$/;
	   
	//3. 유효성을 검증한다.
	isPwdValid = pwdPattern.test(inputPwd);
	console.log(isPwdValid);
	//4. 유효하다면 input 요소에 is-valid 클래스 추가, 아니라면 is-invalid 클래스 추가
	if(isPwdValid){
		this.classList.remove("is-invalid");
		this.classList.add("is-valid");
	}else{
		this.classList.remove("is-valid");
	    this.classList.add("is-invalid");
	}
   
});

//비밀번호 확인
document.querySelector("#validationCustom03").addEventListener("input", function(){
	//1. 입력한 value 값을 읽어온다.
	let inputPwd2=this.value;
	   
	//3. 유효성을 검증한다.
	isPwdValid = (inputPwd2==inputPwd);
	console.log(isPwdValid);
	//4. 유효하다면 input 요소에 is-valid 클래스 추가, 아니라면 is-invalid 클래스 추가
	if(isPwdValid){
		this.classList.remove("is-invalid");
		this.classList.add("is-valid");
	}else{
		this.classList.remove("is-valid");
	    this.classList.add("is-invalid");
	}
   
});

// email 유효성 검사
document.querySelector("#validationCustom04").addEventListener("input", function(){
	//1. 입력한 value 값을 읽어온다.
	let inputEmail=this.value;
	//2. 정규식 지정
	let emailPattern = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/g;
	   
	//3. 유효성을 검증한다.
	isEmailValid = emailPattern.test(inputEmail);
	console.log(inputEmail);
	//4. 유효하다면 input 요소에 is-valid 클래스 추가, 아니라면 is-invalid 클래스 추가
	if(isEmailValid){
		this.classList.remove("is-invalid");
		this.classList.add("is-valid");
	}else{
		this.classList.remove("is-valid");
	    this.classList.add("is-invalid");
	}
});

//직장 자동 입력
document.querySelector("#validationCustom04").addEventListener("change", function(){
	//1. 입력한 value 값을 읽어온다.
	let autoInput=this.value;
	let googlePattern = /[a-z0-9]+@gmail.com/g;
	let naverPattern = /[a-z0-9]+@naver.com/g;
	   
	//3. 검증
	googleInput = googlePattern.test(autoInput);
	naverInput = naverPattern.test(autoInput);
	
	//4. 유효하다면 input 요소에 is-valid 클래스 추가, 아니라면 is-invalid 클래스 추가
	
	if(googleInput) {
		document.querySelector("#validationCustom05").removeAttribute( 'disabled' );
		document.querySelector("#validationCustom05").value = '구글';
	} else if(naverInput) {
		document.querySelector("#validationCustom05").removeAttribute( 'disabled' );
		document.querySelector("#validationCustom05").value = '네이버';
	} else {
		document.querySelector("#validationCustom05").setAttribute( 'readonly',  false);
	}
	
	
});

//select에 따라 disable처리
document.querySelector("#validationCustom06").addEventListener("change", function(){
	if(this.value=="기타") {
		document.querySelector("#excForm").removeAttribute( 'disabled' );
	} else {
		document.querySelector("#excForm").setAttribute( 'disabled',  false);
		document.querySelector("#excForm").value ='';
	}
})


//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록
document.querySelector("#joinForm").addEventListener("submit", function(e){
   //만일 폼이 유효하지 않는다면 전송을 막아주기
   if(!isIdValid || !isPwdValid || !isEmailValid){
      //이벤트 객체의 함수를 이용해서 폼 전송 막아주기 
      e.preventDefault();
   }
});

</script>
</body>

		
</html>










	







