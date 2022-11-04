<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 세부내용</title>
</head>
<body>

	<h2>공지글 세부내용</h2>
	<a href="${path}/admin/notice">공지 목록</a>

	<table width="700" border="1">
		<tr>
			<th colspan="4">${b.notice_title}</th>
		</tr>
		<tr>
			<td width="20%">${p.notice_num}</td>
			<td>${p.notice_category}</td>
			<td width="15%">${p.notice_regdate}</td>
			<td width="15%">조회수 ${p.notice_readcount}</td>
		</tr>
		<tr>
			<td colspan="4"><textarea rows="10" cols="100"
					readonly="readonly">${p.notice_content}</textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="right"><input type="button" value="수정"
				onclick="location.href='${pageContext.request.contextPath}/admin/noticeUpdate?notice_num=${p.notice_num}';" />
				<button onclick="test2('${path}','${ p.notice_num }')">삭제하기</button>
				<script>
					function test2(str, num) {
						if (confirm("정말 삭제하시겠습니까??") == true) { //확인
							location.href = str
									+ '/admin/notice/delete?notice_num=' + num;
							alert("삭제완료했습니다.");
						} else { //취소
							return false;
						}
					}
				</script>
			</td>
		</tr>
	</table>






</body>
</html>