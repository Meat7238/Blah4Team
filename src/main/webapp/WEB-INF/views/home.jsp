<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>Home</title>
<style type="text/css">
</style>

<link href="${pageContext.request.contextPath}/resources/css/home.css"
	rel="stylesheet" />
</head>
	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
<!-- ------------------------------------------------------------------------------------------------------------- -->
			<br /></br>
			<div id="search_wrapper">
				<form action="search" method="get">
					<input type="hidden" name="column" value="post_title">
					<input type="hidden" name="pg" value="1">
					<input type="text" name="keyvalue" placeholder="검색어 입력"> <img
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</form>
			</div>
			<br /></br>
			<table border="1">
				<thead>
					<tr border="0">
						<th id="recent" colspan='2'>@최신글</th>
					</tr>
					<tr>
						<th width="50">번호</th>
						<th width=10%>카테고리</th>
						<th width=40%>제목</th>
						<th width="80">아이디</th>
						<th width="50">댓글수</th>
						<th width="150">작성일</th>
						<th width="80">조회수</th>
					</tr>
				</thead>
				<c:forEach var="q" items="${list}" varStatus="status">
					<tbody>
						<tr>
							<td>${q.post_num}</td>
							<td>${q.post_category }</td>
							<td><a href="readform?post_num=${q.post_num}&pg=${pg}">${q.post_title}</a></td>
							<td>${postid[status.index]}</td>
							<td>${postrivew_count[status.index]}</td>
							<td>${q.post_regdate}</td>
							<td>${q.post_readcount}</td>
					</tbody>
				</c:forEach>
			</table>
				</br>
			<ul>
				<li align="center" style="font-size: 20px;" >
						<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
							<!-- 5>10: false	/	15>10: true -->
				[<a href="${pageContext.request.contextPath}/?pg=1">◀◀</a>]
				[<a href="${pageContext.request.contextPath}/?pg=${fromPage-1}">◀</a>]
			</c:if> <c:if test="${pg<=block}">
							<!-- 5<=10 :true / 15<=10:false -->
				[<span style="color: gray">◁◁</span>]	
				[<span style="color: gray">◁</span>]
			</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
							var="i">
							<c:if test="${i==pg}">[${i}]</c:if>
							<c:if test="${i!=pg}">
					[<a href="${pageContext.request.contextPath}/?pg=${i}">${i}</a>]
				</c:if>
						</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
							<!-- 20<21 : true -->
				[<a href="${pageContext.request.contextPath}/?pg=${toPage+1}">▶</a>]
				[<a href="${pageContext.request.contextPath}/?pg=${allPage}">▶▶</a>]
		
			</c:if> <c:if test="${toPage>=allPage}">
							<!-- 21>=21 :true -->
				[<span style="color: gray">▷</span>]	
				[<span style="color: gray">▷▷</span>]
		
			</c:if>
			</br>
			</br>

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
