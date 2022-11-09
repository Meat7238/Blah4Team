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
<script type="text/javaScript" language="javascript"></script>

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

	<c:if test="${list == null }">
		<form name="calendarFrm" id="calendarFrm" action="" method="GET">

			<div class="calendar">

				<!--날짜 네비게이션  -->
				<div class="navigation">
					<a class="before_after_year"
						href="./calendar.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
						&lt;&lt; <!-- 이전해 -->
					</a> <a class="before_after_month"
						href="./calendar.do?year=${today_info.before_year}&month=${today_info.before_month}">
						&lt; <!-- 이전달 -->
					</a> <span class="this_month"> &nbsp;${today_info.search_year}.
						<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
					</span> <a class="before_after_month"
						href="/calendar.do?year=${today_info.after_year}&month=${today_info.after_month}">
						<!-- 다음달 --> &gt;
					</a> <a class="before_after_year"
						href="/calendar.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
						<!-- 다음해 --> &gt;&gt;
					</a>
				</div>

				<!-- <div class="today_button_div"> -->
				<!-- <input type="button" class="today_button" onclick="javascript:location.href='/calendar.do'" value="go today"/> -->
				<!-- </div> -->
				<table class="calendar_body">

					<thead>
						<tr bgcolor="#CECECE">
							<td class="day sun">일</td>
							<td class="day">월</td>
							<td class="day">화</td>
							<td class="day">수</td>
							<td class="day">목</td>
							<td class="day">금</td>
							<td class="day sat">토</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="dateList" items="${dateList}"
								varStatus="date_status">
								<c:choose>
									<c:when test="${dateList.value=='today'}">
										<td class="today">
											<div class="date">${dateList.date}</div>
											<div></div>
										</td>
									</c:when>
									<c:when test="${date_status.index%7==6}">
										<td class="sat_day">
											<div class="sat">${dateList.date}</div>
											<div></div>
										</td>
									</c:when>
									<c:when test="${date_status.index%7==0}">
						</tr>
						<tr>
							<td class="sun_day">
								<div class="sun">${dateList.date}</div>
								<div></div>
							</td>
							</c:when>
							<c:otherwise>
								<td class="normal_day">
									<div class="date">${dateList.date}</div>
									<div></div>
								</td>
							</c:otherwise>
							</c:choose>
							</c:forEach>
					</tbody>
				</table>
			</div>
		</form>

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