<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
<meta charset="UTF-8">
<title>기업 리뷰 소개</title>

<link href="${pageContext.request.contextPath}/resources/css/boarddongshin.css"
	rel="stylesheet" />

<link href="${pageContext.request.contextPath}/resources/css/button.css"
	rel="stylesheet" />
</head>
<body>
	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->
			<br> <input class="w-btn w-btn-green" type="button" value="소개"
				onclick="location.href='corpreviewintro?corpnum=${corplist.corp_num}'" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input class="w-btn w-btn-green"
				type="button" value="리뷰"
				onclick="location.href='corpreviewmain?corpreviewnum=${corplist.corp_num}'" />

			<input class="w-btn w-btn-green" type="button" value="이 회사 리뷰하기"
				style="float: right"
				onclick="location.href='corpreviewwriteform?corp=${corplist.corp_num}'" />
			<br> <br> <br> <br>

			<div class="category">
				<ul class="container">
					<h1 class="header">기업정보</h1>
					<br>
					<br>
					<table class="table-basic-infomation-primary">
						<colgroup>
							<col class="col-label">
							<col class="col-value">
							<col class="col-label">
							<col class="col-value">
						</colgroup>
						<tbody>

							<tr class="field">
								<th class="field-label">기업 이름</th>
								<td class="field-value">
									<div class="value-container">
										<div class="value">${corplist.corp_name}</div>
									</div>
								</td>
								<th class="field-label">사원수</th>
								<td class="field-value">
									<div class="value-container">
										<div class="values">
											<div class="value">${corplist.corp_emplcount}</div>
										</div>
									</div>
								</td>
							</tr>

							<tr class="field">
								<th class="field-label">기업분류</th>
								<td class="field-value">
									<div class="value-container">
										<div class="value">${corplist.corp_category}</div>
									</div>
								</td>
								<th class="field-label">설립일</th>
								<td class="field-value">
									<div class="value-container">
										<div class="values">
											<div class="value">${corplist.corp_madedate}</div>
										</div>
									</div>
								</td>
							</tr>

							<tr class="field">
								<th class="field-label">대졸초임</th>
								<td class="field-value">
									<div class="value-container">
										<div class="value">${corplist.corp_pay}</div>
									</div>
								</td>
								<th class="field-label">주소</th>
								<td class="field-value" colspan="3">
									<div class="value-container">
										<div class="value">${corplist.corp_locate}</div>
									</div>
								</td>
							</tr>

							<tr class="field">
								<th class="field-label">주요사업</th>
								<td class="field-value">
									<div class="value-container">
										<div class="value">${corplist.corp_detail}</div>
									</div>
								</td>
								<th class="field-label">홈페이지</th>
								<td class="field-value">
									<div class="value-container">
										<div class="value">
											<a href="${corplist.corp_addr}" target="_blank">${corplist.corp_addr}</a>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
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