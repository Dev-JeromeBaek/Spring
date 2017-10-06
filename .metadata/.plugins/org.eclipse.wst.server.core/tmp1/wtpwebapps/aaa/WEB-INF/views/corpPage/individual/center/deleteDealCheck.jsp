<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/aaa/resources/js/yeob/httpRequest.js"></script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-42" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/deleteDealCheck.jsp">
	<br data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-42" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/deleteDealCheck.jsp">
	<div style="width: 450px;">
			<fieldset>
				<legend style="font-size: large; border: 0px solid white;"><strong>딜 삭제를 위한 인증절차</strong></legend>
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
		<button onclick="pwCheck('${ di_num }')"
			style="cursor: pointer; 
				background-color: #FFDF32; 
				width: 180px;
				height: 50px;
				color: black; 
				font-size: large;"><strong>삭제하기</strong></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="closePop()"
			style="cursor: pointer; 
				border: 1px solid #A8A8A9;
				width: 180px;
				height: 50px;
				color: black;
				font-size: large;"><strong>취소하기</strong></button>&nbsp;
		</p>
		
		<script type="text/javascript">
		function pwCheck(di_num) {
			if(document.getElementById("corpPassword").value != "") {
				var pwCheck = document.getElementById("corpPassword").value;
				var params = "c_pw="+pwCheck+"&di_num="+di_num;
				sendRequest("/aaa/idvCorp/dealDeleteOk", params, deleteCheck, "post");
			} else {
				alert("비밀번호를 입력해주세요.");
				document.getElementById("corpPassword").focus();
				return;
			}
		}
		
		function deleteCheck() {
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					var rcvData = httpRequest.responseText;
					if(rcvData == "정삭적으로 삭제되었습니다.") {
						opener.location.href="/aaa/idvCorp/dealDelete";
						self.close();
					} else if(rcvData == "비밀번호가 일치하지 않습니다.") {
						document.getElementById("corpPassword").value="";
						document.getElementById("corpPassword").focus();
					} else {
						alert(rcvData);
					}
				} else {
					alert("*** 실패 : " + httpRequest.status);
				}
			}
		}
		function closePop() {
			self.close();
		}
	</script>
</body>
</html>
