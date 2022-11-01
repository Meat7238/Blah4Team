<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BlahBlah홈페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="resources/css/home.css" />
</head>
<body>
	<h1>BlahBlah 홈페이지</h1>
	<header>
		<tr>
			<img alt="로고" src="resources/images/logo.png">
		</tr>

		<nav>
			<ul>
				<li><a href="/ui-b">게시판</a></li>
				<li><a href="/ui-r">기업리뷰</a></li>
				<li><a href="/ui-e">채용공고</a></li>
				<li><a href="/ui-b/write">글쓰기</a></li>
				<li><a href="/login">로그인</a></li>
			</ul>
		</nav>
	</header>

	<h2>Hello! ${name}</h2>
	<div>JSP List Test</div>
	<c:forEach var="item" items="${list}" varStatus="idx">
        ${idx.index}, ${item} <br />
	</c:forEach>

</body>
</html>