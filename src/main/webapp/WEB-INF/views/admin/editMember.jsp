<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editMember</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
</script>
<script>
$(function(){
	$(".check").on('click',function () {
		
	let chekObj = document.getElementsByClassName("test");
	let lenth = chekObj.length;
	alert(lenth);
	let checked = 0;
	let checkid;
	  	if (confirm("정말 삭제하시겠습니까??") == true){
	 	 for (i = 0; i < lenth; i++) {
	   		 	if (chekObj[i].checked === true) {
		    	  checked += 1;
		    	  checkid = chekObj[i].getAttribute("id");
	  			  alert(checkid);
	  			  location.href ='${pageContext.request.contextPath}/admin/edit/delete?num=' +checkid;
	   			}
	  		}//end for
	  	}//end if
});
/* 	  
	  if (checked >= 2){
	    alert("체크 해제 후 한 가지만 선택해 주세요");
	    return false;
	  } */
	}); 
	
</script>
</head>
<body>
	<h1>회원정보 편집</h1>
	<form action="edit" method="post">
		<select name="column">
			<option value="user_num">유저번호</option>
			<option value="user_id">아이디</option>
		</select> <input type="text" name="keyvalue" stle="width:400px; height:100px;">
		<!-- <input type="submit"
			value="검색"> -->
	</form>
	<br />
	<br />

	<!-- ------------------------------------------------------------------------------------------------------------- -->

	<button class="check">체크해서 삭제하기</button>
	</br>
	<table border="1" width=50%>
		<tr>
			<th><label class="checkbox"><input type="checkbox"
					id='allselect' name="c1" value="selectall"
					onclick='selectAll(this)'></label></th>
			<!--  data-enpassusermodified="yes"-->
			<th>번호</th>
			<th>아이디</th>
			<th>포인트</th>
			<th>이메일</th>
			<th>분류</th>
			<th>회사</th>
			<th>게시글수</th>
			<!-- 			<th>*삭제*</th>
 -->
			<th>*수정*</th>
		</tr>
		<c:forEach var="e" items="${list}" varStatus="status">
			<tr>
				<td><input type="checkbox" class="test" name="c1"
					id="${e.user_num}"></td>
				<td>${e.user_num }</td>
				<td>${e.user_id }</td>
				<td>${e.user_point }</td>
				<td>${e.user_email }</td>
				<td>${e.user_jobgroup }</td>
				<td>${e.user_workspace }</td>
				<td>${user_countlist[status.index]}</td>
				<td>권한수정</td>
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

			</td>
		</tr>
	</table>

</body>
</html>