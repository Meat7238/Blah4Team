<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

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

th.field-label {
	font-weight: bold;
	color: #fff;
	background: #292b33;
}
</style>
<link href="${path}/resources/css/star.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/resources/css/button.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/resources/css/corpreviewboard.css"
	rel="stylesheet" />

<meta charset="UTF-8">
<title>기업 리뷰 읽기</title>
</head>
<body>



	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->

			<br>
			<c:if test="${not empty corplist}">
				<input class="w-btn w-btn-green" type="button" value="소개"
					onclick="location.href='corpreviewintro?corpnum=${corplist.get(0).CORPREVIEW_CORPNUM}'" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="w-btn w-btn-green" type="button" value="리뷰"
					onclick="location.href='corpreviewmain?corpreviewnum=${corplist.get(0).CORPREVIEW_CORPNUM}'" />

				<br>


				<c:forEach var="corplist" items="${corplist}">


					<br>
					<br>
					<hr style="width: 80%; margin-left: auto; margin-right: auto;">
					<br>
					<br>

					<div style="width: 100%; display: flex;">
						<div class="company-infomation-row basic-infomation left"
							style="width: 50%;">
							<h2 class="header">
								기업리뷰 &nbsp;&nbsp;&nbsp;


								<c:choose>
									<c:when
										test="${corpreview_usernum == corplist.CORPREVIEW_USERNUM}">
										<input class="w-btn w-btn-green" type="button" value="삭제"
											onclick="alert('리뷰가 삭제되었습니다.');
								document.location.href='corpreviewdelete?corpreview_num=${corplist.CORPREVIEW_NUM}';" />
									</c:when>


									<c:otherwise>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<input class="w-btn w-btn-green" type="button" value="삭제"
												onclick="alert('리뷰가 삭제되었습니다.');
								document.location.href='corpreviewdelete?corpreview_num=${corplist.CORPREVIEW_NUM}';" />
										</sec:authorize>
									</c:otherwise>


								</c:choose>


								<c:if
									test="${corpreview_usernum != corplist.CORPREVIEW_USERNUM}">
									<input class="w-btn w-btn-green" type="button" value="신고"
										onclick="location.href='corpreviewreportwriteform?corpreviewnum=${corplist.CORPREVIEW_NUM}'" />
								</c:if>

							</h2>



							<div
								class="company-infomation-container basic-infomation-container left"
								style="width: 70%; float: right;">
								<table class="table-basic-infomation-primary">
									<colgroup>
										<col class="col-label" style="width: 30%;">
										<col class="col-value">
										<col class="col-label">
										<col class="col-value">
									</colgroup>
									<tbody>

										<!-- 	<tr class="field">
											<th class="field-label">항목별 평가</th>
											<td class="field-value"
												style="font-weight: bold; color: #fff; background: #292b33;" />
												</tr> -->
										<tr class="field">
											<th class="field-label">커리어 향상</th>
											<td class="field-value">
												<div class="value-container">
													<div class="value">
														<form name="corpreviewemain" class="corpreviewemain">
															<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 1}">
															★☆☆☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 2}">
															★★☆☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 3}">
															★★★☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 4}">
															★★★★☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 5}">
															★★★★★
														</c:if>
														</form>
													</div>
												</div>
											</td>
										</tr>

										<tr class="field">
											<th class="field-label">급여 및 복지</th>
											<td class="field-value">
												<div class="value-container">
													<div class="value">
														<form name="corpreviewemain" class="corpreviewemain">
															<c:if test="${corplist.CORPREVIEW_STARPOINT2 == 1}">
															★☆☆☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT2 == 2}">
															★★☆☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT2 == 3}">
															★★★☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT2 == 4}">
															★★★★☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT2 == 5}">
															★★★★★
														</c:if>
														</form>
													</div>
												</div>
											</td>

										</tr>

										<tr class="field">
											<th class="field-label">업무와 삶의 균형</th>
											<td class="field-value">
												<div class="value-container">
													<div class="value">
														<form name="corpreviewemain" class="corpreviewemain">
															<c:if test="${corplist.CORPREVIEW_STARPOINT3 == 1}">
															★☆☆☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT3 == 2}">
															★★☆☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT3 == 3}">
															★★★☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT3 == 4}">
															★★★★☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT3 == 5}">
															★★★★★
														</c:if>
														</form>
													</div>
												</div>
											</td>

										</tr>

										<tr class="field">
											<th class="field-label">사내문화</th>
											<td class="field-value">
												<div class="value-container">
													<div class="value">
														<form name="corpreviewemain" class="corpreviewemain">
															<c:if test="${corplist.CORPREVIEW_STARPOINT4 == 1}">
															★☆☆☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT4 == 2}">
															★★☆☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT4 == 3}">
															★★★☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT4 == 4}">
															★★★★☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT4 == 5}">
															★★★★★
														</c:if>
														</form>
													</div>
												</div>
											</td>

										</tr>

										<tr class="field">
											<th class="field-label">경영진</th>
											<td class="field-value">
												<div class="value-container">
													<div class="value">
														<form name="corpreviewemain" class="corpreviewemain">
															<c:if test="${corplist.CORPREVIEW_STARPOINT5 == 1}">
															★☆☆☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT5 == 2}">
															★★☆☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT5 == 3}">
															★★★☆☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT5 == 4}">
															★★★★☆
														</c:if>
															<c:if test="${corplist.CORPREVIEW_STARPOINT5 == 5}">
															★★★★★
														</c:if>
														</form>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="company-infomation-row basic-infomation right"
							style="width: 50%; margin-top: auto;">

							<div
								class="company-infomation-container basic-infomation-container right"
								style="width: 70%; float: left;">
								<table class="table-basic-infomation-primary">
									<colgroup>
										<col class="col-label" style="width: 30%;">
										<col class="col-value">
										<col class="col-label">
										<col class="col-value">
									</colgroup>
									<tbody>

										<tr class="field">
											<th class="field-label">기업 세부 리뷰</th>
											<td class="field-value"
												style="font-weight: bold; color: #fff; background: #292b33;" />
										<tr class="field">
											<th class="field-label">한줄평</th>
											<td class="field-value">
												<div class="value-container">
													<div class="value">${corplist.CORPREVIEW_CONCLUSION}</div>
												</div>
											</td>

										</tr>

										<tr class="field">
											<th class="field-label">장점</th>
											<td class="field-value">
												<div class="value-container">
													<div class="value">${corplist.CORPREVIEW_PROS}</div>
												</div>
											</td>

										</tr>

										<tr class="field">
											<th class="field-label">단점</th>
											<td class="field-value">
												<div class="value-container">
													<div class="value">${corplist.CORPREVIEW_CONS}</div>
												</div>
											</td>

										</tr>

										<tr class="field">
											<th class="field-label">평점</th>
											<td class="field-value">
												<div class="value-container">
													<div class="value">${(corplist.CORPREVIEW_STARPOINT1+corplist.CORPREVIEW_STARPOINT2+corplist.CORPREVIEW_STARPOINT3+corplist.CORPREVIEW_STARPOINT4+corplist.CORPREVIEW_STARPOINT5)/5}</div>
												</div>
											</td>

										</tr>

									</tbody>
								</table>
							</div>
						</div>


					</div>



				</c:forEach>
			</c:if>

			<c:if test="${empty corplist}">
				<script>
					alert('이전페이지로 돌아갑니다.');
					history.back();
				</script>
			</c:if>

			<br> <br>
			<!-- ------------------------------------------------------------------------------------------------------------- -->
		</div>
		<footer>
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>