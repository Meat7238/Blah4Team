<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 작성</title>
</head>
<body>
	<h2>게시글 쓰기</h2>
	<form name="writeform" action="writeform" method="post">
		<table width="850">
			<tr>
				<th>제목</th>
				<td><input type="text" name="notice_title" maxlength="50"
					size="65" /></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><input type="text" name="notice_category" maxlength="50"
					size="65" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="notice_content" rows="5" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="notice_adminnum" maxlength="5"
					size="12" value="AD001" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"  value="글 등록" >
				 <input type="reset" value="취소" onclick="location.href='notice'" /></td>
			</tr>
		</table>
	</form>
</body>
</html>