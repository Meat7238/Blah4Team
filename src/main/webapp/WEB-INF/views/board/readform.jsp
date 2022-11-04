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

<h2>글 읽기</h2>
<a href="board">게시판 목록</a>
<table width="700">
	<tr>
		<th colspan="4">${b.post_title}</th>
	</tr>
	
	<tr>
		<td width="20%">${b.post_usernum}</td>
		<td>${b.post_category}</td>
		<td width="15%">${b.post_regdate}</td>
		<td width="15%">${b.post_readcount} post_readcount</td>
	</tr>
	
	<tr>
		<td colspan="4">
			<textarea rows="10" cols="100" readonly="readonly">${b.post_content}</textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="4" align="right">
			<input type="button" value="수정" onclick="post_update()"/>
			<input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/delete?post_num=${b.post_num}';"/>
		</td>
	</tr>
</table>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>