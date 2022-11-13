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
<title>Insert title here</title>
<script type="text/javascript">
	function btn1() {
		if (document.reportcrform.reportcr_content.value == "") {
			alert("신고 사유를 입력하세요");
		} else {
			document.reportcrform.submit();
			alert("신고가 완료되었습니다!!");
		}
	}

	function btn2() {
		history.back();
	}

	function btn3() {
		window.close();
	}
</script>

<style type="text/css">
input[type=text] {
	width: 100%;
	border: 2px solid #aaa;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: .3s;
}

input[type=text]:focus {
	border-color: dodgerBlue;
	box-shadow: 0 0 8px 0 dodgetBlue;
}

.title {
	padding: .43em 0em .35em .7em;
	margin: 2em 0;
	font-weight: bold;
	color: #F9FFFF;
	background: #6e6e6e;
	border-left: solid 10px #000000;
}

.box {
	padding: 1em 1em;
	margin: 2em 0;
	font-weight: bold;
	color: #969696;
	background: #FFF;
	border: solid 3px #c8c8c8;
	border-radius: 10px;
}
</style>
</head>
<body>


	<div class="title">
		<h2>게시글 신고하기</h2>
	</div>
	<table border="1">
		<tr>
			<th>신고할 기업리뷰 번호</th>
			<th>신고할 기업리뷰 한줄평</th>
			<th>신고할 기업리뷰 장점</th>
			<th>신고할 기업리뷰 단점</th>
		</tr>
		<tr>
			<td>${corpreview_num}</td>
			<c:forEach var="corplist" items="${corplist}">
				<td>${corplist.CORPREVIEW_CONCLUSION}</td>
				<td>${corplist.CORPREVIEW_PROS}</td>
				<td>${corplist.CORPREVIEW_CONS}</td>
			</c:forEach>
		</tr>
	</table>

	<div class="box">
		<p>신고 유형을 선택하고 신고 사유를 정확하게 적어주세요.</p>
		<p>스팸, 음란물, 성격에맞지않는글, 과도한욕설, 광고, 사회분위기를 어지럽히는 글</p>
	</div>

	<form name="reportcrform" action="corpreviewreportwrite" method="post">
		<h4>신고 유형</h4>
		<select name="reportcr_type">
			<option value="0">스팸</option>
			<option value="1">음란물</option>
			<option value="2">성격에 맞지 않는 글</option>
			<option value="3">과도한 욕설</option>
			<option value="4">광고</option>
			<option value="5">사회 분위기를 어지럽히는 글</option>
		</select><br /> <br /> <br />
		<h4>신고 사유</h4>
		<input type="text" name="reportcr_content"
			placeholder="신고 사유를 입력해주세요." /> <input type="hidden"
			name="reportcr_usernum" value="${corpreview_usernum}" /> <input
			type="hidden" name="reportcr_corpreviewnum" value="${corpreview_num}" />
		<input type="button" value="신고하기" onclick="btn1()" /> <input
			type="button" value="신고취소" onclick="btn2()" /> <input type="button"
			value="약관보기" onclick="btn3()" />
	</form>

</body>
</html>