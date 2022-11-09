<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link href="${path}/resources/css/star.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>기업 리뷰 작성</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<h2>기업 리뷰 작성</h2>

	<input type="text" name="corpname" placeholder="회사명" maxlength="100" size="65" />

	<h2>항목별 평가</h2>

	<form name="corpreviewstar" id="corpreviewstar" method="post">

		<fieldset>
		
			<span class="text-bold">커리어 향상</span> 
			<input type="radio" name="reviewStar1" value="5" id="rate1a"><label for="rate1a">★</label>
			<input type="radio" name="reviewStar1" value="4" id="rate2a"><label for="rate2a">★</label>
			<input type="radio" name="reviewStar1" value="3" id="rate3a"><label for="rate3a">★</label>
			<input type="radio" name="reviewStar1" value="2" id="rate4a"><label for="rate4a">★</label>
			<input type="radio" name="reviewStar1" value="1" id="rate5a"><label for="rate5a">★</label>
		
		</fieldset><br>

		<fieldset>
			<span class="text-bold">급여 및 복지</span> 
			<input type="radio"	name="reviewStar2" value="5" id="rate1b"><label for="rate1b">★</label>
			<input type="radio" name="reviewStar2" value="4" id="rate2b"><label for="rate2b">★</label>
			<input type="radio" name="reviewStar2" value="3" id="rate3b"><label for="rate3b">★</label>
			<input type="radio" name="reviewStar2" value="2" id="rate4b"><label for="rate4b">★</label>
			<input type="radio" name="reviewStar2" value="1" id="rate5b"><label for="rate5b">★</label>
		</fieldset><br>

		<fieldset>
			<span class="text-bold">업무와 삶의 균형</span>
			<input type="radio"	name="reviewStar3" value="5" id="rate1c"><label for="rate1c">★</label>
			<input type="radio" name="reviewStar3" value="4" id="rate2c"><label for="rate2c">★</label>
			<input type="radio" name="reviewStar3" value="3" id="rate3c"><label for="rate3c">★</label>
			<input type="radio" name="reviewStar3" value="2" id="rate4c"><label for="rate4c">★</label>
			<input type="radio" name="reviewStar3" value="1" id="rate5c"><label for="rate5c">★</label>
		</fieldset><br>

		<fieldset>
			<span class="text-bold">사내 문화</span> 
			<input type="radio"	name="reviewStar4" value="5" id="rate1d"><label for="rate1d">★</label>
			<input type="radio" name="reviewStar4" value="4" id="rate2d"><label for="rate2d">★</label>
			<input type="radio" name="reviewStar4" value="3" id="rate3d"><label for="rate3d">★</label>
			<input type="radio" name="reviewStar4" value="2" id="rate4d"><label for="rate4d">★</label>
			<input type="radio" name="reviewStar4" value="1" id="rate5d"><label for="rate5d">★</label>
		</fieldset><br>

		<fieldset>
			<span class="text-bold">경영진</span>
			<input type="radio"	name="reviewStar5" value="5" id="rate1e"><label for="rate1e">★</label>
			<input type="radio" name="reviewStar5" value="4" id="rate2e"><label for="rate2e">★</label>
			<input type="radio" name="reviewStar5" value="3" id="rate3e"><label for="rate3e">★</label>
			<input type="radio" name="reviewStar5" value="2" id="rate4e"><label for="rate4e">★</label>
			<input type="radio" name="reviewStar5" value="1" id="rate5e"><label for="rate5e">★</label>
		</fieldset><br>

	</form>

	<h2>리뷰 작성하기</h2>
	<h2>작성자 정보</h2>

	<form name="corpreview" id="corpreview" action="write.htm" method="post">

		<table width="850">
			<tr>
				<th> 한줄평 </th>
				<td><input type="text" name="shortreview"
					placeholder="예 : 워라벨이 보장되는 회사" maxlength="100" size="65" /></td>
			</tr>

			<tr>
				<th> 장점 </th>
				<td><input type="text" name="pros"
					placeholder="내 회사에서 근무하면서 가장 좋았던 점은 무엇인가요?" maxlength="200"
					size="65" /></td>
			</tr>
			<tr>
				<th> 단점 </th>
				<td><input type="text" name="cons"
					placeholder="내 회사에서 근무하면서 가장 힘들었던 점은 무엇인가요?" maxlength="200"
					size="65" /></td>
			</tr>
		</table>

		<table width="850">
			<tr>
				<th>인증 이메일</th>
				<td><input type="text" name="shortreview"
					placeholder="happy@naver.com" maxlength="100" size="65" /></td>
			</tr>

			<tr>
				<th>근무 시작일</th>
				<td><input type="text" name="pros"
					placeholder="1996.02.05" maxlength="200"
					size="65" /></td>
			</tr>
			<tr>
				<th>근무 종료일</th>
				<td><input type="text" name="cons"
					placeholder="2002.11.08" maxlength="200"
					size="65" /></td>
			</tr>
			<tr>
				<th>직군</th>
				<td><input type="text" name="shortreview"
					placeholder="IT" maxlength="100" size="65" /></td>
			</tr>

			<tr>
				<th>근무지역</th>
				<td><input type="text" name="pros"
					placeholder="춘천" maxlength="200"
					size="65" /></td>
			</tr>
			<tr>
			<tr>
				<td colspan="50"><input type="button" value="완료" onclick="board_write()" /></td>
			</tr>
		</table>
	</form>

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>