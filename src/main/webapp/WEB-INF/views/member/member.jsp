<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<form action="/member/edit" method="post">
		<label>아이디</label> 
		<input type="text" name="user_id" value='${user_id}' readonly="readonly"><br> 
		<label>비밀번호</label> 
		<input type="password" name="user_password" placeholder="비밀번호"> <br>
		<input type="submit" value="수정"><br>
	</form>
	<form action="/member/reauthenticate">
		<label>이메일</label>
		<input type="text" name="user_email" value='${user_email}'><br>
		<label>직장</label>
		<input type="text" name="user_workspace" value='${user_workspace}'> <br>
		<label>직군</label> 
		<input type="text" name="user_jobgroup" value='${user_jobgroup}'><br>
		<input type="submit" value="수정"><br>
	</form>
	<label>포인트</label>
	<input type="text" name="user_point" value='${user_point}' readonly="readonly">
	<a href="#">포인트 충전</a><br>


	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>

