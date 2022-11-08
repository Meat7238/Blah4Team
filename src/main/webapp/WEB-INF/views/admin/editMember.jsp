<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editMember</title>
</head>
<body>
	<h1>회원정보 편집</h1>
	<form action="edit" method="post">
		<select name="column">
			<option value="user_num">유저번호</option>
			<option value="user_id">아이디</option>
			<option value="user_nick">닉네임</option>
		</select> <input type="text" name="keyvalue" stle="width:400px; height:100px;"> <input type="submit"
			value="검색">
	</form>
	<br/>
	<br/>
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
				<%-- <td><a href="javascript:location.href='${pageContext.request.contextPath}/admin/edit/delete?num=${e.user_num}'">삭제하기</a></td> --%>
				<td><button onclick="test('${path}','${ e.user_num }')">
						삭제하기</button></td>
			</tr>
		</c:forEach>
	</table>
	<a href="${path}/admin">뒤로가기</a>
	<script>
		function test(str, num) {
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				/*     		 window.location.href =path+'/admin/edit/delete?num='+ e.user_num; */

				location.href = str + '/admin/edit/delete?num=' + num;
				alert("삭제완료했습니다.");
			} else { //취소
				return false;
			}
		}
	</script>
	<table width="600">
<tr>
	<td align="center">
		<!-- 처음 이전 링크 -->
		<c:if test="${pg>block}">  <!-- 5>10 : false / 15>10 : true -->
			[<a href="list.htm?pg=1">◀◀</a>]
			[<a href="list.htm?pg=${fromPage-1}">◀</a>]		
		</c:if>
		<c:if test="${pg<=block}"> <!-- 5<=10 :true / 15<=10:false -->
			[<span style="color:gray">◀◀</span>]	
			[<span style="color:gray">◀</span>]
		</c:if>
		
		<!-- 블록 범위 찍기 -->
		<c:forEach begin="${fromPage}" end="${toPage}" var="i">
			<c:if test="${i==pg}">[${i}]</c:if>
			<c:if test="${i!=pg}">
				[<a href="list.htm?pg=${i}">${i}</a>]
			</c:if>
		</c:forEach>
		
		<!-- 다음, 이후 -->
		<c:if test="${toPage<allPage}"> <!-- 20<21 : true -->
				[<a href="list.htm?pg=${toPage+1}">▶</a>]
				[<a href="list.htm?pg=${allPage}">▶▶</a>]
		
		</c:if>	
		<c:if test="${toPage>=allPage}"> <!-- 21>=21 :true -->
				[<span style="color:gray">▶</span>]
				[<span style="color:gray">▶▶</span>]
		
		</c:if>			
		
	</td>
</tr>
</table>
</body>
</html>