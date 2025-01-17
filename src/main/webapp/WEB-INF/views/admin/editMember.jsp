<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" />
<meta charset="UTF-8">
<title>editMember</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<header>
			<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		</header>
		<div class="main-content">
			<!-- ------------------------------------------------------------------------------------------------------------- -->
			<div class="tabs">
				<h2>Admin Page > 😄 회원정보 관리</h2>
				<div class="tab-header">
					<i id="search_wrapper">
						<form action="edit" method="post" id="search_wrapper">
							<input type="radio" name="column" value="user_num">유저번호 
							<input
								type="radio" name="column" value="user_id" checked="checked">아이디
							<input type="radio" name="column" value="authority">권한 
							<br> <input type="text" name="keyvalue" placeholder="검색어 입력"
								style="margin-left: 20px; height: 30px;">
							<!-- <input type="submit"
			value="검색"> -->
						</form>
					</i>
					<div class="active">
						<div class="btn-holder">
							<button class="btn btn-1 hover-filled-opacity"
								onclick="location.href='${path}/admin'">
								<span>뒤로가기</span>
							</button>
						</div>
					</div>
					<div>
						<div class="btn-holder">
							<button id="check" class="btn btn-1 hover-filled-opacity">
								<span>체크해서 삭제</span>
							</button>
						</div>
					</div>
					<div>
						<div class="btn-holder">
							<button id="checkadmin" class="btn btn-1 hover-filled-opacity">
								<span>체크해서 관리자권한 만들기</span>
							</button>
						</div>
					</div>
					</br>
					<div>
						<div class="btn-holder">
							<button id="checkuser" class="btn btn-1 hover-filled-opacity">
								<span>체크해서 유저권한 만들기</span>
							</button>
						</div>
					</div>
				</div>
				<div class="tab-indicator"></div>
				<div class="tab-content">

					<div class="active">
						</br>
						<table border="1" width=50%>
							<thead>
								<tr>
									<th><label class="checkbox"><input type="checkbox"
											id='allselect' name="c1" value="selectall"
											onclick='selectAll(this)'></label></th>
									<!--  data-enpassusermodified="yes"-->
									<th>번호</th>
									<th>아이디</th>
									<th>권한</th>
									<th>포인트</th>
									<th>이메일</th>
									<th>분류</th>
									<th>회사</th>
									<th>게시글 작성 수</th>
									<!-- 			<th>*삭제*</th>
 -->
								</tr>
							</thead>
							<c:forEach var="e" items="${list}" varStatus="status">
								<tr class="colored">
									<td><input type="checkbox" class="test" name="c1"
										id="${e.user_num}"></td>
									<td>${e.user_num }</td>
									<td>${e.user_id }</td>
									<td>${e.authority}</td>
									<td>${e.user_point }</td>
									<td>${e.user_email }</td>
									<td>${e.user_jobgroup }</td>
									<td>${e.user_workspace }</td>
									<td>${user_countlist[status.index]}</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="9">

									<ul align="center">
										<li>
											<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
												<!-- 5>10 : false / 15>10 : true -->
			[<a href="${pageContext.request.contextPath}/admin/edit?pg=1"> ◀◀
												</a>]
			[<a
													href="${pageContext.request.contextPath}/admin/edit?pg=${fromPage-1}">◀</a>]		
		</c:if> <c:if test="${pg<=block}">
												<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◁◁</span>]	
			[<span style="color: gray">◁</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
												var="i">
												<c:if test="${i==pg}">[${i}]</c:if>
												<c:if test="${i!=pg}">
				[<a href="${pageContext.request.contextPath}/admin/edit?pg=${i}">${i}</a>]
			</c:if>
											</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
												<!-- 20<21 : true -->
				[<a
													href="${pageContext.request.contextPath}/admin/edit?pg=${toPage+1}">▶</a>]
				[<a
													href="${pageContext.request.contextPath}/admin/edit?pg=${allPage}">▶▶</a>]
		
		</c:if> <c:if test="${toPage>=allPage}">
												<!-- 21>=21 :true -->
				[<span style="color: gray">▷</span>]
				[<span style="color: gray">▷▷</span>]
		</c:if>
										</li>
									</ul>
								</td>
							</tr>
						</table>



					</div>
				</div>
			</div>

<!-- ------------------------------------------------------------------------------------------------------------- -->
		</div>
		<footer>
			<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
		</footer>
	</div>
<script src="${pageContext.request.contextPath}/resources/js/editMember.js" type="text/javascript"></script>
<script>
$(function(){
	$("#check").on('click',function () {
		
	let chekObj = document.getElementsByClassName("test");
	let lenth = chekObj.length;
	 alert(lenth); 
	/* let checked = 0; */
	let check= new Array();
	  	if (confirm("정말 삭제하시겠습니까??") == true){
	 	 for (i = 0; i < lenth; i++) {
	 		if (chekObj[i].checked != true) {
	 			continue;
	 			}
	   		 	if (chekObj[i].checked === true) {
		    	  /* checked += 1; */
		    	  check.push(chekObj[i].getAttribute("id"));
				  location.href ='${pageContext.request.contextPath}/admin/edit/delete?num='+check;
	   			}
	  		}//end for
	  	}//end if
});
}); 

$(function(){
	$("#checkadmin").on('click',function () {
	let adchekObj = document.getElementsByClassName("test");
	let adlenth = adchekObj.length;
	let msg = "ROLE_ADMIN";
	let adcheck= new Array();
	 	 for (i = 0; i < adlenth; i++) {
	 		if(adchekObj[i].checked != true){
	 		 	continue;	
	 		 	}
	   		 	if (adchekObj[i].checked === true) {
	   		 	adcheck.push(adchekObj[i].getAttribute("id"));
	   			}
	  		}//end for
		location.href ='${pageContext.request.contextPath}/admin/edit/authority?numid='+adcheck+'&authority='+msg;
});
}); 

$(function(){
	$("#checkuser").on('click',function () {
	let uschekObj = document.getElementsByClassName("test");
	let uslenth = uschekObj.length;
	let msg = "ROLE_USER";
	let uscheck = new Array();
	 	 for (i = 0; i < uslenth; i++) {
	 		 	if(uschekObj[i].checked != true){
	 		 	continue;	
	 		 	}
	   		 	if (uschekObj[i].checked === true) {
	   		 		uscheck.push(uschekObj[i].getAttribute("id"));
 	   			}
	  		}//end for
 		 location.href ='${pageContext.request.contextPath}/admin/edit/authority?numid='+uscheck+'&authority='+msg;
});
}); 


</script>
</body>
</html>