<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>Home</title>
<style type="text/css">
</style>

<link href="${path}/resources/css/home.css" rel="stylesheet" />
</head>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		<div class="main-content">
			<br /></br>
			<div id="search_wrapper">
				<form action="home" method="post">
					<input type="text" name="keyvalue" placeholder="검색어 입력"> <img
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</form>
			</div>
			<br /></br>
			<table border="1">
				<thead>
					<tr border="0">
						<th id="recent" colspan='2'>@최신글</th>
					</tr>
					<tr>
						<th width="50">번호</th>
						<th width=10%>카테고리</th>
						<th width=40%>제목</th>
						<th width="80">닉네임</th>
						<th width="50">댓글수</th>
						<th width="150">작성일</th>
						<th width="80">조회수</th>
					</tr>
				</thead>
				<c:forEach var="q" items="${list}">
					<tbody>
						<tr>
							<td>${q.post_num}</td>
							<td>${q.post_category }</td>
							<td><a href="readform?post_num=${q.post_num}&pg=${pg}">${q.post_title}</a></td>
							<td>${q.post_usernum}</td>
							<td>${q.post_like}</td>
							<td>${q.post_regdate}</td>
							<td>${q.post_readcount}</td>
					</tbody>
				</c:forEach>
			</table>

			<table>
				<tr>
					<td align="center">
						<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
							<!-- 5>10: false	/	15>10: true -->
				[<a href="${pageContext.request.contextPath}/?pg=1">◀◀</a>]
				[<a href="${pageContext.request.contextPath}/?pg=${fromPage-1}">◀</a>]
			</c:if> <c:if test="${pg<=block}">
							<!-- 5<=10 :true / 15<=10:false -->
				[<span style="color: gray">◁◁</span>]	
				[<span style="color: gray">◁</span>]
			</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
							var="i">
							<c:if test="${i==pg}">[${i}]</c:if>
							<c:if test="${i!=pg}">
					[<a href="${pageContext.request.contextPath}/?pg=${i}">${i}</a>]
				</c:if>
						</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
							<!-- 20<21 : true -->
				[<a href="${pageContext.request.contextPath}/?pg=${toPage+1}">▶</a>]
				[<a href="${pageContext.request.contextPath}/?pg=${allPage}">▶▶</a>]
		
			</c:if> <c:if test="${toPage>=allPage}">
							<!-- 21>=21 :true -->
				[<span style="color: gray">▷</span>]	
				[<span style="color: gray">▷▷</span>]
		
			</c:if>

					</td>
				</tr>
			</table>
			자, 얘들아. 도-레-미-파-솔 그리고 그 외의 음들은 우리가 노래를 만들 때 필요한 부분일 뿐이란다. 일단 이것들을
			기억하고만 있다면, 그걸로 우리는 그 음들을 전부 이리저리 섞어서 수많은 노래들을 만들어 부를수 있단다. - 영화 사운드
			오브 뮤직의 ost 인 Do-Re-Mi 中 마리아가 아이들에게 노래에 대해 처음으로 가르쳐주는 대사. 음악 중에서도 어떠한
			도구 없이 사람의 목소리만 있으면 할 수 있기 때문에 가장 원초적인 음악 표현의 방법이라고 할 수 있다. 감정을 표현하거나
			느끼게 하는 데 매우 효과적이다. 그리고 연애 관계에서 굉장한 효과를 불러일으키기도 한다. 실제로 동물계를 살피면, 노래를
			이용해 구애하는 경우가 꽤 많다. 심지어 쥐도 노래한다는 이야기가 있다. 인간의 노래 역시 이런 것의 연장선상으로 이해할 수
			있다. 내 삶에서 노래가, 꽃이 모두 죽은 날. 일초에 백 번을 후회했을 텐데‥. 그런데 만일 시간을 돌려준다면. -
			임주연의 만화 CIEL 22권 중 이비엔 마그놀리아의 독백 함께 노래 부르면서 믿음을 쌓고 두려움을 이겨나가는 것이 겁나는
			시간 앞에서 우리가 할 수 있는, 유일한 몸짓이 아닐까? - 2015년 10월 24일 네이버 쉼 편집위원회 추천사 중에서
			노래가 언어로 감정들을 담고, 부르는 이는 물론 듣는 이에게도 비교적 분명하게 희노애락을 전해 주기 때문에 인생 그 자체나
			인생에서 느낄 수 있는 감정들을 비유하기도 한다. 가끔 제대로 꽂히거나 중독성이 강한 곡을 들었을 경우 나중에도 멜로디가
			머리 속에서 무한반복되는 경우가 있는데, 이럴 때는 미칠 것 같은 기분을 맛볼수 있다. 특히 시험볼 때 이러면 집중력이
			산으로 간다. 자신이 노래를 부르거나 남이 노래를 부르는 걸 병적으로 싫어하는 사람도 있으므로 억지로 부르게 하거나
			아무데서나 부르지 말자. 당사자에게는 생각하는 것 이상으로 엄청난 스트레스다. 앞서 말했듯이 노래가 음악의 가장 원초적인
			표현 방법이기 때문인지 적지않은 수의 사람들이 가사는 없고 음만 나오는 음악을 노래라고 부르는 경우가 있는데, 음악이랑
			노래랑 헷갈리지 않도록 하자. 그러나 하필이면 ANTHEM의 역어가 국가가 되는 바람에, 스페인 국가는 매우 희귀하게도
			가사는 없지만 노래다. 아프가니스탄은 성전가를 제외한 모든 노래가 금지되기도 했다.

		</div>
		<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	</div>
</body>
</html>
