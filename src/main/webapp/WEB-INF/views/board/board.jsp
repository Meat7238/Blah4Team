<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<table width="600" cellpadding="3">
		<tr>
			<th width="50">번호</th>
			<th width="270">제목</th>
			<th width="100">글쓴이</th>
			<th width="120">날짜</th>
			<th width="80">조회수</th>
			<th width="120">날짜</th>
			<th width="120">날짜</th>
			<th width="120">날짜</th>
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