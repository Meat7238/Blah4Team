<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminlogin</title>
</head>
<body>

	<h1>admin login page</h1>

	<c:if test="${no == 1}">
		<script>
			alert("아이디와 비밀번호가 잘못되었습니다.")
		</script>
	</c:if>

	<form action="adminLogin" method="post">
		ID : <input type="text" name="id"><br /> PWD : <input
			type="password" name="pwd"><br/?> <input type="submit"
			value="로그인">
	</form>
	
	<a href="admin"> 관리자페이지</a>
	<c:if test="${ admin_id != null}">
	<meta http-equiv="refresh" content="0; url=admin"></meta>
	</c:if>
</body>
</html>