<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>client notice view</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<h1>client notice view</h1>
	<table width="1000" cellpadding="3" border="1">
		<tr>
			<th width="50">번호</th>
			<th width="500">제목</th>
			<th width="300">분류</th>
			<th width="100">관리자번호</th>
			<th width="120">날짜</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="l" items="${noticelist}">
			<tr>
				<td>${l.notice_num}</td>
				<td><a href="noticeDetail?notice_num=${l.notice_num}">${l.notice_title}</a></td>
				<td>${l.notice_category }</td>
				<td>${l.notice_adminnum}</td>
				<td>${l.notice_regdate}</td>
				<td>${l.notice_readcount}</td>
		</c:forEach>
	</table>
	<a href="${path}/">뒤로가기</a>

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

</body>
</html>
