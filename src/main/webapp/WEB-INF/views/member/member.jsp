<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;800&display=swap')
	;
.container, .container-md, .container-sm{
	max-width: 2500px;
}
.info {
	margin: 20px auto;
	
}

.btn-dark {
	background-color: $gray-800;
}

.row {
	margin-bottom: 10px;
}

.btn {
	margin: 20px auto;
}

</style>
<title>블라블라 :: <sec:authentication property="principal.username"/>의 마이페이지</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<div class="wrapper">
		
		<form class="container main-content info" action="${root}member-edit" method="post">
		<div class="row justify-content-center">
		<div class="col-lg-6">
			<ul class="nav">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="#">회원정보 수정</a>
				</li>
				<!-- <li class="nav-item">
					<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">내가 쓴 게시글</a>
				</li> -->
			</ul>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<label class="form-label">아이디</label> 
				<input type="text" name="user_id" class="form-control" value='${user_id}' readonly="readonly"><br>
			</div> 
		</div>
		<div class="row justify-content-center needs-validation">
			<div class="col-lg-6">
				<label class="form-label">비밀번호</label>
				<input type="password" name="user_password"  id="validationCustom02"  class="form-control" placeholder="비밀번호"><br>
    			<div class="valid-feedback">사용 가능한 비밀번호입니다.</div>
    			<div class="invalid-feedback">영문자와 숫자를 조합해서 8글자 이상 20글자 이하로 입력해주세요</div>
			</div>
		</div>
		<div class="row justify-content-center needs-validation">
			<div class="col-lg-6">
				<label class="form-label">비밀번호 확인</label>
				<input type="password" name="user_password2" id="validationCustom03" class="form-control" placeholder="비밀번호 확인"> <br>
				<div class="invalid-feedback">입력하신 비밀번호가 일치하지 않습니다.</div>
				<div class="valid-feedback">사용 가능한 비밀번호입니다.</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<label class="form-label">이메일</label>
				<input type="text" name="user_email" class="form-control" value='${user_email}' readonly="readonly"><br>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<label class="form-label">직장</label>
				<input type="text" name="user_workspace" class="form-control" value='${user_workspace}' readonly="readonly"> <br>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<label class="form-label">직군</label>
				<input type="text" name="user_jobgroup" class="form-control" value='${user_jobgroup}' readonly="readonly"><br>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<button class="w-100 btn btn-lg btn-dark" type="submit" value="수정">회원 정보 수정</button>
			</div>
		</div>
	</form>
</div>

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
<script type="text/javascript">


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


</script>

</html>


