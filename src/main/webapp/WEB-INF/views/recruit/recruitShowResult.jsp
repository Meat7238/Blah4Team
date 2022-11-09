<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블라블라 : 채용공고</title>
<style>
table, th, td {
	border: 1px solid #bcbcbc;
	text-align: center;
}

table {
	width: 800px;
	height: 200px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	
	<form action="/recruit/recruitSelect" method="get">
		<input type="text" name="corp_name">
		<input type="submit" name="검색">
	
	</form>
	<br><br><br>
	
	
	<table cellpadding="3">
		<tr>
			<th width="50">번호</th>
			<th width="200">채용 기업</th>
			<th width="120">채용 시작일</th>
			<th width="120">채용 마감일</th>
			<th width="80">직군</th>
			<th width="80">경력</th>
			<th width="50">조회수</th>
		</tr>
		<c:forEach var="r" items="${list}">
			<tr>
				<td>${r.RECRUIT_NUM}</td>
				<%-- <td><a href="readform?post_num=${q.post_num}&pg=${pg}">${q.post_title}</a></td> --%>
				<td>${r.CORP_NAME}</td>
				<td>${r.RECRUIT_STARTDATE}</td>
				<td>${r.RECRUIT_ENDDATE}</td>
				<td>${r.RECRUIT_JOBGROUP}</td>
				<td>${r.RECRUIT_CAREER}</td>
				<td>${r.RECRUIT_READCOUNT}</td>
		</c:forEach>
	</table>
	<!-- <script>window.onpageshow = function(event) {if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {  }}</script> -->
	


	
	<%-- <table width="600">
		<tr>
			<td align="center">
			<!-- 처음 이전 링크 -->
			<c:if test="${pg>block}">	<!-- 5>10: false	/	15>10: true -->
				[<a href="board?pg=1">◀◀</a>]
				[<a href="board?pg=${fromPage-1}">◀</a>]
			</c:if>
			<c:if test="${pg<=block}"> <!-- 5<=10 :true / 15<=10:false -->
				[<span style="color:gray">◀◀</span>]	
				[<span style="color:gray">◀</span>]
			</c:if>
			
			
			<!-- 블록 범위 찍기 -->
			<c:forEach begin="${fromPage}" end="${toPage}" var="i">
				<c:if test="${i==pg}">[${i}]</c:if>
				<c:if test="${i!=pg}">
					[<a href="board?pg=${i}">${i}</a>]
				</c:if>
			</c:forEach>
			
			<!-- 다음, 이후 -->
			<c:if test="${toPage<allPage}"> <!-- 20<21 : true -->
				[<a href="board?pg=${toPage+1}">▶</a>]
				[<a href="board?pg=${allPage}">▶▶</a>]
		
			</c:if>	
			<c:if test="${toPage>=allPage}"> <!-- 21>=21 :true -->
				[<span style="color:gray">▶</span>]	
				[<span style="color:gray">▶▶</span>]
		
			</c:if>			
			
			</td>
		</tr>
	</table> --%>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>