<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ManageReport</title>
</head>
<body>
	<h1> 신고처리 </h1>
<!-- 	<form action="edit" method="post">
		<select name="column">
			<option value="user_num">유저번호</option>
			<option value="user_id">아이디</option>
			<option value="user_nick">닉네임</option>
		</select> <input type="text" name="keyvalue" stle="width:400px; height:100px;"> <input type="submit"
			value="검색">
	</form> -->
	<br/>
	<h3>신고접수된 게시판</h3>

	<table border="1" width="1000">
		<tr>
			<th>처리상태</th>
			<th>신고유형</th>
			<th>신고 번호</th>
			<th>게시글 번호</th>
			<th>유저번호</th>
			<th>신고내용</th>
			<th>처리한 관리자</th>
			<th>신고일</th>
			<th>*처리완료*</th>
			<th>*검토*</th>
		</tr>
		<c:forEach var="r" items="${reportPostList}">
			<tr>
				<td>${r.reportp_result }</td>
				<td>${r.reportp_type }</td>
				<td>${r.reportp_num }</td>
				<td>${r.reportp_postnum }</td>
				<td>${r.reportp_usernum }</td>
				<td>${r.reportp_content }</td>
				<td>${r.reportp_adminnum }</td>
				<td>${r.reportp_regdate }</td>
				<td><button onclick="test('${path}','${ e.user_num }')">
						처리완료하기</button></td>
				<%-- <td><a href="javascript:location.href='${pageContext.request.contextPath}/admin/edit/delete?num=${e.user_num}'">삭제하기</a></td> --%>
				<td><button onclick="test('${path}','${ e.user_num }')">
						검토하기</button></td>
			</tr>
		</c:forEach>
	</table>
	<a href="${path}/admin">뒤로가기</a>
<br/>	
		<h3>신고접수된 댓글</h3>
		<h3>신고접수된 기업리뷰</h3>
	<script>
		function test(str, num) {
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				/*     		 window.location.href =path+'/admin/edit/delete?num='+ e.user_num; */

				location.href = str + '/admin/edit/delete?num=' + num;
				alert("삭제완료했습니다.");
			} else { //취소
				return false;
			}
		}
	</script>
</body>
</html>