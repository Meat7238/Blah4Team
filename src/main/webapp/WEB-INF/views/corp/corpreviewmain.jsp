<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link href="${path}/resources/css/star.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>기업 리뷰 읽기</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<c:if test="${not empty corplist}">
		<input type="button" value="소개"
			onclick="location.href='corpreviewintro?corpnum=${corplist.get(0).CORPREVIEW_CORPNUM}'" />
		<input type="button" value="리뷰"
			onclick="location.href='corpreviewmain?corpreviewnum=${corplist.get(0).CORPREVIEW_CORPNUM}'" />


		<c:forEach var="corplist" items="${corplist}">
			<div class="company-infomation-row basic-infomation left">
				<h2 class="header">
					기업리뷰&nbsp;&nbsp;&nbsp;
					<c:if test="${corpreview_usernum == corplist.CORPREVIEW_USERNUM}">
						<input type="button" value="삭제"
							onclick="alert('리뷰가 삭제되었습니다.');
								document.location.href='corpreviewdelete?corpreview_num=${corplist.CORPREVIEW_NUM}';
							 " />

					</c:if>
					<c:if test="${corpreview_usernum != corplist.CORPREVIEW_USERNUM}">
						<input type="button" value="신고"
							onclick="location.href='corpreviewreportwriteform?corpreviewnum=${corplist.CORPREVIEW_NUM}'" />


					</c:if>
				</h2>

				<div
					class="company-infomation-container basic-infomation-container left">
					<table class="table-basic-infomation-primary">
						<colgroup>
							<col class="col-label">
							<col class="col-value">
							<col class="col-label">
							<col class="col-value">
						</colgroup>
						<tbody>

							<tr class="field">
								<th class="field-label">항목별 평가</th>
								<td class="field-value">
									<div class="value-container">
										<div class="value"></div>
									</div>
								</td>
							<tr class="field">
								<th class="field-label">커리어 향상</th>
								<td class="field-value">
									<div class="value-container">
										<div class="value">
											<form name="corpreviewemain" class="corpreviewemain">
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 1}">
													<th class="corpreviewemain">★☆☆☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 2}">
													<th class="corpreviewemain">★★☆☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 3}">
													<th class="corpreviewemain">★★★☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 4}">
													<th class="corpreviewemain">★★★★☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 5}">
													<th class="corpreviewemain">★★★★★</th>
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
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 1}">
													<th class="corpreviewemain">★☆☆☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 2}">
													<th class="corpreviewemain">★★☆☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 3}">
													<th class="corpreviewemain">★★★☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 4}">
													<th class="corpreviewemain">★★★★☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 5}">
													<th class="corpreviewemain">★★★★★</th>
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
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 1}">
													<th class="corpreviewemain">★☆☆☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 2}">
													<th class="corpreviewemain">★★☆☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 3}">
													<th class="corpreviewemain">★★★☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 4}">
													<th class="corpreviewemain">★★★★☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 5}">
													<th class="corpreviewemain">★★★★★</th>
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
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 1}">
													<th class="corpreviewemain">★☆☆☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 2}">
													<th class="corpreviewemain">★★☆☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 3}">
													<th class="corpreviewemain">★★★☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 4}">
													<th class="corpreviewemain">★★★★☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 5}">
													<th class="corpreviewemain">★★★★★</th>
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
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 1}">
													<th class="corpreviewemain">★☆☆☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 2}">
													<th class="corpreviewemain">★★☆☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 3}">
													<th class="corpreviewemain">★★★☆☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 4}">
													<th class="corpreviewemain">★★★★☆</th>
												</c:if>
												<c:if test="${corplist.CORPREVIEW_STARPOINT1 == 5}">
													<th class="corpreviewemain">★★★★★</th>
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

			<div class="company-infomation-row basic-infomation right">

				<div
					class="company-infomation-container basic-infomation-container right">
					<table class="table-basic-infomation-primary">
						<colgroup>
							<col class="col-label">
							<col class="col-value">
							<col class="col-label">
							<col class="col-value">
						</colgroup>
						<tbody>
							<tr class="field">
								<th class="field-label">기업 세부 리뷰</th>
								<td class="field-value">
									<div class="value-container">
										<div class="value"></div>
									</div>
								</td>

							</tr>
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

		</c:forEach>
	</c:if>

	<c:if test="${empty corplist}">
		<script>
			alert('이전페이지로 돌아갑니다.');
			history.back();
		</script>
	</c:if>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>