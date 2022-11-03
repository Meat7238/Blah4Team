<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editMember</title>
</head>
<body>
	<h>회원정보 편집</h1>

	<table border="1" width="850">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>닉네임</th>
			<th>포인트</th>
			<th>이메일</th>
			<th>입사일</th>
			<th>퇴사일</th>
			<th>회사명</th>
			<th>근무위치</th>
			<th>*삭제*</th>
			<th>*수정*</th>
		</tr>
		<c:forEach var="e" items="${list }">
			<tr>
				<td>${e.user_num }</td>
				<td>${e.user_id }</td>
				<td>${e.user_nick }</td>
				<td>${e.user_point }</td>
				<td>${e.user_email }</td>
				<td>${e.user_startdate }</td>
				<td>${e.user_enddate }</td>
				<td>${e.user_jobgroup }</td>
				<td>${e.user_workspace }</td>
				<td><a href="javascript:location.href='${pageContext.request.contextPath}/admin/edit/delete?num=${e.user_num}'">삭제하기</a></td>
				<td><button onclick="test()">경고창(alert) 발생</button></td>
			</tr>
		</c:forEach>
	</table>
	
<script>
    function test() {
    	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
    		 window.location.href ='${pageContext.request.contextPath}/admin/edit/delete?num=${e.user_num}'
	    	alert("삭제완료했습니다.");
    	 }else{   //취소
    	     return false;
    	 }
    }
    
</script>
</body>
</html>