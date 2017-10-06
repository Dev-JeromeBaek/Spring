<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.w3-btn {margin-bottom:10px;}
</style>
<style type="text/css">
th, td {
	padding: 10px;
}
</style>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body style="text-align: center;" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-95" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/cartAccountPopup.jsp">
<c:choose>
<c:when test="${mnum == null}">
<script type="text/javascript">
	alert("로그인을 해주십시오");
	window.opener.location.href="/aaa/mem/loginForm";
	self.close();
</script>
</c:when>
<c:otherwise>

	<h1>실시간 계좌이체 페이지</h1>
	<table style="text-align: center; margin: auto;">
		<tr>
			<td>상품명</td>
			<c:forEach items="${info}" var="each">
			<td>${each.di_name}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>결제금액</td>
			<td id="totalpriceView">${totalprice}원</td>
		</tr>
		<tr>
			<td>제공기간</td>
			<td>별도 제공기간 없음</td>
		</tr>
	</table>

	<hr color="orange">

	<table
		style="border-top-color: orange; margin: auto; text-align: center;">
		<tr>
			<td>입금은행</td>
			<td><select id="chooseBank">
					<option>은행선택</option>
					<option>KB국민은행</option>
					<option>NH농협은행</option>
					<option>우리은행</option>
					<option>기업은헹</option>
					<option>KEB하나은행</option>
					<option>우체국은행</option>
					<option>신한은행</option>
					<option>한국산업은행</option>
			</select></td>
		</tr>
		<tr>
			<td>계좌번호</td>
			<td><input type="number" id="bankPw"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td style="text-align: center;"><input type="password" size="4"
				maxlength="4" id="accountPw"></td>
		</tr>
		<tr>
			<td>예금주명</td>
			<td><input type="text" value="${mem.m_name}" id="memname"></td>
		</tr>
		<tr>
			<td>주민등록번호</td>
			<td><input type="text" size="4" maxlength="6" id="sixknow_one">-
			<td><input type="text" size="4" maxlength="2" id="sixknow_Two">xxxxx</td>
		</tr>
	</table>
<br>
	<input type="checkbox" class="cheackSec">결제서비스 이용약관에 동의하고 결제를 진행합니다
	<h3>
		<font color="red">새벽 4시조에서 제공하는 결제서비스 입니다</font>
	</h3>
	<input type="button" class="w3-button successno" onclick="successno()" value="취소">||<input
		type="button" class="w3-button success"
		onclick="success('${totalprice}','${discountpoint}','${point}','${di_nums}')"
		value="확인">  
	
</c:otherwise></c:choose>	
</body>

<script type="text/javascript">

var totalpriceOne = "${totalprice}";
var minerPoint = "${discountpoint}";
var totalpriceTotal = parseInt(totalpriceOne) - parseInt(minerPoint)+ 2500;
document.getElementById("totalpriceView").innerHTML =totalpriceTotal+"원";

	function success(totalprice,discountpoint,point,di_nums) {
		//   cheack = document.getElementsByName("cheackSec");
		var cheack = document.getElementsByClassName("cheackSec");
		var accountPw = document.getElementById("accountPw").value;
		var chooseBank = document.getElementById("chooseBank").value;
		var bankPw = document.getElementById("bankPw").value;

		//  	 alert(cheack);
		//   	alert(accountPw);
		//   	alert(chooseBank);
		if (chooseBank == "은행선택") {
			alert("은행을 골라주세요");
		}
		
		if(document.getElementById("sixknow_one").value.length <6){
			alert("주민번호 앞자리를 적어주십시오 (6글자)");
		}
		
		if(document.getElementById("sixknow_Two").value.length <2){
			alert("주민번호 뒷자리(2자리)를 적어주십시오");
		}
		
		if(document.getElementById("accountPw").value.length < 4){
			alert("계좌비밀먼호를 입력해주세요");
		}
		if (cheack[0].checked){
			
		} else {
			alert("결제서비스 이용약관에 동의해 주십시오");
		}
		if(document.getElementById("sixknow_Two").value.length == 2 
			&& document.getElementById("sixknow_one").value.length == 6
				&& chooseBank != "은행선택" && accountPw.length == 4
				&& cheack[0].checked){
		alert("주문이완료되었습니다");
		window.opener.location.href = "/aaa/mem/cartBuyAllSuccess?totalprice="+ totalprice+"&discountpoint="+discountpoint+"&point="+point+"&di_nums="+di_nums;
		self.close();
		}else{
			alert("다시");
		}
	
		
	
	}

	function successno() {
		self.close();
		alert("취소되었습니다");
	}
</script></html>

