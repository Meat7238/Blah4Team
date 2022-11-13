<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link
	href="${pageContext.request.contextPath}/resources/css/writeform.css"
	rel="stylesheet" />
</head>
<body>
	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->
			</br>
			<div class="form_box">
				<form name="writeform"
					action="${pageContext.request.contextPath}/write" method="post">
					<table>
						<tr>
							<td><input class="input_field" type="text" name="post_title"
								placeholder="제목을 입력해주세요" /></td>
						</tr>
						<tr>
							<td><img alt="edit_bar"
								src="${pageContext.request.contextPath}/resources/images/editBar.png">
							</td>
						</tr>
						<tr>

							<td><select class="input_field" name="post_category">
									<option value="블라블라">블라블라</option>
									<option value="주식투자">주식투자</option>
									<option value="썸,연애">썸,연애</option>
									<option value="회사생활">회사생활</option>
									<option value="이직,커리어">이직,커리어</option>
									<option value="결혼,육아">결혼,육아</option>
									<option value="홍보">홍보</option>
									<option value="취미생활">취미생활</option>
									<option value="우리회사 채용해요">우리회사 채용해요</option>
							</select></td>
						</tr>
						<tr>
							<td><textarea class="textarea_field" name="post_content"
									placeholder="내용을 입력해주세요" rows="5" cols="50"></textarea></td>
						</tr>
						<tr>
							<td>
								<%-- <input type="hidden" name="writer" id="writer" value='<sec:authentication property="principal.username"/>'> --%>
								작성자 : <input name="writer" style="border: none"
								value='<sec:authentication property="principal.username"/>'
								readonly="readonly"> <input type="hidden"
								name="post_usernum" value="${user_num}" />
							</td>
						</tr>
					</table>
				</form>
			<div class="btn-holder">
				<button id="one" class="btn btn-1 hover-filled-opacity"
					onclick="post_write()">
					<span>쓰기</span>
				</button>
				<script type="text/javascript">
				function post_write() {
					if (document.writeform.post_title.value == "") {
					alert("제목을 입력하세요");
				} else if (document.writeform.post_category.value == "") {
					alert("카테고리를 입력하세요");
				} else if (document.writeform.post_content.value == "") {
					alert("내용을 입력하세요");
				} else if (document.writeform.writer.value == "") {
					alert("아이디를 입력하세요");
				} else {
					document.writeform.submit();
				}
				}</script>

			</div>
			<div class="btn-holder">
				<button id="two" class="btn btn-1 hover-filled-opacity"
					onclick="history.go(-1);">
					<span>이전 페이지</span>
				</button>
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