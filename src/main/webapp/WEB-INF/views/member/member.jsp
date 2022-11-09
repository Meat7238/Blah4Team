<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
</head>
<body>

<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<label>writer</label>
<input class="form-control" name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>


</body>
</html>

