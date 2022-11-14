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
			</br> </br>
			<table cellpadding="3" border="1" style="width: 90%; height: 70%;font-size: 20px ">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>분류</th>
						<!-- 			<th width="100">관리자번호</th>
 -->
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<c:forEach var="l" items="${noticelist}">
					<tr >
						<td>${l.notice_num}</td>
						<td><a href="noticeDetail?notice_num=${l.notice_num}">${l.notice_title}</a></td>
						<td>${l.notice_category }</td>
						<%-- 				<td>${l.notice_adminnum}</td>
 --%>
						<td>${l.notice_regdate}</td>
						<td>${l.notice_readcount}</td>
				</c:forEach>
			</table>

			<ul>
				<li align="center">
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

				</li>
			</ul>

		</div>


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
