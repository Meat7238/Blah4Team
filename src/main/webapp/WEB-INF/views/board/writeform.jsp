<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function post_write() {
		if (document.writeform.post_title.value == "") {
			alert("제목을 입력하세요");
		} else if (document.writeform.post_category.value == "") {
			alert("카테고리를 입력하세요");
		} else if (document.writeform.post_content.value == "") {
			alert("내용을 입력하세요");
		} else if (document.writeform.writer.value == "") {
			alert("아이디를 입력하세요");
		} else {
			document.writeform.submit();
		}
	}
</script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;800&display=swap');

* {
	box-sizing: border-box;
}

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
	padding: 30px 0;
}

table {
	position: relative;
	align-content: center;
	align-items: center;
	display: table;
	margin: auto;
	cellpadding: "3";
	border: 20px #a39485 solid;
	font-size: 14px;
	box-shadow: 0 2px 20px rgba(0, 0, 0, .50);
	width: 40%;
	height: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
	font-style: font-family:"Raleway";
	
}

img {
	width: 100%;
	height: 5%;
}

thead {
	font-weight: bold;
	color: #fff;
	background: #292b33;
}

input {
	width: 100%;
	height: 30%;
}

.form_box {
	/* background-color: #ffffff;
	margin: 10px;
	border-radius: 4px;
	border: 1px solid #ddd;
	padding: 10px; */
}

.input_field {
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 4px;
	height: 50px;
	width: 100%;
	margin: 3px 0;
	font-size: 14px;
}

.textarea_field {
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 4px;
	margin: 3px 0;
	font-size: 14px;
	width: 100%;
	height: 250px;
}

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

			</br>


			<form name="writeform"
				action="${pageContext.request.contextPath}/write" method="post">
				<div class="form_box">
					<table>
						<tr>
							<td><input class="input_field" type="text" name="post_title"
								placeholder="제목을 입력해주세요" /></td>
						</tr>
						<tr>
							<td><img alt="edit_bar"
								src="${pageContext.request.contextPath}/resources/images/editBar.png">
								</td>
						</tr>
						<tr>

							<td><select class="input_field" name="post_category">
									<option value="블라블라">블라블라</option>
									<option value="주식투자">주식투자</option>
									<option value="썸,연애">썸,연애</option>
									<option value="회사생활">회사생활</option>
									<option value="이직,커리어">이직,커리어</option>
									<option value="결혼,육아">결혼,육아</option>
									<option value="홍보">홍보</option>
									<option value="취미생활">취미생활</option>
									<option value="우리회사 채용해요">우리회사 채용해요</option>
							</select></td>
						</tr>
						<tr>
						<td>
						<textarea class="textarea_field" name="post_content"
									placeholder="내용을 입력해주세요" rows="5" cols="50"></textarea>
						</td>
						</tr>
						<tr>
							<td>
								<%-- <input type="hidden" name="writer" id="writer" value='<sec:authentication property="principal.username"/>'> --%>
								작성자 : <input name="writer" style="border: none"
								value='<sec:authentication property="principal.username"/>'
								readonly="readonly"> <input type="hidden"
								name="post_usernum" value="${user_num}" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="btn-holder">
									<button class="btn btn-1 hover-filled-opacity"
										onclick="post_write()">
										<span>쓰기</span>
									</button>
								</div>
								<div class="btn-holder">
									<button class="btn btn-1 hover-filled-opacity"
										onclick="location.href='javascript:history.back();'">
										<span>이전 페이지</span>
									</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
			<!-- ------------------------------------------------------------------------------------------------------------- -->
		</div>
		<footer>
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		</footer>
	</div>

</body>
</html>