<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice edit</title>
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" />
</head>
<body>

	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->
			<div class="tabs">
				<h2>Admin Page > 📃 공지사항 관리</h2>
				<div class="tab-header">
					<div class="active">
						<div class="btn-holder">
							<button class="btn btn-1 hover-filled-opacity"
								onclick="location.href='${path}/admin'">
								<span>뒤로가기</span>
							</button>
						</div>
					</div>
					<div>
						<div class="btn-holder">
							<button class="btn btn-1 hover-filled-opacity"
								onclick="location.href='${path}/admin/writeform'">
								<span>공지글 작성하기</span>
							</button>
						</div>
					</div>
				</div>
				<div class="tab-indicator"></div>
				<div class="tab-content">
					<div class="active">
						<table width="1000" cellpadding="3" border="1">
						<thead>
							<tr>
								<th >번호</th>
								<th >제목</th>
								<th >분류</th>
								<!-- 			<th width="100">관리자번호</th>
 -->
								<th >날짜</th>
								<th >조회수</th>
								<th>삭제</th>
							</tr>
						</thead>
							<c:forEach var="l" items="${noticelist}">
								<tr>
									<td>${l.notice_num}</td>
									<td><a href="noticeDetail?notice_num=${l.notice_num}">${l.notice_title}</a></td>
									<td>${l.notice_category }</td>
									<%-- 				<td>${l.notice_adminnum}</td>
 --%>
									<td>${l.notice_regdate}</td>
									<td>${l.notice_readcount}</td>
									<td><div class="btn-holder"><button class="btn btn-1 hover-filled-opacity" onclick="test2('${path}','${ l.notice_num }')">
											<span>삭제하기</span></button></div></td>
							</c:forEach>
						</table>
						<script>
							function test2(str, num) {
								if (confirm("정말 삭제하시겠습니까??") == true) { //확인
									location.href = str
											+ '/admin/notice/delete?notice_num='
											+ num;
									alert("삭제완료했습니다.");
								} else { //취소
									return false;
								}
							}
						</script>
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

<!-- //CREATE TABLE NOTICE( 
NOTICE_NUM VARCHAR2(20) CONSTRAINT NOTICE_NUM_pk PRIMARY key, 
NOTICE_TITLE varchar2(100),
NOTICE_CATEGORY varchar2(20),
NOTICE_CONTENT varchar2(4000),
NOTICE_ADMINNUM varchar2(20) CONSTRAINT NOTICE_ADMINNUM_fk REFERENCES ADMIN2(ADMIN_NUM),
NOTICE_REGDATE varchar2(20),
NOTICE_READCOUNT varchar2(20)
); -->