<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<link href="${path}/resources/css/footer.css" rel="stylesheet" />

</head>
<body>
	<div class="wrapper">
	</div>
	
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="footer">
					<ul>
						<li><a href="notice">공지사항</a></li>
						<li><a href="#">사이트 도움말</a></li>
						<li><a href="">사이트 이용약관</a></li>
						<li><a href="#">사이트 운영원칙</a></li>
						<li><a href="#">개인정보취급방침</a></li>
						<li><a href="#">책임의 한계와 법적고지</a></li>
						<li><a href="admin">관리자 페이지</a></li>
					</ul>
					<address>

						<a href="http://${path}/">Copyright &copy; blahblah
								All Rights Reserved. </a>

					</address>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>