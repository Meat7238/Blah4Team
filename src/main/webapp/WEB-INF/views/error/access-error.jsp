<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>  
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

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;800&display=swap')
	;
.container, .container-md, .container-sm{
	max-width:2080px;
}
html,body{
width: 100%; height:100%;
}
.wrapper{
display:flex;
flex-direction: column;
height: 100%;
}
.main-content{
flex:1;
}
footer{
height:60px;
}
.alert {
	width: 800px;
	margin: auto;
	margin-top: 100px;
}

</style>

<title>블라블라 :: 권한 없는 페이지</title>
</head>
<body>

<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<div class="alert alert-secondary d-flex align-items-center" role="alert">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="currentColor"
					class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2"
					viewBox="0 0 16 16" role="img" aria-label="Warning:">
    				<path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
				 </svg>
				<div><p>권한이 없는 사용자입니다.</p></div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	 <%@ include file="/WEB-INF/views/layout/header.jsp"%>
	 
</body>
</html>