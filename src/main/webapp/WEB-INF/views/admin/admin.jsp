<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Home</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<h1>admin Home</h1>
	</br>
	</br>
	</br>
	</br>

	<h2>
		<li>1 <a href="${root}admin/edit"> 회원정보 관리</a></li>
	</h2>
	</br>
	<h2>
		<li>2 <a href="${root}admin/notice"> 공지사항 관리</a></li>
	</h2>
	</br>
	<h2>
		<li>3 <a href="${root}admin/ManageReport"> 신고 관리</a></li>
	</h2>
	</br>
	<h2>
		<li>4 <a href="${root}admin/recruit"> 공고 입력 </a></li>
	</h2>
	</br> 로그인 된 관리자 :<sec:authentication property="principal.username"/>

		<form action="adminLogout" method="post">
			<input type="submit" value="로그아웃">
		</form>
</body>
</html>