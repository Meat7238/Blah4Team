<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet" />


<meta charset="UTF-8">
<title>admin Home</title>
</head>
<body>
<div class="wrapper">
<header>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
</header>
<div class="main-content">

<div class="tabs">
  <div class="tab-header">
  <i align="center" font-weight= "bold"><h2>Admin Page</h2></i><br/>
    <div class="active">
      <i class="fa fa-code"></i> 😄 회원정보 관리
    </div>
    <div>
      <i class="fa fa-pencil-square"></i> 📃 공지사항 관리
    </div>
    <div>
      <i class="fa fa-bar-chart"></i> ❗ 신고 관리
    </div>
    <div>
      <i class="fa fa-envelope"></i> 🏢 공고 입력 
    </div>
  </div>
  <div class="tab-indicator"></div>
  <div class="tab-content">
    
    <div class="active">
      <i><h2>😄</h2></i>
      <h2><a href="${root}admin/edit">  회원정보 관리</a></h2>
      </br>
      <p>회원정보를 관리하는 공간입니다.<br>
       유저를 검색할 수 있으며, <br>
       최근 가입한 유저 순으로 정렬하여 페이징처리되어있어 가독성이 좋습니다.<br>
      주요 기능으로는 유저를 삭제하거나 권한을 관리자로 혹은 다시 유저로 변경할 수 있습니다.</p>
    </div>
    
    <div>
      <i ><h2>📃</h2></i>
      <h2><a href="${root}admin/notice">  공지사항 관리</a></h2>
      </br>관리자가 공지사항을 작성할 수 있는 공간입니다.
      작성된 공지사항을 읽을 수 있습니다.</p>
    </div>
    
    <div>
      <i ><h2> ❗ </h2></i>
      <h2><a href="${root}admin/ManageReport">  신고 관리</a></h2>
      </br>
      <p>게시판신고, 게시판댓글신고, 기업리뷰 신고등을 종합적으로 관리하는 공간입니다.</p>
    </div>
    
    <div>
      <i ><h2>🏢</h2></i>
      <h2><a href="${root}admin/recruit">  공고 입력 </a></h2>
      </br>
      <p>관리자는 DB에 있는 기업정보를 토대로 해당 기업의 공고를 입력 할 수 있습니다.</p>
    </div>
    
  </div>
</div>


<%-- 	</br> 로그인 된 관리자 :
	<sec:authentication property="principal.username" />

	<form action="adminLogout" method="post">
		<input type="submit" value="로그아웃">
	</form>
 --%>
<script type="text/javascript">
function _class(name){
	  return document.getElementsByClassName(name);
	}
	let tabPanes = _class("tab-header")[0].getElementsByTagName("div");
	for(let i=0;i<tabPanes.length;i++){
	  tabPanes[i].addEventListener("click",function(){
	    _class("tab-header")[0].getElementsByClassName("active")[0].classList.remove("active");
	    tabPanes[i].classList.add("active");
	    _class("tab-indicator")[0].style.top = 'calc(80px + ${i*50}px)';
	    _class("tab-content")[0].getElementsByClassName("active")[0].classList.remove("active");
	    _class("tab-content")[0].getElementsByTagName("div")[i].classList.add("active");
	    
	  });
	}
</script>
</div>
<footer>
		<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</footer>
</div>

</body>
</html>