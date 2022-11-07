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
			<th>처리한 관리자</th>
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
				<td>${r.reportp_adminnum }</td>
				<td>${r.reportp_regdate }</td>
				<%-- 				<td><input type="button" value="처리완료"
					onclick="reportp1('${path}','${ reportp_result1 }','${ r.reportp_num }')" />
					<script type="text/javascript">
					function reportp1(str,result,num){
						if (confirm("정말 변경하시겠습니까??") == true) {
						document.ManageReport.submit();
						alert("수정완료했습니다.");
						}else { //취소
							return false;
						}
					}
					</script></td> --%>
				<td>
					<form action="${path}/admin/ManageReport" method="post">
						<input type="hidden" name="reportp_num" value="${r.reportp_num}" />
						<input type="hidden" name="reportp_result" value="처리완료" /> <input
							type="submit" value="처리완료">
					</form>
				</td>
				<td>
					<form action="${path}/admin/ManageReport" method="post">
						<input type="hidden" name="reportp_num" value="${r.reportp_num}" />
						<input type="hidden" name="reportp_result" value="검토중" /> <input
							type="submit" value="검토하기">
					</form>
				</td>
			</tr>
		</c:forEach>
	<br />
	</table>
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
			<th>처리한 관리자</th>
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
				<td>${pr.reportpr_adminnum }</td>
				<td>${pr.reportpr_regdate }</td>
				<td>
					<form action="${path}/admin/ManageReport/" method="post">
						<input type="hidden" name="reportpr_num"
							value="${pr.reportpr_num}" /> <input type="hidden"
							name="reportpr_result" value="처리완료" /> <input type="submit"
							value="처리완료">
					</form>
				</td>
				<td>
					<form action="${path}/admin/ManageReport/" method="post">
						<input type="hidden" name="reportpr_num"
							value="${pr.reportpr_num}" /> <input type="hidden"
							name="reportpr_result" value="검토중" /> <input type="submit"
							value="검토하기">
					</form>
				</td>
			</tr>
		</c:forEach>
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
			<th>처리한 관리자</th>
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
				<td>${cr.reportcr_adminnum }</td>
				<td>${cr.reportcr_regdate }</td>
				<td>
					<form action="${path}/admin/ManageReport/" method="post">
						<input type="hidden" name="reportcr_num"
							value="${cr.reportcr_num}" /> <input type="hidden"
							name="reportcr_result" value="처리완료" /> <input type="submit"
							value="처리완료">
					</form>
				</td>
				<td>
					<form action="${path}/admin/ManageReport/" method="post">
						<input type="hidden" name="reportcr_num"
							value="${cr.reportcr_num}" /> <input type="hidden"
							name="reportcr_result" value="검토중" /> <input type="submit"
							value="검토하기">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>