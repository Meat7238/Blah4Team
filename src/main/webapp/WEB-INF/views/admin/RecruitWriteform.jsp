<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채용공고 작성</title>
</head>
<body>
	<h2>채용공고 쓰기</h2>
	
	<a href="${pageContext.request.contextPath}/admin">뒤로가기</a> &nbsp;&nbsp;
	</br>
	<form name="writeform" action="RecruitWrite" method="post">
		<table width="850">
			<tr>
				<th>기업(기업번호)</th>
				<td><input type="text" name="notice_category" maxlength="50"
					size="65" /></td>
			</tr>
			<tr>
				<th>모집신청 주소</th>
				<td><input type="text" name="notice_category" maxlength="50"
					size="65" /></td>
			</tr>
			<tr>
				<th>공고 마감일</th>
				<td><input type="text" name="notice_category" maxlength="50"
					size="65" /></td>
			</tr>
			<tr>
				<th>직업 분류</th>
				<td><input type="text" name="notice_category" maxlength="50"
					size="65" /></td>
			</tr>
			<tr>
				<th>모집군분류(경력/신입)</th>
				<td><input type="text" name="notice_category" maxlength="50"
					size="65" /></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td><input type="hidden" name="notice_adminnum" maxlength="5"
					size="12" value=${admin_id} />${admin_id}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"  value="글 등록" >
				 <input type="reset" value="취소" onclick="location.href='notice'" /></td>
			</tr>
		</table>
	</form>
</body>
</html>