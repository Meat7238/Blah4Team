<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGOUT</title>
</head>
<body>
<h1>LOGOUT</h1>

<form action="/" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_crsf.token }">
	<button>로그아웃</button>
</form>
</body>
</html>