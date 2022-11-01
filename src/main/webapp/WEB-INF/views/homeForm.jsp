<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BlahBlah홈페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="/css/home.css" />
</head>
<body>
	<h1>BlahBlah 홈페이지</h1>
	
	
	<table width="500" cellpadding = "0" cellspacing="0" border="1">
	<tr><img alt="로고" src="/images/logo.png"></tr>
	<th>게시판</th> 
	<th>기업리뷰</th>
	<th>채용공고</th>
	<th>글쓰기</th>
	<th>로그인</th>
	</tr>
	</table>
	<h2>Hello! ${name}</h2>
	<div>JSP List Test</div>
	<c:forEach var="item" items="${list}" varStatus="idx">
        ${idx.index}, ${item} <br />
	</c:forEach>

</body>
</html>