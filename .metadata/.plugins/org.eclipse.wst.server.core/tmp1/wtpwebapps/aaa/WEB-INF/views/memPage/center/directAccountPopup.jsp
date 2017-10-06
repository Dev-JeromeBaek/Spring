<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.accountDirectPopuoup {
	padding: 10px; 
	width : 30%;
	text-align: center;
     border-color: green;
     font-size: 17px; 
}

.us-form select {
  position: relative;
  -webkit-appearance: button;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  display: inline-block;
  vertical-align: middle;
  height: 2.2em;
  margin: 2px;
  padding: 0.3em 0.6em;
  background: white;
  border: 1px solid #aaaaaa;
  border-radius: 0.3em;
  box-shadow: inset 0 1px 2px rgba(255, 255, 255, 0.3), 0 1px 2px rgba(0, 0, 0, 0.4);
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 0.85em;
  font-weight: normal;
  overflow: hidden;
  text-shadow: 0 1px 0 white;
  -webkit-transition: box-shadow 200ms, border-color 200ms;
  -moz-transition: box-shadow 200ms, border-color 200ms;
  transition: box-shadow 200ms, border-color 200ms;
  white-space: nowrap; 
}
.us-form select option {
  text-shadow: none; 
}
.us-form select:disabled, .us-form select:disabled:hover {
  color: #cccccc !important;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.4) !important; 
}
.us-form select.error {
  color: #bf212e;
  border-color: #bf212e; 
}

.us-form.error select, .us-form .error select {
  color: #bf212e;
  border-color: #bf212e; 
}
.us-form select:not([size]):focus {
  outline: none;
  border-color: #66ccff;
  box-shadow: inset 0 1px 2px rgba(255, 255, 255, 0.3), 0 1px 2px rgba(0, 0, 0, 0.4), 0 0 4px #66ccff; 
}
.boxshadow.no-touch .us-form select:not([size]):hover {
  box-shadow: inset 0 1px 2px rgba(255, 255, 255, 0.3), 0 1px 2px rgba(0, 0, 0, 0.4), 0 0 0 3px #ffff88; 
}@-moz-document url-prefix() {
  .us-form select:not([size]) {
    max-width: 999px !important; 
  }
  
  }

</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body style="text-align: center;" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-102" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/directAccountPopup.jsp">
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
		<tr class="accountDirectPopuoup">
			<td class="accountDirectPopuoup">상품명</td>
			<td class="accountDirectPopuoup">${info.di_name}</td>
		</tr>
		<tr class="accountDirectPopuoup">
			<td class="accountDirectPopuoup">결제금액</td>
			<td id="totalpriceView" class="accountDirectPopuoup">${totalprice}원</td>
		</tr>
		<tr class="accountDirectPopuoup">
			<td class="accountDirectPopuoup">제공기간</td>
			<td class="accountDirectPopuoup">별도 제공기간 없음</td>
		</tr>
	</table>

<br>

	<table style="border-top-color: orange; margin: auto; text-align: center;">
		<tr class="us-form">
			<td class="accountDirectPopuoup">입금은행</td>
			 <td class="unwrap"><select id="chooseBank">
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
		<tr class="accountDirectPopuoup">
			<td class="accountDirectPopuoup">계좌번호</td>
			<td class="accountDirectPopuoup"><input type="number" id="bankPw"></td>
		</tr>
		<tr>
			<td class="accountDirectPopuoup">비밀번호</td>
			<td style="text-align: center;"><input type="password" size="4" class="accountDirectPopuoup"
				maxlength="4" id="accountPw"></td>
		</tr>
		<tr class="accountDirectPopuoup">
			<td class="accountDirectPopuoup">예금주명</td>
			<td class="accountDirectPopuoup"><input type="text" value="${mem.m_name}" id="memname"></td>
		</tr>
		<tr class="accountDirectPopuoup">
			<td class="accountDirectPopuoup">주민등록번호</td>
			<td class="accountDirectPopuoup"><input type="text" size="4" maxlength="6" id="sixknow_one">-
			<td class="accountDirectPopuoup"><input type="text" size="4" maxlength="2" id="sixknow_Two">xxxxx</td>
		</tr>
	</table>
<br>
	<input type="checkbox" class="cheackSec">결제서비스 이용약관에 동의하고 결제를 진행합니다
	<h3>
		<font color="red">새벽 4시조에서 제공하는 결제서비스 입니다</font>
	</h3>
	<input type="button" class="successno" onclick="successno()" value="취소">||<input
		type="button" class="success"
		onclick="success('${totalprice}','${mnum}','${infonum}','${coco}','${discountpoint}','${point}')"
		value="확인">  
	
</c:otherwise></c:choose>	
</body>

<script type="text/javascript">

var totalpriceOne = "${totalprice}";
var minerPoint = "${discountpoint}";
var totalpriceTotal = parseInt(totalpriceOne) - parseInt(minerPoint)+ 2500;
document.getElementById("totalpriceView").innerHTML =totalpriceTotal+"원";

	function success(totalprice, mnum, infonum, coco,discountpoint,point) {
		var cheack = document.getElementsByClassName("cheackSec");
		var accountPw = document.getElementById("accountPw").value;
		var chooseBank = document.getElementById("chooseBank").value;
		var bankPw = document.getElementById("bankPw").value;

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
		window.opener.location.href = "/aaa/mem/directBuyAllSuccess?totalprice="+ totalprice + "&mnum=" + mnum + "&infonum=" + infonum
				+ "&coco=" + coco +"&discountpoint="+discountpoint+"&point="+point;
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

