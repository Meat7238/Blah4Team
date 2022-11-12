<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 세부내용</title>
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" />
</head>
<body>
	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->
			<div class="tabs">
				<h2>Admin Page > 📃 공지사항 관리 > 📖 세부사항</h2>
				<div class="tab-header">
					<div class="active">
						<div class="btn-holder">
							<button class="btn btn-1 hover-filled-opacity"
								onclick="location.href='${path}/admin/notice'">
								<span>뒤로가기</span>
							</button>
						</div>
					</div>
				</div>
				<div class="tab-indicator"></div>
				<div class="tab-content">
					<div class="active">
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

							<tr>
								<td colspan="4" align="right"><div class="btn-holder">
										<button class="btn btn-1 hover-filled-opacity"
											onclick="location.href='${pageContext.request.contextPath}/admin/noticeUpdate?notice_num=${p.notice_num}'">
											<span>수정하기</span>
										</button>
									</div>
									<div class="btn-holder">
										<button class="btn btn-1 hover-filled-opacity"
											onclick="test2('${path}','${ p.notice_num }')">
											<span style="color: white;">삭제하기</span>
										</button>
									</div> <script>
										function test2(str, num) {
											if (confirm("정말 삭제하시겠습니까??") == true) { //확인
												location.href = str
														+ '/admin/notice/delete?notice_num='
														+ num;
												alert("삭제완료했습니다.");
											} else { //취소
												return false;
											}
										}
									</script></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- ------------------------------------------------------------------------------------------------------------- -->
		</div>
		<footer>
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		</footer>
	</div>



</body>
</html>