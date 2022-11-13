<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link href="${path}/resources/css/star.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/button.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/corpreviewboard.css"
	rel="stylesheet" />

<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

.wrapper {
	display: flex;
	flex-direction: column;
	height: 100%;
}

.main-content {
	flex: 1;
}

footer {
	height: 60px;
}
</style>


<meta charset="UTF-8">
<title>기업 리뷰 작성</title>

<script type="text/javascript">
	function board_write() {
		//alert("쓰기")	;
		if (document.corpreviewwriteform.corpreview_starpoint1.value == "") {
			alert("항목별 평가를 입력해주세요");
		} else if (document.corpreviewwriteform.corpreview_starpoint2.value == "") {
			alert("항목별 평가를 입력해주세요");
		} else if (document.corpreviewwriteform.corpreview_starpoint3.value == "") {
			alert("항목별 평가를 입력해주세요");
		} else if (document.corpreviewwriteform.corpreview_starpoint4.value == "") {
			alert("항목별 평가를 입력해주세요");
		} else if (document.corpreviewwriteform.corpreview_starpoint5.value == "") {
			alert("항목별 평가를 입력해주세요");
		} else if (document.corpreviewwriteform.corpreview_conclusion.value == "") {
			alert("한줄평을 입력해주세요");
			document.corpreviewwriteform.corpreview_conclusion.focus();
		} else if (document.corpreviewwriteform.corpreview_pros.value == "") {
			alert("장점을 입력해주세요");
			document.corpreviewwriteform.corpreview_pros.focus();
		} else if (document.corpreviewwriteform.corpreview_cons.value == "") {
			alert("단점을 입력해주세요");
			document.corpreviewwriteform.corpreview_cons.focus();
		} else {
			document.corpreviewwriteform.submit();
			confirm('리뷰가 작성되었습니다.');
		}

	}
	//document.location.href ='corpreviewmain?corpreviewnum=${corpreview_corpnum}';
</script>
</head>
<body>
	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->

			<br> <br>
			<div class="category">
				<ul class="container">
					<form name="corpreviewwriteform" id="corpreviewwriteform"
						action="corpreview" method="post">
						<h2>기업 리뷰 작성</h2>

						<br> <br> <input type="hidden" name="corpreview_corpnum"
							value=${corpreview_corpnum } maxlength="100" size="65" /> <input
							type="hidden" name="corpreview_usernum"
							value=${corpreview_usernum } maxlength="100" size="65" />

						<h2>항목별 평가</h2>
						<br>
						<table style="width: 1000px;">
							<th style="width: 150px;">커리어 향상</th>
							<td><fieldset>
									<input type="radio" name="corpreview_starpoint1" value="5"
										id="rate1a"><label for="rate1a">★</label> <input
										type="radio" name="corpreview_starpoint1" value="4"
										id="rate2a"><label for="rate2a">★</label> <input
										type="radio" name="corpreview_starpoint1" value="3"
										id="rate3a"><label for="rate3a">★</label> <input
										type="radio" name="corpreview_starpoint1" value="2"
										id="rate4a"><label for="rate4a">★</label> <input
										type="radio" name="corpreview_starpoint1" value="1"
										id="rate5a"><label for="rate5a">★</label>
								</fieldset></td>
						</table>
						<br>

						<table style="width: 1000px;">
							<th style="width: 150px;">급여 및 복지</th>
							<td>
								<fieldset>
									<input type="radio" name="corpreview_starpoint2" value="5"
										id="rate1b"><label for="rate1b">★</label> <input
										type="radio" name="corpreview_starpoint2" value="4"
										id="rate2b"><label for="rate2b">★</label> <input
										type="radio" name="corpreview_starpoint2" value="3"
										id="rate3b"><label for="rate3b">★</label> <input
										type="radio" name="corpreview_starpoint2" value="2"
										id="rate4b"><label for="rate4b">★</label> <input
										type="radio" name="corpreview_starpoint2" value="1"
										id="rate5b"><label for="rate5b">★</label>
								</fieldset>
							</td>
						</table>
						<br>
						<table style="width: 1000px;">
							<th style="width: 150px;">업무와 삶의 균형</th>
							<td>
								<fieldset>
									<input type="radio" name="corpreview_starpoint3" value="5"
										id="rate1c"><label for="rate1c">★</label> <input
										type="radio" name="corpreview_starpoint3" value="4"
										id="rate2c"><label for="rate2c">★</label> <input
										type="radio" name="corpreview_starpoint3" value="3"
										id="rate3c"><label for="rate3c">★</label> <input
										type="radio" name="corpreview_starpoint3" value="2"
										id="rate4c"><label for="rate4c">★</label> <input
										type="radio" name="corpreview_starpoint3" value="1"
										id="rate5c"><label for="rate5c">★</label>
								</fieldset>
							</td>
						</table>
						<br>
						<table style="width: 1000px;">
							<th style="width: 150px;">사내 문화</th>
							<td>
								<fieldset>
									<input type="radio" name="corpreview_starpoint4" value="5"
										id="rate1d"><label for="rate1d">★</label> <input
										type="radio" name="corpreview_starpoint4" value="4"
										id="rate2d"><label for="rate2d">★</label> <input
										type="radio" name="corpreview_starpoint4" value="3"
										id="rate3d"><label for="rate3d">★</label> <input
										type="radio" name="corpreview_starpoint4" value="2"
										id="rate4d"><label for="rate4d">★</label> <input
										type="radio" name="corpreview_starpoint4" value="1"
										id="rate5d"><label for="rate5d">★</label>
								</fieldset>
							</td>
						</table>
						<br>
						<table style="width: 1000px;">
							<th style="width: 150px;">경영진</th>
							<td>
								<fieldset>
									<input type="radio" name="corpreview_starpoint5" value="5"
										id="rate1e"><label for="rate1e">★</label> <input
										type="radio" name="corpreview_starpoint5" value="4"
										id="rate2e"><label for="rate2e">★</label> <input
										type="radio" name="corpreview_starpoint5" value="3"
										id="rate3e"><label for="rate3e">★</label> <input
										type="radio" name="corpreview_starpoint5" value="2"
										id="rate4e"><label for="rate4e">★</label> <input
										type="radio" name="corpreview_starpoint5" value="1"
										id="rate5e"><label for="rate5e">★</label>
								</fieldset>
							</td>

						</table>
						<br> <br>
						<h2>리뷰 작성하기</h2>
						<br>
						<table style="width: 1000px;">
							<tr>
								<th style="width: 150px;">한줄평</th>
								<td><input type="text" name="corpreview_conclusion"
									placeholder="예 : 워라벨이 보장되는 회사" maxlength="100" size="65" /></td>
							</tr>
							<tr>
								<th style="width: 150px;">장점</th>
								<td><input type="text" name="corpreview_pros"
									placeholder="내 회사에서 근무하면서 가장 좋았던 점은 무엇인가요?" maxlength="200"
									size="65" /></td>
							</tr>
							<tr>
								<th style="width: 150px;">단점</th>
								<td><input type="text" name="corpreview_cons"
									placeholder="내 회사에서 근무하면서 가장 힘들었던 점은 무엇인가요?" maxlength="200"
									size="65" /></td>
							</tr>
							<tr>
								<td colspan="50"><input class="w-btn w-btn-green"
									type="button" value="완료" onclick="board_write()" /></td>
							</tr>
						</table>
						<br><br>
					</form>
				</ul>
			</div>
			<!-- ------------------------------------------------------------------------------------------------------------- -->
		</div>
		<footer>
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>