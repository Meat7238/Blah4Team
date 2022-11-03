<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="list" color="black">글 목록</a>


<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

</body>
</html>
