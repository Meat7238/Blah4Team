<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
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
				<h2>Admin Page > 📃 공지사항 관리 > 📖 세부사항 > ✏️ 공지사항 수정</h2>
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
						<form name="noticeUpdate" action="${path}/admin/noticeUpdate"
							method="post">

							<input type="hidden" name="notice_num" value="${p.notice_num}" />
							<input type="hidden" name="notice_regdate"
								value="${p.notice_regdate}" /> <input type="hidden"
								name="notice_readcount" value="${p.notice_readcount}" />
							<table>
								<tr>
								<thead>
									<th></th>
								</thead>
								<tr>
									<th width=10%>제목</th>
									<td><input type="text" name="notice_title" style="width:100%;height:100px;font-size:30px;border:none;" value="${p.notice_title}" /></td>
								</tr>
								<tr>
									<th>분류</th>
									<td><input type="text" name="notice_category"
										style="width:100%;height:50px;font-size:30px;border:none;" value="${p.notice_category}" /></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea rows="5" cols="50" style="width:100%;height:100px;font-size:30px;border:none;" name="notice_content"
											value="">${p.notice_content}</textarea></td>
								<tr>
									<th>작성자</th>
									<td><sec:authentication property="principal.username" /></td>
								</tr>
								<tr>
									<th colspan="2" align="center">
									<div class="btn-holder">
										<button class="btn btn-1 hover-filled-opacity"
											onclick="updateMsg()">
											<span >수정하기</span>
										</button>
									</div> 
										<script>
											function updateMsg() {
												if (document.noticeUpdate.notice_title.value == "") {
													alert("제목을 입력하세요");
												} else if (document.noticeUpdate.notice_category.value == "") {
													alert("카테고리를 입력하세요");
												} else if (document.noticeUpdate.notice_content.value == "") {
													alert("내용을 입력하세요");
												} else if (confirm("수정된 내용을 제출하시겠습니까??") == true) { //확인
													document.noticeUpdate
															.submit();
													alert("수정완료했습니다.");
												}
											}
										</script> </th>
								</tr>
							</table>
						</form>
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