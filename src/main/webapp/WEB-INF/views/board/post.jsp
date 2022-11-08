<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
	border: 1px solid #bcbcbc;
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}

.category ul li {
	float: left;
	width: 150px;
	padding: 10px;
}

.category a:hover, .category a:focus{
	background-color: #222;
	color: #fff;
}

.category a:active{
	background-color: #f00;
}

.container{
	display: flex;
	flex-direction: row;
	width: 100%;
	list-style-type: none;
	background-color: grey;
}

.item a{
	text-align: center;
	text-decoration: none;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div><nav class="category"><ul class="container">
		<li class="item"><a href="board?category='블라블라'">@블라블라</a></li>
		<li class="item"><a href="board?category='주식투자'">@주식투자</a></li>
		<li class="item"><a href="board?category='썸,연애'">@썸,연애</a></li>
		<li class="item"><a href="board?category='회사생활'">@회사생활</a></li>
		<li class="item"><a href="board?category='이직,커리어'">@이직,커리어</a></li>
		<li class="item"><a href="board?category='결혼,육아'">@결혼,육아</a></li>
		<li class="item"><a href="board?category='홍보'">@홍보</a></li>
		<li class="item"><a href="board?category='취미생활'">@취미생활</a></li>
		<li class="item"><a href="board?category='우리회사 채용해요'">@우리회사 채용해요</a></li>
	</ul></nav></div>
	<div><h3>게시글 검색</h3>
	<form action="search" method="post">
		<select name="column">
			<option value="post_title">제목</option>
			<option value="post_usernum">작성자</option>
			<option value="post_contnet">내용</option>
		</select> <input type="text" name="keyvalue"> <input type="submit"	value="검색">
		<input type="hidden" name="pg" value="${pg}" />
	</form></div><br />
	
	<h3>블라블라</h3>
	<table>
		<tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="c1" items="${list1}">
			<tr>
				<td><a href="readform?post_num=${c1.post_num}&pg=${pg}">${c1.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c1.post_usernum}</td>
				<td>${c1.post_readcount}</td>
		</c:forEach>
	</table><br />
	
	<h3>주식투자</h3>
	<table>
		<tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="c2" items="${list2}">
			<tr>
				<td><a href="readform?post_num=${c2.post_num}&pg=${pg}">${c2.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c2.post_usernum}</td>
				<td>${c2.post_readcount}</td>
		</c:forEach>
	</table><br />
	
	<h3>썸,연애</h3>
	<table>
		<tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="c3" items="${list3}">
			<tr>
				<td><a href="readform?post_num=${c3.post_num}&pg=${pg}">${c3.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c3.post_usernum}</td>
				<td>${c3.post_readcount}</td>
		</c:forEach>
	</table><br />
	
	<h3>회사생활</h3>
	<table>
		<tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="c4" items="${list4}">
			<tr>
				<td><a href="readform?post_num=${c4.post_num}&pg=${pg}">${c4.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c4.post_usernum}</td>
				<td>${c4.post_readcount}</td>
		</c:forEach>
	</table><br />
	
	<h3>이직,커리어</h3>
	<table>
		<tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="c5" items="${list5}">
			<tr>
				<td><a href="readform?post_num=${c5.post_num}&pg=${pg}">${c5.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c5.post_usernum}</td>
				<td>${c5.post_readcount}</td>
		</c:forEach>
	</table><br />
	
	<h3>결혼,육아</h3>
	<table>
		<tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="c6" items="${list6}">
			<tr>
				<td><a href="readform?post_num=${c6.post_num}&pg=${pg}">${c6.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c6.post_usernum}</td>
				<td>${c6.post_readcount}</td>
		</c:forEach>
	</table><br />
	
	<h3>홍보</h3>
	<table>
		<tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="c7" items="${list7}">
			<tr>
				<td><a href="readform?post_num=${c7.post_num}&pg=${pg}">${c7.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c7.post_usernum}</td>
				<td>${c7.post_readcount}</td>
		</c:forEach>
	</table><br />
	
	<h3>취미생활</h3>
	<table>
		<tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="c8" items="${list8}">
			<tr>
				<td><a href="readform?post_num=${c8.post_num}&pg=${pg}">${c8.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c8.post_usernum}</td>
				<td>${c8.post_readcount}</td>
		</c:forEach>
	</table><br />
	
	<h3>우리회사 채용해요</h3>
	<table>
		<tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr>
		<c:forEach var="c9" items="${list9}">
			<tr>
				<td><a href="readform?post_num=${c9.post_num}&pg=${pg}">${c9.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c9.post_usernum}</td>
				<td>${c9.post_readcount}</td>
		</c:forEach>
	</table><br />
	

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>