<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

	const form = document.signUpForm;
	
	function check(pattern, taget, message) {
		if(pattern.test(taget)) {
	    	return true;
	    }
	    alert(message);
	    taget.focus();
	    return false;
	}

	function emailValCheck() {
		var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = form.email.value;
		if (!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
			return false;
		}
		return true;
	}
	
	function emailAuthentication() {
		if (!emailValCheck()) {
			return false;
		}
		var url = "confirmEmail?email=" + document.signUpForm.email.value;
		var condition = "toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200"
		open(url, "confirm", condition);
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join.jsp page</title>
</head>
<body>
	<h2>회원가입</h2>

	<form action="/eamil-authenticate" method="post"
		enctype="multipart/form-data">
		<div class="form-group email-form">
			<label for="email">이메일</label> <input type="text" name="user_email" id="inputEmailForm" maxlength="30">
			<button onclick="emailAuthentication()" id="eamilAuthBtn" type="button" class="btnChk">인증 메일 보내기</button><br>
			
			<a>인증번호 입력</a>
			<input type="text" name="authCode" id="inputAuthCode"  maxlength="10" disabled="disabled">
			<button onclick="authCodeCheck()" id="authCodeCheckBtn" type="button" disabled="disabled" class="btnChk">인증</button>
			<input type="hidden" name="authPass" id="authPass" value="false">
			
		</div>
	</form>



	<form action="${root}joinAction" method="post">
		<table>

			<tr>
				<td>아이디</td>
				<td><input name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_password"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name="user_email"></td>
			</tr>
			<tr>
				<td>직군</td>
				<td><input name="user_jobgroup"></td>
			</tr>
			<tr>
				<td>직장</td>
				<td><input name="user_workspace"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="회원가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>



















