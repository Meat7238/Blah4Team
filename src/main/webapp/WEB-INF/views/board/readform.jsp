<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function test3() {
		if (document.insertReview.postreview_content.value == "") {
			alert("내용을 입력하세요");
		} else {
			document.insertReview.submit();
		}
	}
	
	function reportpop(){
		var popUrl = "stipulation"
		var popOption="width = 800px, height=600px, top=300px, left=300px, scrollbars=yes";
		window.open(popUrl, "title", popOption);
	}

</script>

<style>
   
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<h2>글 읽기</h2>
	<a href="board?pg=${pg}">게시판 홈</a>
	<table width="700">
		<tr>
			<th colspan="4">${b.post_title}</th>
		</tr>

		<tr>
			<td width="20%">${user_id}</td>
			<td>${b.post_category}</td>
			<td width="15%">${b.post_regdate}</td>
			<td width="15%">조회수 ${b.post_readcount}</td>
		</tr>

		<tr>
			<td colspan="4"><textarea rows="10" cols="100"
					readonly="readonly">${b.post_content}</textarea></td>
		</tr>

		<tr>
		<%-- <sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user"/>
			<c:if test="${user.권한 eq '관리자'}">
			...인증되고 인가된 사용자에게 표출할 영역
			</c:if>
		</sec:authorize> --%>
		
			<td colspan="4" align="right">
			
			<sec:authentication property="principal" var="pinfo"/>
			<sec:authorize access="isAuthenticated()">
			<c:if test="${pinfo.username eq user_id }">
				<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/updateform?post_num=${b.post_num}&pg=${pg}';" />
				<input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/delete?post_num=${b.post_num}&pg=${pg}';" />
			</c:if>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/delete?post_num=${b.post_num}&pg=${pg}';" />
			</sec:authorize>
			
			<form name="form">
				<input type="hidden" name="pg" value="${pg}"/>
				<input type="hidden" id="post_title" name="post_title" value="${b.post_title}"/>
				<input type="hidden" id="post_num" name="post_num" value="${b.post_num}"/>
				<input type="hidden" id="post_usernum" name="post_usernum" value="${b.post_usernum}"/>
				<input type="hidden" id="post_category" name="post_category" value="${b.post_category}"/>
				<input type="button" value="게시글 신고" onclick="reportpop(this.form)"/>
			</form>
			</td>
		</tr>
	</table>

	<div id="postReview">
		<h2>댓글</h2>
		<br />
		<ol class="reviewList">
			<c:forEach items="${reviewList}" var="reviewList">
				<li>
					<p>
						작성자 : ${reviewList.postreview_usernum}<br /> 작성 날짜 :
						${reviewList.postreview_regdate}
					</p>

					<p>${reviewList.postreview_content}</p>
				</li>
				<br />
				<br />
			</c:forEach>
		</ol>

	</div>

	<div>
		<h2>댓글 작성하기</h2>
		<h5>작성자</h5>
		
		<form name="insertReview" action="review" method="post">
					<sec:authorize access="isAuthenticated()">
		
			<input name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
			</sec:authorize>
			<br />
			<textarea name="postreview_content" rows="5" cols="50"
				placeholder="댓글입력하기"></textarea>
			<input type="hidden" name="pg" value="${pg}" />
			<input type="hidden" name="post_num" value="${b.post_num}" />
			<input type="hidden" name="postreview_postnum" value="${b.post_num}" />
			<input type="button" value="쓰기" onclick="test3()" />
			<input type="reset" value="취소" />

		</form>

	</div>

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>