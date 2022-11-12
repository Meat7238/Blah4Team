<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원가입</title>
</head>
<body>
	<div>
		<h2>회원가입</h2>
	</div>
	<div>
		<form action="${root}joinAction" method="post" id="joinForm">
			<div>
				<div>
					<label for="validationServer01" class="form-label">아이디</label>
					<input name="user_id">
				</div>
				<div>
					<label for="validationServer02" class="form-label">비밀번호</label> 
					<input type="password" name="user_password">
				</div>
				<div>
					<label for="validationServer02" class="form-label">비밀번호 확인</label>
					<input type="password" name="user_password2">
				</div>
				<div>
					 <label for="validationServerUsername" class="form-label">이메일</label> 
					<input type="email" name="user_email">
				</div>
				<div>
					<label for="validationServer03" class="form-label">직군</label>
					<input name="user_jobgroup">
				</div>
				<div>
				<input type="range">
					<label for="validationServer03" class="form-label">직장</label>
					`<select class="form-select" aria-label="Default select example">
						<option selected></option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					`</select> 
					<input name="user_workspace">
				</div>
				<div>
					<input type="submit" value="회원가입">
				</div>
			</div>
		</form>
	</div>
</body>
</html>



















