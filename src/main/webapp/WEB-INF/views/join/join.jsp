<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function check(pattern, taget, message) {
	if(pattern.test(taget)) {
    	return true;
    }
    alert(message);
    taget.focus();
    return false;
}

const form = document.signUpForm;

function emailValCheck(){
	var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = form.email.value;
	if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
		return false;
	}
    return true;
}

function emailAuthentication(){
	if (!emailValCheck()){
    	return false;
    }
	var url = "confirmEmail.four?email=" + document.signUpForm.email.value;
	open(url, "confirm",
			"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
}
</script>


<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>

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
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>



















