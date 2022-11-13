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
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<h2>게시글 수정</h2>
<a href="board">게시판</a>
<form name="updateform" action="update" method="post">
<table>

	
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="post_title" maxlength="50" size="65" value="${b.post_title}"/>
		</td>
		<td>
		<input type="hidden" name="pg" value="${pg}"/>
		<input type="hidden" name="post_num" value="${b.post_num}"/>
		</td>
		
	</tr>
	
	<tr>
		<th>카테고리</th>
		<td>
			<input type="text" name="post_category" maxlength="50" size="65" value="${b.post_category}"/>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="post_content" rows="5" cols="50">${b.post_content}</textarea>
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
			<input type="hidden" name="post_usernum" value="${user_num}" maxlength="10" size="12"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="수정" onclick="post_update()"/>
			<input type="reset" value="취소" />
		</td>
	</tr>
</table>
</form>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>