<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Home</title>
<style type="text/css">
#search_wrapper {
	position: relative;
	width: 600px;
	align-content: center;
	align-items: center;
	display: table;
	margin: auto;
}
table {
	position: relative;
	width: 1000px;
	align-content: center;
	align-items: center;
	display: table;
	margin: auto;
	cellpadding: "3";
	border : "1";
}

table td {
text-align: center;
}
#search_wrapper input {
	width: 100%;
	line-height: 30px;
	border: 1px solid #bbb;
	border -radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
}

#search_wrapper img {
	position: absolute;
	width: 17px;
	top: 15px;
	right: 12px;
	margin: 0;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<br/></br>
	<div id="search_wrapper">
		<form action="home" method="post">
			<input type="text" name="keyvalue" placeholder="검색어 입력"> <img
				src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
		</form>
	</div>
<br/></br>
		<table border = "1">
		<tr border = "0">
		<th colspan='2' border="0">@최신글</th>
		</tr>
		<tr>
			<th width="50" align="center">번호</th>
			<th width=15%>제목</th>
			<th width="200">카테고리</th>
			<th width="120">내용</th>
			<th width="80">회원번호</th>
			<th width="120">좋아요</th>
			<th width="200">작성일</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="q" items="${list}">
			<tr>
				<td>${q.post_num}</td>
				<td><a href="readform?post_num=${q.post_num}&pg=${pg}">${q.post_title}</a></td>
				<td>${q.post_category }</td>
				<td>${q.post_content}</td>
				<td>${q.post_usernum}</td>
				<td>${q.post_like}</td>
				<td>${q.post_regdate}</td>
				<td>${q.post_readcount}</td>
		</c:forEach>
	</table>
	
	<table>
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
	</table>

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>
