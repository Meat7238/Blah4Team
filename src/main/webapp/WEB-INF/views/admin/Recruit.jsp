<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recruitlist edit</title>
</head>
<body>
	<h1>recruitlist Edit</h1>

	<a href="${path}/admin">뒤로가기</a> &nbsp;&nbsp;
	<a href="${path}/admin/RecruitWriteform">채용공고 입력하기</a>

	<table width="1000" cellpadding="3" border="1">
		<tr>
			<th width="50">번호</th>
			<th width=20%>기업(기업번호)</th>
			<th width=30%>모집신청 주소</th>
			<th width=10%>공고 마감일</th>
			<th width=10%>직업 분류</th>
			<th width=10%>모집군분류(경력/신입)</th>
			<th width=10%>조회수</th>
			<th width=5%>삭제버튼</th>
		</tr>
		<c:forEach var="r" items="${ recruitlist}">
			<tr>
				<td>${r.recruit_num}</td>
				<td>${r.recruit_corpnum}</td>
				<td>${r.recruit_link }</td>
				<td>${r.recruit_enddate}</td>
				<td>${r.recruit_jobgroup}</td>
				<td>${r.recruit_career}</td>
				<td>${r.recruit_readcount}</td>
				<td><button onclick="test2('${ r.recruit_num }')">삭제하기</button></td>
		</c:forEach>
	</table>
	<script>
		function test2(num) {
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				location.href = '${pageContext.request.contextPath}/admin/recruit/delete?recruit_num='
						+ num;
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
			[<a href="${pageContext.request.contextPath}/notice?pg=1"> ◀◀ </a>]
			[<a href="${pageContext.request.contextPath}/notice?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◁◁</span>]	
			[<span style="color: gray">◁</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
					var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
				[<a href="${pageContext.request.contextPath}/notice?pg=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
					<!-- 20<21 : true -->
				[<a href="${pageContext.request.contextPath}/notice?pg=${toPage+1}">▶</a>]
				[<a href="${pageContext.request.contextPath}/notice?pg=${allPage}">▶▶</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▷</span>]
				[<span style="color: gray">▷▷</span>]
		
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