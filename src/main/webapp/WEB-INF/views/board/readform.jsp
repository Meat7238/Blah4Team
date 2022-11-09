<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function test3() {
		if (document.insertReview.postreview_content.value == "") {
			alert("내용을 입력하세요");
		} else {
			document.insertReview.submit();
		}
	}   
</script>

<style>
#modal {
          display: none;
          position:relative;
          width:100%;
          height:100%;
          z-index:1;
}
        
#modal h2 {
          margin:0;
}

#modal button {
          display:inline-block;
          width:100px;
          margin-left:calc(100% - 100px - 10px);
}
        
#modal .modal_content {
          width:80%;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          border:2px solid #666;
}
        
#modal .modal_layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
}   
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
			<td width="20%">${b.post_usernum}</td>
			<td>${b.post_category}</td>
			<td width="15%">${b.post_regdate}</td>
			<td width="15%">조회수 ${b.post_readcount}</td>
		</tr>

		<tr>
			<td colspan="4"><textarea rows="10" cols="100"
					readonly="readonly">${b.post_content}</textarea></td>
		</tr>

		<tr>
			<td colspan="4" align="right"><input type="button" value="수정"
				onclick="location.href='${pageContext.request.contextPath}/updateform?post_num=${b.post_num}&pg=${pg}';" />
				<input type="button" value="삭제"
				onclick="location.href='${pageContext.request.contextPath}/delete?post_num=${b.post_num}&pg=${pg}';" />
				<div id="root">
					<button type="button" id="modal_opne_btn">게시글 신고하기</button>
				</div>
				<div id="modal">
					<div class="modal_content">
        				<h2>게시글 신고</h2>
        				<p>
        					<%@ include file="/WEB-INF/views/info/stipulation.jsp"%>
        				</p>
        				<form action="reportForm" method="post">
        				<input type="hidden" name="pg" value="${pg}"/>
        				<input type="hidden" name="post_title" value="${b.post_title}"/>
						<input type="hidden" name="post_num" value="${b.post_num}"/>
						<input type="hidden" name="post_usernum" value="${b.post_usernum}"/>
        				<input type="hidden" name="post_category" value="${b.post_category}"/>
        				<input type="submit" id="modal_report_btn" value="신고하러가기" />
						</form>
						<button type="button" id="modal_close_btn">신고 취소</button>
				</div>
				<div class="modal_layer"></div></div>
				<script>
					document.getElementById("modal_opne_btn").onclick = function() {
					document.getElementById("modal").style.display="block";
				}
					document.getElementById("modal_close_btn").onclick = function() {
					document.getElementById("modal").style.display="none";
				}
				</script>

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
		<form name="insertReview" action="review" method="post">

			<textarea name="postreview_content" rows="5" cols="50"
				placehoder="댓글입력하기"></textarea>
			<input type="hidden" name="pg" value="${pg}" />
			<input type="hidden" name="post_num" value="${b.post_num}" />
			<input type="hidden" name="postreview_usernum" value="${b.post_usernum}" />
			<input type="hidden" name="postreview_postnum" value="${b.post_num}" />
			<input type="button" value="쓰기" onclick="test3()" />
			<input type="reset" value="취소" />

		</form>

	</div>

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>