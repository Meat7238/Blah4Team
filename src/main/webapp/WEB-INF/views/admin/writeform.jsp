<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 작성</title>
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
				<h2>Admin Page > 📃 공지사항 관리 > ✏️ 공지사항 작성</h2>
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
						<form name="writeform" action="writeform" method="post">
		<table width="850">
			<tr><thead>
			<th></th>
			</thead>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="notice_title" placeholder="제목입력칸!" style="width:100%;height:100px;font-size:30px;border:none;" /></td>
			</tr>
			<tr>
				<th style="width:10%;" >카테고리 </th>
				<td><input type="text" name="notice_category"placeholder="카테고리!" style="width:100%;height:50px;font-size:30px;border:none;" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="notice_content" rows="5" cols="50" placeholder="제목입력칸!" style="width:100%;height:100px;font-size:30px;border:none;"></textarea>
				</td>
			</tr>
			<tr>
				<!-- <th>작성자</th> -->
				<%-- <td><input type="hidden" name="notice_adminnum" maxlength="5"
					size="12" value=${admin_id} />${admin_id}</td> --%>
			</tr>
			<tr>
				<th colspan="2">
				<div class="btn-holder">
				<button onclick="erchk()" class="btn btn-1 hover-filled-opacity">
				<span>글 등록</span>
				</button>
				</div>
				<!-- <input type="submit"  value="글 등록" > -->
				<script>
					function erchk() {
					   document.writeform.submit();
				</script>
				 </th>
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