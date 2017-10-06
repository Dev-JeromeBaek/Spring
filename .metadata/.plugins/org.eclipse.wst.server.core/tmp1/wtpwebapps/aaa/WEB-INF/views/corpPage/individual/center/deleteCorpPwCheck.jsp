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
		}
		.popField {
			width: auto;
			height: auto;
		}
		p {
			font-size: large;
			font-family: "배달의민족 한나는 열한살";
			color: red;
		}
		
	</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-41" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/deleteCorpPwCheck.jsp">
	<fieldset class="popField" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-41" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/deleteCorpPwCheck.jsp">
	<legend class="cancelLegend">[ 기업회원 탈퇴 확인 ]</legend>
		<div>
			<fieldset>
				<legend>Password Check</legend>
					<input id="inputPW" type="password" name="corpPassword" 
						autocomplete="off" onclick="checkPassword()"><br>
					<div id="pwCheck"></div>
			</fieldset>
		</div>
		<p align="center">&nbsp;
		<a onclick="deleteOk('${ di_num }')" 
			style="cursor: pointer; 
				background-color: red; 
				color: white; 
				font-family: '배달의민족 주아'; 
				font-size: large;">삭제하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a onclick="closePop()"
			style="cursor: pointer; 
				background-color: lime; 
				color: black; 
				font-family: '배달의민족 주아'; 
				font-size: large;">삭제취소</a>&nbsp;
		</p>
	</fieldset>
	
	<script type="text/javascript">

		function deleteOk(num) {
			opener.location.href="/aaa/idvCorp/deleteOk?di_num=" + num;
			self.close();
		}
		
		function closePop() {
			self.close();
		}
	</script>
</body>
</html>
