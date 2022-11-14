<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin pwd update</title>
</head>
<body>

<form action="${root}adminUpdatePwd" method="post">
	<input type="text" name="user_password">
	<input type="submit" value="비밀번호 변경">
</form>

</body>
</html>