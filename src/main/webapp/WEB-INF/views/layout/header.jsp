<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<a href="${path }/home/"><img alt="로고"
				src="resources/images/logo.png"></a>
		</div>
		<ul class="navbar_menu">
			<li><a href="/ui-b">게시판</a></li>
			<li><a href="/ui-r">기업리뷰</a></li>
			<li><a href="/ui-e">채용공고</a></li>
		</ul>
		<ul class="navbar_right">
			<li><a href="/ui-b/write">글쓰기</a></li>
			<li><a href="/login">로그인</a></li>
		</ul>
		<a href="" class="navbar_toogleBtn"><img alt="menu"
			src="resources/images/menu.png"></a>
	</nav>



</body>
</html>