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
</head>
<body>

	<header>
		<section class="hbody">
			<article class="nav">
				<div class="title">
					<a href="${path }/home/"><img alt="로고" src="resources/images/logo.png">
					
					</a>
				</div>
				<ul id="menu">
					<li><a href="/ui-b">게시판</a></li>
					<li><a href="/ui-r">기업리뷰</a></li>
					<li><a href="/ui-e">채용공고</a></li>
					<li><a href="/ui-b/write">글쓰기</a></li>
					<li><a href="/login">로그인</a></li>
				</ul>
				<i class="fab fa-twitter-square"></i> <i class="fas fa-bars"></i>
			</article>
		</section>
	</header>
	
</body>
</html>