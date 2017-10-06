<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<br><br><br><br><br><br><br>
	<br>
	<div style="width: 500px; margin-left: 450px;">
			<fieldset>
				<legend style="font-size: large; border: 0px solid white;"><strong>정보수정을 위한 회원정보 인증절차</strong></legend>
				<div style="font-size: small;">비밀번호를 입력해주세요</div><br>
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
				</div>
			</fieldset>
		</div>
		<br>
		<p align="center" style="margin-left: -60px;">&nbsp;
		<button onclick="pwCheck()" 
			style="cursor: pointer; 
				background-color: #FFDF32; 
				width: 180px;
				height: 50px;
				color: black; 
				font-size: large;"><strong>비밀번호확인</strong></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="modifyCancel()"
			style="cursor: pointer; 
				border: 1px solid #A8A8A9;
				width: 180px;
				height: 50px;
				color: black;
				font-size: large;"><strong>취소하기</strong></button>&nbsp;
		</p>
		
		<script type="text/javascript">
		function pwCheck() {
			var pwCheck = document.getElementById("corpPassword").value;
			var params = "c_pw="+pwCheck;
			sendRequest("/aaa/idvCorp/modifyGo", params, momo, "post");
		}
		
		function momo() {
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					var rcvData = httpRequest.responseText;
					if(rcvData == "정보 수정 페이지로 이동합니다.") {
						location.href="/aaa/idvCorp/modifyCorpPage";
					} else {
						alert(rcvData);
					}
				} else {
					alert("*** 실패 : " + httpRequest.status);
				}
			}
		}
		
		function modifyCancel() {
			location.href="/aaa/idvCorp/corpHome";
		}
	
	</script>
</body>
</html>
