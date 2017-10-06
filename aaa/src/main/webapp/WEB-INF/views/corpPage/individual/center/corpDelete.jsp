<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.cancelLegend {
			font-family: "스웨거 TTF";
			font-style: bold;
			font-size: 40px;
			text-decoration: none;
			border: none;
		}
		.corpDeleteField {
			width: auto;
			height: auto;
		}
		p {
			font-size: large;
			font-family: "배달의민족 한나는 열한살";
			color: red;
		}
		
	</style>
</head>
<body>
	<br>
	<fieldset class="corpDeleteField">
	<legend class="cancelLegend">[ 기업회원 탈퇴 신청 ]</legend>
		<div style="border: 3px solid #E5E5E5; padding: 10px; text-align: left;">
		&nbsp;&nbsp;&nbsp;&nbsp;회원 탈퇴 신청에 앞서 아래의 사항을 반드시 확인하여 주시기 바랍니다.<br>
		1. 회원탈퇴 시 처리내용<br>
		&nbsp;(1) 다삼캐쉬·적립금: 잔여 금액은 소멸되며 환불되지 않습니다.<br>
		&nbsp;(2) 보유 정보: 다삼 구매 정보가 삭제됩니다.<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 티켓 구매 특성상 유효기간이 남은 미사용 티켓 관련 정보는 삭제되지 아니하고 유효기간 만료일까지 보관됩니다.<br>
		&nbsp;(3) 소비자보호에 관한 법률 제6조(거래기록의 보전 등) 및 동법 시행령 제6조에 의거,<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 계약 또는 청약철회 등에 관한 기록은5년,<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대금결제 및 재화등의 공급에 관한 기록은5년,<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 소비자의 불만 또는 분쟁처리에 관한 기록은3년동안 보관됩니다.<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동 개인정보는 법률에 의한 경우가 아니고서는 보유 되어지는 이외의 다른 목적으로는 이용되지 않습니다.<br>
		&nbsp;(4) 회원 정보: 회원탈퇴 완료 시 당사 사이트 이용 권한이 삭제되며,<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기존 구매 티켓에 대한 본인인증 필요성 등을 위해 회원가입에 따른 사용자정보는 6개월 동안<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보관됩니다.<br>
		2. 회원탈퇴 시 게시물 관리<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴 후 당사 사이트에 입력하신 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로 <br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다. 게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후,<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;탈퇴를 신청하시기 바랍니다.<br>
		3. 회원탈퇴 후 재가입 규정<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;탈퇴 회원이 재가입하더라도 기존의 다삼 적립금은 이미 소멸되었으므로 현재의 다삼 적립금에 양도되지 않습니다.<br>
		</div>
		<br>
		<div><input type="checkbox" class="chee"><span>위 내용을 모두 확인하였습니다</span></div>
		<br>
		<div style="width: 500px; margin-left: 450px;">
			<fieldset>
				<legend style="font-size: large; border: 0px solid white;"><strong>회원탈퇴를 위한 회원정보 인증절차</strong></legend>
				<div style="font-size: small;">회원가입 시 등록한 정보를 입력해주세요</div><br>
				<div style="text-align: left;">
					<div>
						<span style="margin-left: 70px;">회사 이름 </span>
						<span style="margin-left: 35px;">${ corpLogin.getC_name() }</span>
					</div>
					<div>
						<span style="margin-left: 70px;">비밀 번호 </span>
						<span style="margin-left: 30px;"><input type="password" id="corpPassword" 
							autocomplete="off" placeholder="비밀번호를 입력하세요"><br></span>
					</div>
					<div>
						<span style="margin-left: 70px;">대표 이름 </span>
						<span style="margin-left: 30px;"><input type="text" id="corpCeoName" 
							autocomplete="off" placeholder="대표자 이름을 입력하세요"></span>
					</div>
				</div>
			</fieldset>
		</div>
		<p align="center">&nbsp;
		<button onclick="deleteCheck()" 
			style="cursor: pointer; 
				background-color: #FFDF32; 
				width: 180px;
				height: 50px;
				color: white; 
				font-size: large;">회원탈퇴</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="deleteCancel()"
			style="cursor: pointer; 
				border: 1px solid #A8A8A9;
				width: 180px;
				height: 50px;
				color: black;
				font-size: large;">취소하기</button>&nbsp;
		</p>
	</fieldset>
	<script type="text/javascript">
		function deleteCheck() {
			if(!document.getElementsByClassName("chee").item(0).checked){
				alert("위 사항에 동의함에 체크해주세요.");
				return;
			}
			if(document.getElementById("corpPassword").value != "") {
				if(document.getElementById("corpCeoName").value != "") {
					var pwCheck = document.getElementById("corpPassword").value;
					var ceoCheck = document.getElementById("corpCeoName").value;
					var params = "c_pw="+pwCheck+"&c_ceo="+ceoCheck;
					sendRequest("/aaa/idvCorp/deleteCorpCheck", params, haha, "post");
				} else {
					alert("대표자 명을 입력해주세요.");
					document.getElementById("corpCeoName").focus();
					return;
				}
			} else {
				alert("비밀번호를 입력해주세요.");
				document.getElementById("corpPassword").focus();
				return;
			}
		}
		
		function haha() {
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					var rcvData = httpRequest.responseText;
					if(rcvData == "정보가 올바르게 삭제되었습니다.") {
						opener.location.href="/aaa/corp/corpLogout?deleteCorp=YES";
						self.close();
					} else if(rcvData == "비밀번호가 일치하지 않습니다.") {
						document.getElementById("corpPassword").value = "";
						document.getElementById("corpPassword").focus();
					} else if(rcvData == "대표자 정보가 일치하지 않습니다.") {
						document.getElementById("corpCeoName").value = "";
						document.getElementById("corpCeoName").focus();
					} else {
						alert(rcvData);
					}
				} else {
					alert("*** 실패 : " + httpRequest.status);
				}
			}
		}
		
		function deleteCancel() {
			location.href="/aaa/idvCorp/corpHome";
		}
	
	</script>
</body>
</html>
