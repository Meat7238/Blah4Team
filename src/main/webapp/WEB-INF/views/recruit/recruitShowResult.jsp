<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블라블라 : 채용공고</title>
<script type="text/javascript">
var today = new Date();
function buildCalendar(){
  var row = null
  var cnt = 0;
  var calendarTable = document.getElementById("calendar");
  var calendarTableTitle = document.getElementById("calendarTitle");
  calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
  
  var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
  var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
  while(calendarTable.rows.length > 2){
  	calendarTable.deleteRow(calendarTable.rows.length -1);
  }

  row = calendarTable.insertRow();
  for(i = 0; i < firstDate.getDay(); i++){
  	cell = row.insertCell();
  	cnt += 1;
  }

  row = calendarTable.insertRow();

  for(i = 1; i <= lastDate.getDate(); i++){
  	cell = row.insertCell();
  	cnt += 1;

    cell.setAttribute('id', i);
  	cell.innerHTML = i;
  	cell.align = "center";

    cell.onclick = function(){
    	clickedYear = today.getFullYear();
    	clickedMonth = ( 1 + today.getMonth() );
    	clickedDate = this.getAttribute('id');

    	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
    	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
    	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

    	opener.document.getElementById("date").value = clickedYMD;
    	self.close();
    }

    if (cnt % 7 == 1) {
    	cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
    }

    if (cnt % 7 == 0){
    	cell.innerHTML = "<font color=skyblue>" + i + "</font>";
    	row = calendar.insertRow();
    }
  }

  if(cnt % 7 != 0){
  	for(i = 0; i < 7 - (cnt % 7); i++){
  		cell = row.insertCell();
  	}
  }
}

function prevCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	buildCalendar();
}

function nextCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	buildCalendar();
}
</script>


</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<form action="${root}/recruit/recruitSelect" method="get">
		<input type="text" name="corp_name"> <input type="submit"
			name="검색">

	</form>
	<br>
	<br>
	<br>
	
	<style TYPE="text/css">
		body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
		}

		td {font-family: "돋움"; font-size: 9pt; color:#595959;}
		th {font-family: "돋움"; font-size: 9pt; color:#000000;}
		select {font-family: "돋움"; font-size: 9pt; color:#595959;}


		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

		A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
		A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
		.day{
			width:100px; 
			height:30px;
			font-weight: bold;
			font-size:15px;
			font-weight:bold;
			text-align: center;
		}
		.sat{
			color:#529dbc;
		}
		.sun{
			color:red;
		}
		.today_button_div{
			float: right;
		}
		.today_button{
			width: 100px; 
			height:30px;
		}
		.calendar{
			width:80%;
			margin:auto;
		}
		.navigation{
			margin-top:100px;
			margin-bottom:30px;
			text-align: center;
			font-size: 25px;
			vertical-align: middle;
		}
		.calendar_body{
			width:100%;
			background-color: #FFFFFF;
			border:1px solid white;
			margin-bottom: 50px;
			border-collapse: collapse;
		}
		.calendar_body .today{
			border:1px solid white;
			height:120px;
			background-color:#c9c9c9;
			text-align: left;
			vertical-align: top;
		}
		.calendar_body .date{
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .sat_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			text-align:left;
			vertical-align: top;
		}
		.calendar_body .sat_day .sat{
			color: #529dbc; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .sun_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			text-align: left;
			vertical-align: top;
		}
		.calendar_body .sun_day .sun{
			color: red; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .normal_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			vertical-align: top;
			text-align: left;
		}
		.before_after_month{
			margin: 10px;
			font-weight: bold;
		}
		.before_after_year{
			font-weight: bold;
		}
		.this_month{
			margin: 10px;
		}
	</style>

	<c:if test="${list == null }">
		<table id="calendar" align="center">
		<tr>
			<td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
			<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
			<td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
		</tr>
		<tr>
			<td align="center"><font color ="#F79DC2">일</td>
			<td align="center">월</td>
			<td align="center">화</td>
			<td align="center">수</td>
			<td align="center">목</td>
			<td align="center">금</td>
			<td align="center"><font color ="skyblue">토</td>
		</tr>
		<script type="text/javascript">buildCalendar();</script>
	</table>

	</c:if>

	<c:if test="${list != null }">
		<table cellpadding="3" class="review_table">
			<tr>
				<th class="review.table" width="50">번호</th>
				<th width="200">채용 기업</th>
				<th width="120">채용 시작일</th>
				<th width="120">채용 마감일</th>
				<th width="80">직군</th>
				<th width="80">경력</th>
				<th width="50">조회수</th>
			</tr>
			<c:forEach var="r" items="${list}">
				<tr>
					<td>${r.RECRUIT_NUM}</td>
					<%-- <td><a href="readform?post_num=${q.post_num}&pg=${pg}">${q.post_title}</a></td> --%>
					<td>${r.CORP_NAME}</td>
					<td>${r.RECRUIT_STARTDATE}</td>
					<td>${r.RECRUIT_ENDDATE}</td>
					<td>${r.RECRUIT_JOBGROUP}</td>
					<td>${r.RECRUIT_CAREER}</td>
					<td>${r.RECRUIT_READCOUNT}</td>
			</c:forEach>
		</table>
	</c:if>
	<!-- <script>window.onpageshow = function(event) {if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {  }}</script> -->

	<%-- <table width="600">
		<tr>
			<td align="center">
			<!-- 처음 이전 링크 -->
			<c:if test="${pg>block}">	<!-- 5>10: false	/	15>10: true -->
				[<a href="board?pg=1">◀◀</a>]
				[<a href="board?pg=${fromPage-1}">◀</a>]
			</c:if>
			<c:if test="${pg<=block}"> <!-- 5<=10 :true / 15<=10:false -->
				[<span style="color:gray">◀◀</span>]	
				[<span style="color:gray">◀</span>]
			</c:if>
			
			
			<!-- 블록 범위 찍기 -->
			<c:forEach begin="${fromPage}" end="${toPage}" var="i">
				<c:if test="${i==pg}">[${i}]</c:if>
				<c:if test="${i!=pg}">
					[<a href="board?pg=${i}">${i}</a>]
				</c:if>
			</c:forEach>
			
			<!-- 다음, 이후 -->
			<c:if test="${toPage<allPage}"> <!-- 20<21 : true -->
				[<a href="board?pg=${toPage+1}">▶</a>]
				[<a href="board?pg=${allPage}">▶▶</a>]
		
			</c:if>	
			<c:if test="${toPage>=allPage}"> <!-- 21>=21 :true -->
				[<span style="color:gray">▶</span>]	
				[<span style="color:gray">▶▶</span>]
		
			</c:if>			
			
			</td>
		</tr>
	</table> --%>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>