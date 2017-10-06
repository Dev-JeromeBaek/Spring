<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.SKSKTLGUPLUS:HOVER{
	background-color: red;	
	transition: background-color .4s ease-out;
	border-radius: 5px;
	border: 3px solid transparent;
	cursor: pointer;
	font-size: 15px;
	font-family: inherit;
	color: #fff;	
	
}

.SKSKTLGUPLUS:FOCUS{
background-color: red;
transition: background-color .4s ease-out;
	border-radius: 5px;
	border: 3px solid transparent;
	cursor: pointer;
	padding: 1rem 2.5rem;
	font-size: 15px;
	font-family: inherit;
	color: #fff;
}

.SKSKTLGUPLUS{
	background-color: gray;
	transition: background-color .4s ease-out;
	border-radius: 5px;
	border: 3px solid transparent;
	cursor: pointer;
	padding: 1rem 1.0rem;
	font-size: 15px;
	font-family: inherit;
	color: #fff;	

}
.directPhonepwjl {

	padding: 15px; 
	text-align: center;
     border-color: green;
     font-size: 22px;
}

.pphoneTwoPorup {
	background-color: black;
	transition: background-color .4s ease-out;
	border-radius: 5px;
	border: 3px solid transparent;
	cursor: pointer;
	padding: 1rem 1.5rem;
	font-size: 15px;
	font-family: inherit;
	color: #fff;
}

.pphoneTwoPorup:focus {
	outline: none;
	border-color: red; 
}

.pphoneTwoPorup:hover {
	background-color: gray;
	font: black;
}
</style>
</head>
<body>
<c:choose>
<c:when test="${mnum == null}">
<script type="text/javascript">
	alert("로그인을 해주십시오");
	window.opener.location.href="/aaa/mem/loginForm";
	self.close();
</script>
</c:when>
<c:otherwise>
	<table style="text-align: center; margin: auto;" >
	
		<tr class="directPhonepwjl">
			<td class="directPhonepwjl">상품명</td>
			<c:forEach items="${info}" var="each">
			
			<td >${each.di_name} <br></td>
	</c:forEach>
		</tr>
		<tr class="directPhonepwjl">
			<td class="directPhonepwjl">결제금액</td>
			<td id="totalpriceView" class="directPhonepwjl"></td>
		</tr>
		<tr class="directPhonepwjl">
			<td class="directPhonepwjl">제공기간</td>
			<td class="directPhonepwjl">별도 제공기간 없음</td>
		</tr>
	</table>

	<table style="margin: auto;" >
		<tr class="directPhonepwjl">
			<td class="directPhonepwjl" colspan="2">
				<button class="SKSKTLGUPLUS">SKT</button>
				<button class="SKSKTLGUPLUS">SK</button>
				<button class="SKSKTLGUPLUS">LGU+</button></td>
		</tr>
		<tr class="directPhonepwjl">
			<td class="directPhonepwjl">휴대폰 번호</td>
			<td class="directPhonepwjl"><select id="phone_know_One">
					<option>앞자리</option>
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
			</select>-<input type="text" maxlength="4" size="3" id="phone_know_Two"> -
			<input type="text" maxlength="4" size="3" id="phone_know_Three"></td>
		</tr>
		<tr class="directPhonepwjl">
			<td class="directPhonepwjl">주민번호 앞 6자리 + 뒤 2자리</td>
			<td class="directPhonepwjl"><input type="text" maxlength="6" id="sixknow_one" size="4">-
			<input type="text" maxlength="2" size="1"id="sixknow_Two" >XXXXX</td>
		<tr>
	</table>
	<hr >
	휴대폰 결제 한도 월 최대 50만원으로 상향(통신사 고객센터로 문의)
	<hr>
	<div class="plusPhone">
	
	</div>
	<div id="pluspphone">
	</div><center>
	<input type="button" value="취소" onclick="nono()" class="w3-button w3-ripple w3-red">
	
	<input type="button" class="w3-button w3-ripple w3-yellow "value="인증요청" onclick="gogo('${totalprice}','${discountpoint}','${point}','${di_nums}')" >
