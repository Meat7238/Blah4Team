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


	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="footer">
					<ul>
						<li><a href="notice">공지사항</a></li>
						<li><a href="#">사이트 도움말</a></li>
						<li><a href="https://kr.teamblind.com/setting/term">사이트
								이용약관</a></li>
						<li><a href="https://kr.teamblind.com/setting/privacy">개인정보취급방침</a></li>
						<li><a href="#">신고가이드</a>

							<div id="modal">
								<div class="modal_content">
									<h2>신고가이드</h2>
										<%@ include file="/WEB-INF/views/info/stipulation.jsp"%>
									<button type="button" id="modal_close_btn">신고 취소</button>
								</div>
								<div class="modal_layer"></div>
							</div> <script>
								document.getElementById("modal_opne_btn").onclick = function() {
									document.getElementById("modal").style.display = "block";
								}
								document.getElementById("modal_close_btn").onclick = function() {
									document.getElementById("modal").style.display = "none";
								}
							</script></li>
						<li><a href="adminLogin">관리자 페이지</a></li>
					</ul>
					<address>
						<a href="http://${path}/">Copyright &copy; blahblah All Rights
							Reserved. </a>
					</address>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>