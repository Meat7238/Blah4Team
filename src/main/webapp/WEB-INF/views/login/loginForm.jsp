<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Custom login page</h1>


	<c:url value="${root}login" var="loginUrl" />
	<form:form name="f" action="${loginUrl}" method="POST">
		<c:if test="${param.error != null}">
			<p>아이디와 비밀번호가 잘못되었습니다.</p>
		</c:if>
		<c:if test="${param.logout != null}">
			<p>로그아웃 하였습니다.</p>
		</c:if>
		<p>
			<label for="username">아이디</label>
			<input type="text" id="user_id" name="user_id" />
		</p>
		<p>
			<label for="password">비밀번호</label>
			<input type="password" id="user_password" name="user_password"/>
		</p>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<button type="submit" class="btn">로그인</button>
		
	</form:form>
	
<br/>
<a href="<c:url value="/join" />">회원가입</a>

</body>
</html>
