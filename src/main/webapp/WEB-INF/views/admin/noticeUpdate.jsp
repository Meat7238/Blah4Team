<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
</head>
<body>
	<a href="${path}/admin/notice">공지 목록</a>
	<form name="noticeUpdate" action="${path}/admin/noticeUpdate" method="post">
			
		<input type="hidden" name="notice_num" value="${p.notice_num}"/>
		<input type="hidden" name="notice_adminnum" value="${p.notice_adminnum}"/>
		<input type="hidden" name="notice_regdate" value="${p.notice_regdate}"/>
		<input type="hidden" name="notice_readcount" value="${p.notice_readcount}"/>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="notice_title" maxlength="50"
					size="65" value="${p.notice_title}" /></td>
			</tr>
			<tr>
				<th>분류</th>
				<td><input type="text" name="notice_category" maxlength="50"
					size="65" value="${p.notice_category}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="50" name="notice_content" value="">${p.notice_content}</textarea>
				</td>
			<tr>
				<th>작성자</th>
				<td><sec:authentication property="principal.username"/></td>
			</tr>
			<tr>	
				<td><input type="button" value="수정" onclick="updateMsg()" /> <script>
					function updateMsg() {
						if (document.noticeUpdate.notice_title.value == "") {
							alert("제목을 입력하세요");
						} else if (document.noticeUpdate.notice_category.value == "") {
							alert("카테고리를 입력하세요");
						} else if (document.noticeUpdate.notice_content.value == "") {
							alert("내용을 입력하세요");
						} else if (confirm("수정된 내용을 제출하시겠습니까??") == true) { //확인
							document.noticeUpdate.submit();
							alert("수정완료했습니다.");
						}
					}
				</script> <input type="reset" value="취소" /></td>
			</tr>
		</table>
	</form>
</body>
</html>