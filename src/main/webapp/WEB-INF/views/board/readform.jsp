	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function test3() {
		if (document.insertReview.postreview_content.value == "") {
			alert("내용을 입력하세요");
		} else {
			document.insertReview.submit();
		}
	}

	function reportpop() {
		var popUrl = "stipulation"
		var popOption = "width = 800px, height=600px, top=300px, left=300px, scrollbars=yes";
		window.open(popUrl, "title", popOption);
	}
</script>

<link
	href="${pageContext.request.contextPath}/resources/css/readform.css"
	rel="stylesheet" />

</head>
<body>
	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->

			<input type="button" class="button" onclick="javascript:history.back();" value="이전 페이지">
			
			<table class="read">
				<tr>
				<td colspan="4" style="	font-weight: bold;
	font-size: 20px; text-align: left">
					${b.post_title}
				</td>
				<tr>
				<tr>
					<th>작성자</th>
					<th>카테고리</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<tr>
					<td>${user_id}</td>
					<td>${b.post_category}</td>
					<td>${b.post_regdate}</td>
					<td >조회수 ${b.post_readcount}</td>
				</tr>

					<td style="border-top: 1px solid #cdd0d4;" colspan="4"><textarea class="textContent" style="overflow: hidden;"
							readonly="readonly">${b.post_content}</textarea></td>
				</tr>
				<tr>

			<td colspan="4" align="right">
			<sec:authentication property="principal" var="pinfo" />
			<sec:authorize access="isAuthenticated()">
					<c:choose>
						<c:when test="${pinfo.username eq user_id }">
							<input type="button" value="수정" class="button"
								onclick="location.href='${pageContext.request.contextPath}/updateform?post_num=${b.post_num}&pg=${pg}';" />
							<input type="button" value="삭제" class="button"
								onclick="location.href='${pageContext.request.contextPath}/delete?post_num=${b.post_num}&pg=${pg}';" />
						</c:when>
						<c:otherwise>
						<form name="form">
							<input type="hidden" name="pg" value="${pg}" />
							<input type="hidden" id="post_title" name="post_title" value="${b.post_title}" />
							<input type="hidden" id="post_num" name="post_num" value="${b.post_num}" />
							<input type="hidden" id="post_usernum" name="post_usernum" value="${b.post_usernum}" />
							<input type="hidden" id="post_category" name="post_category" value="${b.post_category}" />
							<input type="button" class="button" value="게시글 신고" onclick="reportpop(this.form)" />
						</form>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<input type="button" value="삭제" class="button"
									onclick="location.href='${pageContext.request.contextPath}/delete?post_num=${b.post_num}&pg=${pg}';" />
							</sec:authorize>
						</c:otherwise>
					</c:choose>
				</sec:authorize>
				</td>
		</tr>
	</table><br />
	
	<div>
	<table class="reviewWrite">
		<tr>
			<th align="left">댓글수 #</th>
			<th style="text-align: right;">작성자&nbsp;&nbsp;:&nbsp;&nbsp;
				<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username"/>
			</sec:authorize>
			</th>
		</tr>
		<tr><td colspan="2" style=" border-top : 1px solid #cdd0d4;
	border-bottom : 1px solid #cdd0d4;">
		<form name="insertReview" action="review" method="post">
			<sec:authorize access="isAuthenticated()">
				<input  type="hidden" name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
			</sec:authorize>
			<br />
				<textarea class="reply" name="postreview_content" placeholder="댓글입력하기"></textarea>
				<input type="hidden" name="pg" value="${pg}" />
				<input type="hidden" name="post_num" value="${b.post_num}" />
				<input type="hidden" name="postreview_postnum" value="${b.post_num}" />
				<input type="button" class="button" value="쓰기" onclick="test3()" />
				<input type="reset" class="button" value="취소" />		
		</form>
		</td></tr>
		</table>
</div>

<br />
<div class="padding">
				<!-- <ol class="reviewList"> -->
					<table class="reviewWrite">
				<caption class="cap">댓글</caption>
				<c:forEach items="${reviewList}" var="reviewList">
						<tr>
							<th>작성자</th>
							<td rowspan="2">${reviewList.postreview_content}</td>
							<th>작성 날짜</th>
						</tr>
						<tr id="trtr">
							<td>${reviewList.postreview_usernum}</td>
							<td>${reviewList.postreview_regdate}</td>
						</tr>
				</c:forEach>
					</table>
				<!-- </ol> -->
			</div>
<br /><br />
<script>
function adjustHeight() {
	  var textEle = $('.textContent');
	  textEle[0].style.height = 'auto';
	  var textEleHeight = textEle.prop('scrollHeight');
	  textEle.css('height', textEleHeight);
	};

	adjustHeight(); // 함수를 실행하면 자동으로 textarea의 높이 조절

</script>
			<!-- ------------------------------------------------------------------------------------------------------------- -->
		</div>
		<footer>
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>