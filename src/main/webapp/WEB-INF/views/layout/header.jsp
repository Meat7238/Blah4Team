<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/js/menu.js" rel="stylesheet" />

<%--  <script src="${path}/resources/js/menu.js" defer></script>
 --%>
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<a href="${path}/"><img alt="로고"
				src="${path}/resources/images/logo.png"></a>
		</div>
		<ul class="navbar_menu">
			<li><a href="${root}board">게시판</a></li>
			<!-- /blah/home -->
			<li><a href="${path }/corpreviewhome">기업리뷰</a></li>
			<li><a href="${root}recruitMain">채용공고</a></li>
		</ul>
		<ul class="navbar_right">
			<li><a href="writeform">글쓰기</a></li>
			<li><sec:authorize access="isAnonymous()">
					<a href="${root}loginForm">로그인</a>
				</sec:authorize> 
				<sec:authorize access="isAuthenticated()">
					<a href="${root}member">내 정보</a> &nbsp
					<a href="${root}logout">로그아웃</a>
				</sec:authorize></li>
				
		</ul>
		<a href="" class="navbar_toogleBtn"><img alt="menu"
			src="resources/images/menu.png"></a>
	</nav>

</body>
</html>