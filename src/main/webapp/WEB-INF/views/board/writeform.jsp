<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function post_write(){
		alert("function come!!");
		if(document.writeform.post_title.value==""){
			alert("제목을 입력하세요");
		}else if(document.writeform.post_category.value==""){
			alert("카테고리를 입력하세요");
		}else if(document.writeform.post_content.value==""){
			alert("내용을 입력하세요");
		}else if(document.writeform.writer.value==""){
			alert("아이디를 입력하세요");
		}else{
			
			document.writeform.submit();
			
		}
		
		
	}
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<h2>게시글 쓰기</h2>
<a href="board">게시판</a>
<form name="writeform" action="${root}write" method="post">
<table width="850">
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="post_title" maxlength="50" size="65"/>
		</td>
	</tr>
	<tr>
		<th>카테고리</th>
		<td>
			<select name="post_category">
				<option value="블라블라">블라블라</option>
				<option value="주식투자">주식투자</option>
				<option value="썸,연애">썸,연애</option>
				<option value="회사생활">회사생활</option>
				<option value="이직,커리어">이직,커리어</option>
				<option value="결혼,육아">결혼,육아</option>
				<option value="홍보">홍보</option>
				<option value="취미생활">취미생활</option>
				<option value="우리회사 채용해요">우리회사 채용해요</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="post_content" rows="5" cols="50"></textarea>
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<%-- <input type="hidden" name="writer" id="writer" value='<sec:authentication property="principal.username"/>'> --%>
			<input name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
			<input type="hidden" name="post_usernum" value="${user_num}" maxlength="10" size="12"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="쓰기" onclick="post_write()"/>
			<input type="reset" value="취소" />
		</td>
	</tr>
</table>
</form>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>