<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" />

</head>
<body>
	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->
	<br />
	<div class="searchbox"><h3>게시글 검색</h3>
	<form action="search" method="get">
		<select name="column">
			<option value="post_title">제목</option>
			<option value="post_usernum">작성자(ID)</option>
			<option value="post_content">내용</option>
		</select> <input type="text" name="keyvalue"> <input type="submit"	value="검색">
		<input type="hidden" name="pg" value="${pg}" />
	</form></div><br />
	<hr>
	<br />
	
	<div class="category"><ul class="container">
		<li class="item"><a href="board?category='블라블라'">@블라블라</a></li>
		<li class="item"><a href="board?category='주식투자'">@주식투자</a></li>
		<li class="item"><a href="board?category='썸,연애'">@썸,연애</a></li>
		<li class="item"><a href="board?category='회사생활'">@회사생활</a></li>
		<li class="item"><a href="board?category='이직,커리어'">@이직,커리어</a></li>
		<li class="item"><a href="board?category='결혼,육아'">@결혼,육아</a></li>
		<li class="item"><a href="board?category='홍보'">@홍보</a></li>
		<li class="item"><a href="board?category='취미생활'">@취미생활</a></li>
		<li class="item"><a href="board?category='우리회사 채용해요'">@우리회사 채용해요</a></li>
	</ul></div><br /><hr><br />
	
	<div class="abs">
	<table class="list">
	<caption>${category}</caption>
		<thead><tr>
			<th width="50">번호</th>
			<th width="270">제목</th>
			<th width="200">카테고리</th>
			<!-- <th width="120">내용</th> -->
			<th width="80">작성자</th>
			<th width="200">작성일</th>
			<th width="120">조회수</th>
		</tr></thead>
		<c:forEach var="q" items="${list}">
			<tr class="boardlist">
				<td>${q.POST_NUM}</td>
				<td class="title"><a href="readform?post_num=${q.POST_NUM}&pg=${pg}">${q.POST_TITLE}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${q.POST_CATEGORY}</td>
				<%-- <td>${q.post_content}</td> --%>
				<td>${q.USER_ID}</td>
				<td>${q.POST_REGDATE}</td>
				<td>${q.POST_READCOUNT}</td>
		</c:forEach>
	</table>
	
	<table class="page">
		<tr>
			<td align="center">
			<!-- 처음 이전 링크 -->
			<c:if test="${pg>block}">	<!-- 5>10: false	/	15>10: true -->
				[<a href="board?pg=1&category=${category}">◀◀</a>]
				[<a href="board?pg=${fromPage-1}&category=${category}">◀</a>]
			</c:if>
			<c:if test="${pg<=block}"> <!-- 5<=10 :true / 15<=10:false -->
				[<span style="color:gray">◀◀</span>]	
				[<span style="color:gray">◀</span>]
			</c:if>
			
			
			<!-- 블록 범위 찍기 -->
			<c:forEach begin="${fromPage}" end="${toPage}" var="i">
				<c:if test="${i==pg}">[${i}]</c:if>
				<c:if test="${i!=pg}">
					[<a href="board?pg=${i}&category=${category}">${i}</a>]
				</c:if>
			</c:forEach>
			
			<!-- 다음, 이후 -->
			<c:if test="${toPage<allPage}"> <!-- 20<21 : true -->
				[<a href="board?pg=${toPage+1}&category=${category}">▶</a>]
				[<a href="board?pg=${allPage}&category=${category}">▶▶</a>]
		
			</c:if>	
			<c:if test="${toPage>=allPage}"> <!-- 21>=21 :true -->
				[<span style="color:gray">▶</span>]	
				[<span style="color:gray">▶▶</span>]
		
			</c:if>			
			
			</td>
		</tr>
	</table>
	</div>
	<!-- ------------------------------------------------------------------------------------------------------------- -->
		</div>
		<br /><br />
		<footer>
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>