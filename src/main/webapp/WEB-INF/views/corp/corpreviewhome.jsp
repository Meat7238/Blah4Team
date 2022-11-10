<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업리뷰 메뉴 클릭하면 뜨는 창</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<h1>진짜 현직자들의 회사 리뷰</h1>
	<br>
	<h2>실제 직원들이 평가하는 연봉과 복지는 어떤지 확인해보세요</h2>

	<form action="corpreviewhome" method="post">
		<input type="text" name="keyvalue"> <input type="submit"
			value="검색">
	</form>

	<table border="2" width="1500">

		<c:forEach var="c" items="${ corplist }">
			<tr>
				<th width="80">기업 이름</th>
				<th width="200">홈페이지</th>
				<th width="80">기업 분류</th>
				<th width="80">설립 날짜</th>
				<th width="80">근무자 수</th>
				<th width="80">초임 연봉</th>
				<th width="300">기업 주소</th>
				<th width="500">세부 사항</th>

			</tr>
			<tr>

				<td><a href="corpreviewintro?corpnum=${c.corp_num}">${c.corp_name}</a></td>
				<td>${c.corp_addr}</td>
				<td>${c.corp_category}</td>
				<td>${c.corp_madedate}</td>
				<td>${c.corp_emplcount}</td>
				<td>${c.corp_pay}</td>
				<td>${c.corp_locate}</td>
				<td>${c.corp_detail}</td>
			</tr>
		</c:forEach>
	</table>

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

</body>
</html>