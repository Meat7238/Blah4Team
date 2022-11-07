<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join.jsp page</title>
</head>
<body>
<h2>회원가입</h2>
<form action="/join/joinAction" method="post">
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
		<td>닉네임</td>
		<td><input name="user_nick"></td>
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



















