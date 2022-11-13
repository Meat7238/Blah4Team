<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" />

</head>
<body>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<br />
	<div class="searchbox"><h3>게시글 검색</h3>
	<form action="search" method="post">
		<select name="column">
			<option value="post_title">제목</option>
			<option value="post_usernum">작성자</option>
			<option value="post_contnet">내용</option>
		</select> <input type="text" name="keyvalue"> <input type="submit"	value="검색">
		<input type="hidden" name="pg" value="${pg}" />
	</form></div><br />
	<hr><br />
	
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
	</ul></nav></div><br /><hr><br />
	
<div class="wrapper">
	<div class="int">
	<table>
	<caption>블라블라</caption>
		<thead><tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr></thead>
		<c:forEach var="c1" items="${list1}">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c1.POST_NUM}&pg=${pg}">${c1.POST_TITLE}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c1.USER_ID}</td>
				<td>${c1.POST_READCOUNT}</td>
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>주식투자</caption>
		<thead><tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr></thead>
		<c:forEach var="c2" items="${list2}">
			<tr class="boardlist">

				<td class="title"><a href="readform?post_num=${c2.POST_NUM}&pg=${pg}">${c2.POST_TITLE}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c2.USER_ID}</td>
				<td>${c2.POST_READCOUNT}</td>

				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>썸,연애</caption>
		<thead><tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr></thead>
		<c:forEach var="c3" items="${list3}">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c3.POST_NUM}&pg=${pg}">${c3.POST_TITLE}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c3.USER_ID}</td>
				<td>${c3.POST_READCOUNT}</td>
				</tr>
		</c:forEach>
	</table></div>


	<div class="int">
	<table>
	<caption>회사생활</caption>
		<thead><tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr></thead>
		<c:forEach var="c4" items="${list4}">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c4.POST_NUM}&pg=${pg}">${c4.POST_TITLE}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c4.USER_ID}</td>
				<td>${c4.POST_READCOUNT}</td>
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>이직,커리어</caption>
		<thead><tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr></thead>
		<c:forEach var="c5" items="${list5}">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c5.POST_NUM}&pg=${pg}">${c5.POST_TITLE}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c5.USER_ID}</td>
				<td>${c5.POST_READCOUNT}</td>
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>결혼,육아</caption>
		<thead><tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr></thead>
		<c:forEach var="c6" items="${list6}">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c6.POST_NUM}&pg=${pg}">${c6.POST_TITLE}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c6.USER_ID}</td>
				<td>${c6.POST_READCOUNT}</td>
				</tr>
		</c:forEach>
	</table></div>

	
	<div class="int">
	<table>
	<caption>홍보</caption>
		<thead><tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr></thead>
		<c:forEach var="c7" items="${list7}">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c7.POST_NUM}&pg=${pg}">${c7.POST_TITLE}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c7.USER_ID}</td>
				<td>${c7.POST_READCOUNT}</td>
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>취미생활</caption>
		<thead><tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr></thead>
		<c:forEach var="c8" items="${list8}">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c8.POST_NUM}&pg=${pg}">${c8.POST_TITLE}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c8.USER_ID}</td>
				<td>${c8.POST_READCOUNT}</td>
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>우리회사 채용해요</caption>
		<thead><tr>
			<th width="270">제목</th>
			<th width="80">작성자</th>
			<th width="120">조회수</th>
		</tr></thead>
		<c:forEach var="c9" items="${list9}">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c9.POST_NUM}&pg=${pg}">${c9.POST_TITLE}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${c9.USER_ID}</td>
				<td>${c9.POST_READCOUNT}</td>
				</tr>
		</c:forEach>
	</table>
	</div>
</div>

<div class="footer">
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</div>

</body>
</html>