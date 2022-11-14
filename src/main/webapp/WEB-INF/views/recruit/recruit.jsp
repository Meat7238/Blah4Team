<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
	rel="stylesheet">
	
<style TYPE="text/css">
.container, .container-md, .container-sm {
	max-width: 2500px;
}

.input-group {
	margin: 20px auto;
}

.search {
	margin-top: 50px;
}

.card, .card-img-top {
	padding: 20px;
}
.wrapper {
	max-width: 1080px; 
	margin: 20px auto;
}

.recruit-null {
	heigh: 1000px;
}

.bar {
	margin-left: auto;
	margin-right: auto;
}

.card {
	margin-bottom: 20px;
}

.btn-dark {
	background-color: $gray-800;
}



</style>
<title>블라블라 : 채용공고</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<div class="wrapper main-content">
		<form action="${root}recruitSelect"
			class="container main-content search" method="get">
			<div class="row justify-content-center">
				<div class="col-lg-12 bar">
					<div class="input-group">
						<input type="text" class="form-control" name="corp_name"
							placeholder="채용 공고를 검색할 기업을 입력하세요"
							aria-label="채용 공고를 검색할 기업을 입력하세요"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2">검색</button>
					</div>
				</div>
			</div>
		</form>
		
		<c:if test="${list == null }">
			<div class="row justify-content-center recruit-null">
				<div class="col-lg-12">
					<img src="${path}/resources/images/recruit-main.png"
							class="card-img-top" alt="채용공고">
				</div>
			</div>
		</c:if>
		<c:if test="${list != null }">
		<div class="container card-content">
			<div class="row justify-content-between">
				<c:forEach var="r" items="${list}">
					<div class="col-lg-4">
						<div class="card" style="width: 18rem;">
							<img src="${path}/resources/images/samsung.jpg"
								class="card-img-top" alt="삼성전자">
							<div class="card-body">
								<h5 class="card-title">${r.CORP_NAME}</h5>
								<p class="card-text">${r.RECRUIT_ENDDATE}</p>
								<p class="card-text">${r.RECRUIT_JOBGROUP}</p>
								<p class="card-text">${r.RECRUIT_CAREER}</p>
								<a href="${r.RECRUIT_LINK}" class="btn btn-dark">채용 사이트</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		</c:if>
	</div>

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	
</body>
</html>