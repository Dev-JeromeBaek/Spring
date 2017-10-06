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
</head>
<body>
	<fieldset class="popField">
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
