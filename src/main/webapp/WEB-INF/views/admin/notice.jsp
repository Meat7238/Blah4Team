<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice edit</title>
</head>
<body>
	<h1>notice Edit</h1>

	<a href="${path}/admin">뒤로가기</a> &nbsp;&nbsp;
	<a href="${path}/admin/writeform">공지글 작성하기</a>

	<table width="1000" cellpadding="3" border="1">
		<tr>
			<th width="50">번호</th>
			<th width="500">제목</th>
			<th width="300">분류</th>
			<th width="100">관리자번호</th>
			<th width="120">날짜</th>
			<th width="120">조회수</th>
			<th width="140">삭제</th>
		</tr>
		<c:forEach var="l" items="${noticelist}">
			<tr>
				<td>${l.notice_num}</td>
				<td><a href="noticeDetail?notice_num=${l.notice_num}">${l.notice_title}</a></td>
				<td>${l.notice_category }</td>
				<td>${l.notice_adminnum}</td>
				<td>${l.notice_regdate}</td>
				<td>${l.notice_readcount}</td>
				<td><button onclick="test2('${path}','${ l.notice_num }')">
						삭제하기</button></td>
		</c:forEach>
	</table>
	<script>
		function test2(str, num) {
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				location.href = str + '/admin/notice/delete?notice_num=' + num;
				alert("삭제완료했습니다.");
			} else { //취소
				return false;
			}
		}
	</script>

	<table width="600">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="notice?pg=1"> ◀◀ </a>]
			[<a href="notice?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀${block}</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="notice?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="notice?pg=${toPage+1}">▶</a>]
				[<a href="notice?pg=${allPage}">▶▶</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>

			</td>
		</tr>
	</table>
</body>
</html>

<!-- //CREATE TABLE NOTICE( 
NOTICE_NUM VARCHAR2(20) CONSTRAINT NOTICE_NUM_pk PRIMARY key, 
NOTICE_TITLE varchar2(100),
NOTICE_CATEGORY varchar2(20),
NOTICE_CONTENT varchar2(4000),
NOTICE_ADMINNUM varchar2(20) CONSTRAINT NOTICE_ADMINNUM_fk REFERENCES ADMIN2(ADMIN_NUM),
NOTICE_REGDATE varchar2(20),
NOTICE_READCOUNT varchar2(20)
); -->