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
	
<div class="abs">
	<div class="int">
	<table>
	<caption>블라블라</caption>
		<thead><tr>
			<th width="230">제목</th>
			<th width="80">작성자</th>
			<th width="80">조회수</th>
			<th width="80">댓글수</th>
		</tr></thead>
		<c:forEach var="c1" items="${list1}" varStatus="status1">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c1.post_num}&pg=${pg}">${c1.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${postid1[status1.index]}</td>
				<td>${c1.post_readcount}</td>
				<td>${postrivew_count1[status1.index]}</td>
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>주식투자</caption>
		<thead><tr>
			<th width="230">제목</th>
			<th width="80">작성자</th>
			<th width="80">조회수</th>
			<th width="80">댓글수</th>
		</tr></thead>
		<c:forEach var="c2" items="${list2}" varStatus="status2">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c2.post_num}&pg=${pg}">${c2.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${postid2[status2.index]}</td>
				<td>${c2.post_readcount}</td>
				<td>${postrivew_count2[status2.index]}</td>
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>썸,연애</caption>
		<thead><tr>
			<th width="230">제목</th>
			<th width="80">작성자</th>
			<th width="80">조회수</th>
			<th width="80">댓글수</th>
		</tr></thead>
		<c:forEach var="c3" items="${list3}" varStatus="status3">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c3.post_num}&pg=${pg}">${c3.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${postid3[status3.index]}</td>
				<td>${c3.post_readcount}</td>
				<td>${postrivew_count3[status3.index]}</td>				
				</tr>
		</c:forEach>
	</table></div>


	<div class="int">
	<table>
	<caption>회사생활</caption>
		<thead><tr>
			<th width="230">제목</th>
			<th width="80">작성자</th>
			<th width="80">조회수</th>
			<th width="80">댓글수</th>
		</tr></thead>
		<c:forEach var="c4" items="${list4}" varStatus="status4">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c4.post_num}&pg=${pg}">${c4.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${postid4[status4.index]}</td>
				<td>${c4.post_readcount}</td>
				<td>${postrivew_count4[status4.index]}</td>				
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>이직,커리어</caption>
		<thead><tr>
			<th width="230">제목</th>
			<th width="80">작성자</th>
			<th width="80">조회수</th>
			<th width="80">댓글수</th>
		</tr></thead>
		<c:forEach var="c5" items="${list5}" varStatus="status5">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c5.post_num}&pg=${pg}">${c5.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${postid5[status5.index]}</td>
				<td>${c5.post_readcount}</td>
				<td>${postrivew_count5[status5.index]}</td>								
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>결혼,육아</caption>
		<thead><tr>
			<th width="230">제목</th>
			<th width="80">작성자</th>
			<th width="80">조회수</th>
			<th width="80">댓글수</th>
		</tr></thead>
		<c:forEach var="c6" items="${list6}" varStatus="status6">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c6.post_num}&pg=${pg}">${c6.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${postid6[status6.index]}</td>
				<td>${c6.post_readcount}</td>
				<td>${postrivew_count6[status6.index]}</td>												
				</tr>
		</c:forEach>
	</table></div>

	<div class="int">
	<table>
	<caption>홍보</caption>
		<thead><tr>
			<th width="230">제목</th>
			<th width="80">작성자</th>
			<th width="80">조회수</th>
			<th width="80">댓글수</th>
		</tr></thead>
		<c:forEach var="c7" items="${list7}" varStatus="status7">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c7.post_num}&pg=${pg}">${c7.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${postid7[status7.index]}</td>
				<td>${c7.post_readcount}</td>
				<td>${postrivew_count7[status7.index]}</td>																
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>취미생활</caption>
		<thead><tr>
			<th width="230">제목</th>
			<th width="80">작성자</th>
			<th width="80">조회수</th>
			<th width="80">댓글수</th>
		</tr></thead>
		<c:forEach var="c8" items="${list8}" varStatus="status8">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c8.post_num}&pg=${pg}">${c8.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${postid8[status8.index]}</td>
				<td>${c8.post_readcount}</td>
				<td>${postrivew_count8[status8.index]}</td>																
				</tr>
		</c:forEach>
	</table></div>
	
	<div class="int">
	<table>
	<caption>우리회사 채용해요</caption>
		<thead><tr>
			<th width="230">제목</th>
			<th width="80">작성자</th>
			<th width="80">조회수</th>
			<th width="80">댓글수</th>
		</tr></thead>
		<c:forEach var="c9" items="${list9}" varStatus="status9">
			<tr class="boardlist">
				<td class="title"><a href="readform?post_num=${c9.post_num}&pg=${pg}">${c9.post_title}
					<%-- <c:if test="${q.post_reviewcount ne 0}">
							<small><b>[&nbsp;<c:out value="${q.post_reviewcount}"/>&nbsp;]</b></small>
						</c:if> --%>
				</a></td>
				<td>${postid9[status9.index]}</td>
				<td>${c9.post_readcount}</td>
				<td>${postrivew_count9[status9.index]}</td>																
				</tr>
		</c:forEach>
	</table>
	</div>
</div>

<!-- ------------------------------------------------------------------------------------------------------------- -->
		</div>
		<footer>
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>