<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
	border: 1px solid #bcbcbc;
	text-align: center;
}

table {
	width: 800px;
	height: 200px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<table cellpadding="3">
		<tr>
			<th width="50">번호</th>
			<th width="270">제목</th>
			<th width="200">카테고리</th>
			<th width="120">내용</th>
			<th width="80">회원번호</th>
			<th width="120">좋아요</th>
			<th width="200">작성일</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="q" items="${list}">
			<tr>
				<td>${q.post_num}</td>
				<td><a href="readform?post_num=${q.post_num}">${q.post_title}</a></td>
				<td>${q.post_category }</td>
				<td>${q.post_content}</td>
				<td>${q.post_usernum}</td>
				<td>${q.post_like}</td>
				<td>${q.post_regdate}</td>
				<td>${q.post_readcount}</td>
		</c:forEach>
	</table>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>