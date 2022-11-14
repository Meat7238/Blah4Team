<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관</title>

<script>
	function close_btn(){
		window.close();
	}
	
	function report_btn(){
		document.reportR.submit();
	}

</script>

<style type="text/css">
.report{
	text-align: left;
	line-height: 30px;
}
.rep{
	text-align: center;
	font-size: 12px;
}
.btn{
	text-align: center;
}
button{
	font-size: 15px;
	border-radius: 8px;
	background-color: white;
	color: black;
	border: 2px solid #969696;
	padding: 10px 24px;
}
button:hover {
  background-color: #969696;
  color: white;
}
</style>
</head>
<body>

<div class="report">
<br />
<h2 align="center">댓글 신고</h2>
<h3>[신고 정책 기준]</h3>
BlahBlah는 회원들의 자발적인 신고를 통해 더 나은 서비스를 제공하기 위하여 노력하고 있습니다. 신고를 통해 접수된 회원들의 목소리에 귀기울이며, 신속하고 투명하게 신고 내용에 대한 조치를 시행합니다. BlahBlah 반복적으로 위법 부당한 활동을 지속하는 회원의 서비스 이용을 제한할 수 있습니다.
<br /><br />
<h3>[신고하기 정책의 범위]</h3>
<h4>1) 신고대상 </h4>
스팸, 음란물, 성격에 맞지 않는글,과도한 욕설,광고,사회 분위기를 어지럽히는 게시글 및 댓글
부적절하거나 리뷰와 기업소개, 혹은 오기입된 정보.
<br />
<h4>2)신고내용</h4>
서비스 이용자의 권리를 침해하거나 BlahBlah 정책을 위반하는 등 커뮤니티 질서를 저해하는 사항
<br />
<h4>3)신고 확인 및 조치 절차</h4>
BlahBlah는 신고서가 접수된 이후 다음과 같이 신고 확인 및 조치 절차를 마련하고 있습니다.
<br />
<h5>STEP 1) 신고요건 검토 :</h5> 신고 접수 후, 신고 요건 및 신고내용 확인 <br />
필수기재사항에 대한 허위기재 또는 중요사실 누락 등 신고요건이 충족되지 않은 경우 무효처리 되며, 신고요건은 충족하였으나 근거자료가 불충분한 경우 추가 근거자료를 요청
<br />
<h5>STEP 2) 사실확인 :</h5> 신고 내용에 따라 해당 게시글 및 댓글, 리뷰내용을 BlahBlah가 제출된 근거자료를 검토하여 해당 콘텐츠가 커뮤니티 정책을 위반했는지 여부를 판단하게 됩니다. 단, 판단이 어려운 경우 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 따라 임시조치를 취할 수 있습니다.
<br />사실확인을 위한 자료를 3영업일 내에서 새소식 공지를 통해 소명하도록 요청.
<br />
<h5>STEP 3) 후속조치 :</h5> 사실 확인된 내용 기반하여 후속조치 진행<br />
① 게시글,댓글,리뷰 삭제 또는 이용제한 등<br />
* 저작권 등 명백한 침해 사실이 확인될 경우 지체없이 삭제 진행<br />
* 반복적으로 위법 부당 행위가 확인된 이용자는 BlahBlah 서비스 이용 제한<br />

② 수정 및 업로드<br />
* 오기입된 기업소개는 해당 기업에 3영업일 이내 요청하거나 해당 정정조치 실행<br />

<h5>STEP 4) 관련 공지</h5>
피신고인이 새소식 공지 등을 통해 소명하지 않거나 공시 필요성이 인정되는 경우,<br />
BlahBlah는 피신고인 대신 소명 내용 및 조치계획 등을 공지 가능함<br />
<br />
<div class="rep">BlahBlah는 회원들의 자발적인 신고를 통해 더 나은 서비스를 제공하기 위하여 노력하고 있습니다.<br />
신고하기를 통해 접수된 회원들의 목소리에 귀기울이며, 신속하고 투명하게 신고 내용에 대한 조치를 시행하도록 힘쓰겠습니다.
</div>
</div>
<br /><br />

	<div class="btn">
	<script>
	function report_btn(){
		var postreview_num = opener.$("#postreview_num").val();
		//document.write(postreview_num);
		//$("#post_title").val(post_title);
		document.reportR.postreview_num.value = postreview_num;
		
		
		var postreview_usernum = opener.$("#postreview_usernum").val();
		//document.write(postreview_usernum);
		//$("#post_usernum").val(post_usernum);
		document.reportR.postreview_usernum.value = postreview_usernum;
	}
	
	</script>
	<form name="reportR" action="reportFormR" method="post">
		<input type="hidden" id="postreview_num" name="postreview_num" value=""/>
		<input type="hidden" id="postreview_usernum" name="postreview_usernum" value=""/>
		<button onclick="report_btn()">신고하러가기</button>
	<button onclick="close_btn()">신고 취소</button>
	</form>
	</div>

	<!-- <button onclick="report_btn()">신고하러가기</button> -->
</body>
</html>