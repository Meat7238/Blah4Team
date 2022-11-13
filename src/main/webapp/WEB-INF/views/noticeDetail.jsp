<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 세부내용</title>

<link href="${pageContext.request.contextPath}/resources/css/home.css"
	rel="stylesheet" />
<style type="text/css">

/* -------------------------버튼 관련------------------------- */
:active, :hover, :focus {
	outline: 0 !important;
	outline-offset: 0;
}

::before, ::after {
	position: absolute;
	content: "";
}

.btn-1::before {
	background-color: rgb(28, 31, 30);
	transition: 0.3s ease-out;
}

.btn-1 span {
	color: rgb(255, 255, 255);
	border: 1px solid rgb(28, 31, 30);
	transition: 0.2s 0.1s;
}

.btn-1 span:hover {
	color: rgb(28, 31, 30);
	transition: 0.2s 0.1s;
}

.btn.hover-filled-opacity::before {
	top: 0;
	bottom: 0;
	right: 0;
	height: 100%;
	width: 100%;
	opacity: 1;
}

.btn.hover-filled-opacity:hover::before {
	opacity: 0;
}

.btn {
	position: relative;
	display: inline-block;
	width: auto;
	height: auto;
	background-color: transparent;
	border: none;
	cursor: pointer;
	margin: 0px 25px 12px;
	min-width: 150px;
}

.btn span {
	position: relative;
	display: inline-block;
	font-size: 14px;
	font-weight: bold;
	letter-spacing: 2px;
	text-transform: uppercase;
	top: 0;
	left: 0;
	width: 100%;
	padding: 15px 20px;
	transition: 0.3s;
}

.btn-holder {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	max-width: 100px;
	margin: 10px auto 0px;
}
/* -------------------------버튼 관련 끝 ------------------------- */
</style>
</head>
<body>
	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->
			<div class="btn-holder">
				<button class="btn btn-1 hover-filled-opacity"
					onclick="location.href='${path}/notice'">
					<span>공지 목록 돌아가기</span>
				</button>
			</div>

			<table width="700" border="1">
				<thead>
					<tr>
						<th colspan="4">${p.notice_title}</th>
					</tr>
				</thead>
				<tr>
					<td width="20%">${p.notice_num}</td>
					<td>${p.notice_category}</td>
					<td width="15%">${p.notice_regdate}</td>
					<td width="15%">조회수 ${p.notice_readcount}</td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="10" cols="100"
							readonly="readonly">${p.notice_content}</textarea></td>
				</tr>
			</table>





			<!-- ------------------------------------------------------------------------------------------------------------- -->
		</div>
		<footer>
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>