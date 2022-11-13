<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function post_update(){
		if(document.updateform.post_title.value==""){
			alert("제목을 입력하세요");
		}else if(document.updateform.post_category.value==""){
			alert("카테고리를 입력하세요");
		}else if(document.updateform.post_content.value==""){
			alert("내용을 입력하세요");
		}else{
			document.updateform.submit();
		}
	}
	
</script>
<link href="${pageContext.request.contextPath}/resources/css/updateform.css" rel="stylesheet" />
</head>
<body>
<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->
<br />
<h2 align="center">게시글 수정</h2>
<a href="board">게시판</a>
<div class="form_box">
<form name="updateform" action="update" method="post" id="test" >
<table>

	
	<tr>
		<th>제목</th>
		<td>
			<input class="input_field" type="text" name="post_title"  value="${b.post_title}"/>
			<input type="hidden" name="pg" value="${pg}"/>
			<input type="hidden" name="post_num" value="${b.post_num}"/>
		</td>

	</tr>
	
	<tr>
		<th>카테고리</th>
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
		<%-- <td>
			<input type="text" name="post_category" maxlength="50" size="65" value="${b.post_category}"/>
		</td> --%>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea class="textarea_field" name="post_content" rows="5" cols="50">${b.post_content}</textarea>
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
			<input type="hidden" name="post_usernum" value="${user_num}" />
		</td>
	</tr>
</table>
</form>
	<div class="btn-holder">
		<button id="one" class="btn btn-1 hover-filled-opacity" onclick="post_update()">
				<span>수정</span>
		</button>
	</div>
	<div class="btn-holder">
			<button id="two" class="btn btn-1 hover-filled-opacity"
					onclick="history.go(-1);">
					<span>이전 페이지</span>
				</button>
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