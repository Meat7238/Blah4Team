<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>client notice view</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css"
	rel="stylesheet" />
</head>
<body>

	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
<!-- ------------------------------------------------------------------------------------------------------------- -->
		<h1>client Notice Page</h1>
	</br>
		</br>
	<table width="1000" cellpadding="3" border="1">
	<thead>
		<tr>
			<th width="50">번호</th>
			<th width="500">제목</th>
			<th width="300">분류</th>
			<th width="120">날짜</th>
			<th width="120">조회수</th>
	</thead>
		</tr>
		<c:forEach var="l" items="${noticelist}">
			<tr>
				<td>${l.notice_num}</td>
				<td><a href="noticeDetail?notice_num=${l.notice_num}">${l.notice_title}</a></td>
				<td>${l.notice_category }</td>
				<td>${l.notice_regdate}</td>
				<td>${l.notice_readcount}</td>
		</c:forEach>
	</table>
	</br>
		<ul>
			<li align="center" style="font-size: 20px;" >
				<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="notice?pg=1">◀◀</a>]
			[<a href="notice?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
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
<br>
			</li>
		</ul>
<!-- ------------------------------------------------------------------------------------------------------------- -->
		</div>
		<footer>
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>
