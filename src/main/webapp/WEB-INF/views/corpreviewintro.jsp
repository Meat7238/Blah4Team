<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 리뷰 소개</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<input type="button" value="소개"
		onclick="location.href='corpreviewintro?corpnum=${corplist.corp_num}'" />
	<input type="button" value="리뷰"
		onclick="location.href='corpreviewmain?corpreviewnum=${corplist.corp_num}'" />

	<div class="company-infomation-row basic-infomation">
		<h2 class="header">기업정보</h2>
		<div class="company-infomation-container basic-infomation-container">
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
		</div>
	</div>


	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>