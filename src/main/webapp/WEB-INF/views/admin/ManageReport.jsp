<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ManageReport</title>
</head>
<body>
	<h1>신고처리</h1>
	<a href="${path}/admin">뒤로가기</a>

	<br />
	<h3>신고접수된 게시판</h3>

	<table border="1" width="1000">
		<tr>
			<th>처리상태</th>
			<th>신고유형</th>
			<th>신고 번호</th>
			<th>게시글 번호</th>
			<th>유저번호</th>
			<th>신고내용</th>
			<th>신고일</th>
			<th>*처리완료*</th>
			<th>*검토*</th>
		</tr>

		<c:forEach var="r" items="${reportPostList}">
			<tr>
				<td>${r.reportp_result }</td>
				<td>${r.reportp_type }</td>
				<td>${r.reportp_num }</td>
				<td>${r.reportp_postnum }</td>
				<td>${r.reportp_usernum }</td>
				<td>${r.reportp_content }</td>
				<td>${r.reportp_regdate }</td>
				<td>
					<form action="${path}/admin/ManageReport" method="post">
						<input type="hidden" name="reportp_num" value="${r.reportp_num}" />
						<input type="hidden" name="reportp_result" value="처리완료" /> <input
							type="hidden" name="admin_id" value=${admin_id } /> <input
							type="submit" value="처리완료">
					</form>
				</td>
				<td>
					<form action="${path}/admin/ManageReport" method="post">
						<input type="hidden" name="reportp_num" value="${r.reportp_num}" />
						<input type="hidden" name="reportp_result" value="검토중" /> <input
							type="hidden" name="admin_id" value=${admin_id } /> <input
							type="submit" value="검토하기">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<table width="600">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg1>block1}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="notice?pg1=1">◀◀</a>]
			[<a href="notice?pg1=${fromPage1-1}">◀</a>]		
		</c:if> <c:if test="${pg1<=block1}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage1}" end="${toPage1}"
					var="i">
					<c:if test="${i==pg1}">[${i}]</c:if>
					<c:if test="${i!=pg1}">
				[<a href="notice?pg1=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage1<allPage1}">
					<!-- 20<21 : true -->
				[<a href="notice?pg1=${toPage1+1}">▶</a>]
				[<a href="notice?pg1=${allPage1}">▶▶</a>]
		
		</c:if> <c:if test="${toPage1>=allPage1}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>

			</td>
		</tr>
	</table>
	<br />
	<br />
	<h3>신고접수된 댓글</h3>
	<table border="1" width="1000">
		<tr>
			<th>처리상태</th>
			<th>신고유형</th>
			<th>신고 번호</th>
			<th>댓글 번호</th>
			<th>유저번호</th>
			<th>신고내용</th>
			<th>신고일</th>
			<th>*처리완료*</th>
			<th>*검토*</th>
		</tr>

		<c:forEach var="pr" items="${reportPostReviewList}">
			<tr>
				<td>${pr.reportpr_result }</td>
				<td>${pr.reportpr_type }</td>
				<td>${pr.reportpr_num }</td>
				<td>${pr.reportpr_postreviewnum }</td>
				<td>${pr.reportpr_usernum }</td>
				<td>${pr.reportpr_content }</td>
				<td>${pr.reportpr_regdate }</td>
				<td>
					<form action="${path}/admin/ManageReport/" method="post">
						<input type="hidden" name="reportpr_num"
							value="${pr.reportpr_num}" /> <input type="hidden"
							name="reportpr_result" value="처리완료" /> <input type="hidden"
							name="admin_id" value=${admin_id } /> <input type="submit"
							value="처리완료">
					</form>
				</td>
				<td>
					<form action="${path}/admin/ManageReport/" method="post">
						<input type="hidden" name="reportpr_num"
							value="${pr.reportpr_num}" /> <input type="hidden"
							name="reportpr_result" value="검토중" /> <input type="hidden"
							name="admin_id" value=${admin_id } /> <input type="submit"
							value="검토하기">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<table width="600">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg1>block1}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="notice?pg2=1">◀◀</a>]
			[<a href="notice?pg2=${fromPage2-1}">◀</a>]		
		</c:if> <c:if test="${pg2<=block2}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage2}" end="${toPage2}"
					var="i">
					<c:if test="${i==pg2}">[${i}]</c:if>
					<c:if test="${i!=pg2}">
				[<a href="notice?pg2=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage2<allPage2}">
					<!-- 20<21 : true -->
				[<a href="notice?pg2=${toPage2+1}">▶</a>]
				[<a href="notice?pg2=${allPage2}">▶▶</a>]
		
		</c:if> <c:if test="${toPage2>=allPage2}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>

			</td>
		</tr>
	</table>
	<br />
	<h3>신고접수된 기업리뷰</h3>
	<table border="1" width="1000">
		<tr>
			<th>처리상태</th>
			<th>신고유형</th>
			<th>신고 번호</th>
			<th>리뷰 번호</th>
			<th>유저번호</th>
			<th>신고내용</th>
			<th>신고일</th>
			<th>*처리완료*</th>
			<th>*검토*</th>
		</tr>

		<c:forEach var="cr" items="${reportcopReviewList}">
			<tr>
				<td>${cr.reportcr_result }</td>
				<td>${cr.reportcr_type }</td>
				<td>${cr.reportcr_num }</td>
				<td>${cr.reportcr_corpreviewnum }</td>
				<td>${cr.reportcr_usernum }</td>
				<td>${cr.reportcr_content }</td>
				<td>${cr.reportcr_regdate }</td>
				<td>
					<form action="${path}/admin/ManageReport/" method="post">
						<input type="hidden" name="reportcr_num"
							value="${cr.reportcr_num}" /> <input type="hidden"
							name="reportcr_result" value="처리완료" /> <input type="hidden"
							name="admin_id" value=${admin_id } /> <input type="submit"
							value="처리완료">
					</form>
				</td>
				<td>
					<form action="${path}/admin/ManageReport/" method="post">
						<input type="hidden" name="reportcr_num"
							value="${cr.reportcr_num}" /> <input type="hidden"
							name="reportcr_result" value="검토중" /> <input type="hidden"
							name="admin_id" value=${admin_id } /><input type="submit"
							value="검토하기">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<table width="600">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 --> <c:if test="${pg3>block3}">
					<!-- 5>10 : false / 15>10 : true -->
			[<a href="notice?pg3=1">◀◀</a>]
			[<a href="notice?pg3=${fromPage3-1}">◀</a>]		
		</c:if> <c:if test="${pg3<=block3}">
					<!-- 5<=10 :true / 15<=10:false -->
			[<span style="color: gray">◀◀</span>]	
			[<span style="color: gray">◀</span>]
		</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage3}" end="${toPage3}"
					var="i">
					<c:if test="${i==pg3}">[${i}]</c:if>
					<c:if test="${i!=pg3}">
				[<a href="notice?pg3=${i}">${i}</a>]
			</c:if>
				</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage3<allPage3}">
					<!-- 20<21 : true -->
				[<a href="notice?pg3=${toPage3+1}">▶</a>]
				[<a href="notice?pg3=${allPage3}">▶▶</a>]
		
		</c:if> <c:if test="${toPage3>=allPage3}">
					<!-- 21>=21 :true -->
				[<span style="color: gray">▶</span>]
				[<span style="color: gray">▶▶</span>]
		
		</c:if>

			</td>
		</tr>
	</table>
</body>
</html>