</center>
	<table style="margin: auto; display: none;" class="plusPhone">
		<tr class="directPhonepwjl">
			<td class="directPhonepwjl">인증번호 확인</td>
			<td class="directPhonepwjl"><input type="text" id="pwValue" maxlength="4"></td>
		</tr>
		<tr class="directPhonepwjl">
			<td colspan="2" class="directPhonepwjl">
			<input type="button" class="pphoneTwoPorup" value="인증하기" onclick="whatPhone('${totalprice}','${di_nums}','${discountpoint}','${point}')" ></td>
		</tr>
	</table>
	</c:otherwise>
	</c:choose>
</body>
<script type="text/javascript">

	var phone = "${mem.m_phone}";
		var phoneNumber = phone.split("-"); 
	function nono() {
		alert("취소합니다");
		self.close();
	}
	var totalpriceOne = "${totalprice}";
	var minerPoint = "${discountpoint}";
	var totalpriceTotal = parseInt(totalpriceOne) - parseInt(minerPoint)+ 2500;
	document.getElementById("totalpriceView").innerHTML =totalpriceTotal+"원";

	function gogo(totalprice,discountpoint,point,di_nums) {
		
		if(document.getElementById("phone_know_One").value == "앞자리"){
			alert("핸드폰앞자리를 골라주세요");
			
		}else{
			if(parseInt(document.getElementById("phone_know_One").value) != phoneNumber[0] ){
				alert("핸드폰번호 앞자리가 일치하지않습니다");
			}
		}
		if(document.getElementById("phone_know_Two").value == ""){
			alert("핸드폰 두번째 자리를 입력해주세요");
		}else{
			if(parseInt(document.getElementById("phone_know_Two").value) != phoneNumber[1] ){
				alert("핸드폰번호 두번쨰자리가 일치하지않습니다");
			}
		}
		if(document.getElementById("phone_know_Three").value == ""){
			alert("핸드폰 세번째 자리를 입력해주세요");
		}else{
			if(parseInt(document.getElementById("phone_know_Three").value) != phoneNumber[2] ){
				alert("핸드폰번호 세번쨰자리가 일치하지않습니다");
			}
			if(document.getElementById("sixknow_one").value.length <6){
				alert("주민번호 앞자리를 적어주십시오 (6글자)");
			}
			
			if(document.getElementById("sixknow_Two").value.length <2){
				alert("주민번호 뒷자리(2자리)를 적어주십시오");
			}
			if(parseInt(document.getElementById("phone_know_One").value) == phoneNumber[0]
					&& parseInt(document.getElementById("phone_know_Two").value) == phoneNumber[1]
					&& parseInt(document.getElementById("phone_know_Three").value) == phoneNumber[2]
					&& document.getElementById("sixknow_one").value.length == 6
					&& document.getElementById("sixknow_Two").value.length == 2 ){
				alert("예시 인증번호(외우셈) : 1998");
				document.getElementById("pluspphone").innerHTML =
				"<table style='margin: auto; class='pppp'><tr><td>인증번호 확인</td><td><input type='text' id='pwValue' maxlength='4'>"+
				"<input type='button'  class='pphoneTwoPorup' value='인증하기'" + 
				"onclick='whatPhone(\""+totalprice.trim()+"\""+","+"\""+di_nums.trim()+"\""+","+"\""+discountpoint+"\""+","+"\""+point+"\")'></td></tr></table>";
				}
		}
		
	}
	
	function whatPhone(totalprice, di_nums ,discountpoint,point) {
		var pwValue = document.getElementById("pwValue").value;
		
		if (pwValue == "1998") {
			alert("결제가 완료되었습니다");
			window.opener.location.href =
				"/aaa/mem/cartBuyAllSuccess?totalprice="+totalprice+"&di_nums="+di_nums
					+"&discountpoint="+discountpoint+"&point="+point;


					self.close();
		} else {
			alert("결제가 실패되었습니다. 사유 :(인증번호 불일치)");
		}
	}
	
</script>

</html>

