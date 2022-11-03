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
	<h1>멤버 편집</h1>

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
		</tr>
		<c:forEach var="e" items="${list }">
			<tr>
				<td>${e.user_num }응</td>
				<td>${e.user_id }</td>
				<td>${e.user_nick }</td>
				<td>${e.user_point }</td>
				<td>${e.user_email }</td>
				<td>${e.user_startdate }</td>
				<td>${e.user_enddate }</td>
				<td>${e.user_jobgroup }</td>
				<td>${e.user_workspace }</td>
				<td><a href="#">삭제하기</a></td>
			</tr>
		</c:forEach>
	</table>

	<!-- CREATE TABLE USER2( 
USER_NUM VARCHAR2(20) CONSTRAINT USER_NUM_pk PRIMARY key, 
USER_ID varchar2(20),
USER_PASSWORD varchar2(20),
USER_NICK varchar2(20),
USER_POINT varchar2(20),
USER_EMAIL varchar2(20),
USER_STARTDATE varchar2(20),
USER_ENDDATE varchar2(20),
USER_JOBGROUP varchar2(20),
USER_WORKSPACE varchar2(20)
); -->
</body>
</html>