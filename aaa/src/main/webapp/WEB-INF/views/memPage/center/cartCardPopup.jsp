<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cardpopTRtd {
	padding: 8px;
	width : 200px; 
	text-align: center;
     font-size: 17px;
}

@media screen and (min-width: 981px) {
	html {
		font-size: 62.5%;
	}
}

@media screen and (min-width: 481px) and (max-width: 980px) {
	html {
		font-size: 9px;
	}
}

@media screen and (max-width: 480px) {
	html {
		font-size: 8px;
	}
}

.bodybidy {
	background: radial-gradient(rgb(253, 253, 253), rgb(248, 248, 248));
	font-family: -apple-system, BlinkMacSystemFont, "Roboto", "Open Sans",
		"Helvetica Neue", "Segoe UI", sans-serif;
	font-size: 1.6rem;
	margin: 0;
}

.demo {
	min-height: 470px;
	box-sizing: border-box;
	position: relative;
	padding-left: 1rem;
	padding-right: 1rem;
	display: flex;
	justify-content: center;
	align-items: center;
}

.footerrr {
	padding: 2rem;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

@media screen and (max-width: 480px) {
	.footer__item {
		margin-bottom: 2rem;
	}
}


.melnik909 {
	margin-left: 2rem;
}

/*
 * CSS payment card
 */
.payment-card {
	width: 60rem;
}

.payment-card__footer {
	text-align: center;
	margin-top: 2rem;
}

.bank-card {
	position: relative;
}

@media screen and (min-width: 481px) {
	.bank-card {
		height: 30rem;
	}
	.bank-card__side {
		border-radius: 10px;
		border: 1px solid transparent;
		position: absolute;
		width: 65%;
	}
	.bank-card__side_front {
		background-color: #8B4F1D;
		padding: 5%;
		box-shadow: 0 0 10px #f4f4f2;
		border-color: #a29e97;
		top: 0;
		left: 0;
		z-index: 3;
	}
	.bank-card__side_back {
		background-color: #C29F6D;
		padding: 24.5% 5% 11%;
		box-shadow: 0 0 2rem #f3f3f3;
		text-align: right;
		border-color: #dad9d6;
		top: 12%;
		right: 0;
	}
	.bank-card__side_back:before {
		content: "";
		width: 100%;
		height: 25%;
		background-color: #3c3c3c;
		position: absolute;
		top: 14%;
		right: 0;
	}
}

@media screen and (max-width: 480px) {
	.bank-card__side {
		border: 1px solid #a29e97;
		background-color: #f0f0ee;
		padding-left: 5%;
		padding-right: 5%;
	}
	.bank-card__side_front {
		border-radius: 10px 10px 0 0;
		border-bottom: none;
		padding-top: 5%;
	}
	.bank-card__side_back {
		border-radius: 0 0 10px 10px;
		border-top: none;
		padding-bottom: 5%;
	}
}

.bank-card__inner {
	margin-bottom: 4%;
}

.bank-card__inner:last-child {
	margin-bottom: 0;
}

.bank-card__label {
	display: inline-block;
	vertical-align: middle;
}

.bank-card__label_holder, .bank-card__label_number {
	width: 100%;
}

@media screen and (min-width: 481px) {
	.bank-card__month, .bank-card__year {
		width: 25%;
	}
}

@media screen and (max-width: 480px) {
	.bank-card__month, .bank-card__year {
		width: 48%;
	}
}

@media screen and (min-width: 481px) {
	.bank-card__cvc {
		width: 25%;
	}
}

@media screen and (max-width: 480px) {
	.bank-card__cvc {
		width: 100%;
		margin-top: 4%;
	}
}

.bank-card__hint {
	position: absolute;
	left: -9999px;
}

.bank-card__caption {
	text-transform: uppercase;
	font-size: 1.1rem;
	margin-left: 1%;
}

.bank-card__field {
	box-sizing: border-box;
	border: 3px solid #d0d0ce;
	width: 100%;
	padding: 1rem;
	font-family: inherit;
	font-size: 100%;
}

.bank-card__field:focus {
	outline: none;
	border-color: #fdde60;
}

.bank-card__separator {
	font-size: 3.2rem;
	color: #c4c4c3;
	margin-left: 3%;
	margin-right: 3%;
	display: inline-block;
	vertical-align: middle;
}

@media screen and (max-width: 480px) {
	.bank-card__separator {
		display: none;
	}
}

@media screen and (min-width: 481px) {
	.bank-card__footer {
		/*         background-image: url("https://stas-melnikov.ru/demo-icons/mastercard-colored.svg"), url("https://stas-melnikov.ru/demo-icons/visa-colored.svg"); */
		background-repeat: no-repeat;
		background-position: 78% 50%, 100% 50%;
	}
}

@media screen and (max-width: 480px) {
	.bank-card__footer {
		display: flex;
		justify-content: space-between;
	}
}

.payment-card__button {
	background-color: #8B4F1D;
	transition: background-color .4s ease-out;
	border-radius: 5px;
	border: 3px solid transparent;
	cursor: pointer;
	padding: 1rem 6.5rem;
	font-size: 100%;
	font-family: inherit;
	color: #fff;
}

.payment-card__button:focus {
	outline: none;
	border-color: red; 
}

.payment-card__button:hover, .payment-card__button:focus {
	background-color: #A52A2A;
}
</style>
</head>
<body style="text-align: center;" class="bodybidy">
<c:choose>
<c:when test="${mnum == null}">
<script type="text/javascript">
	alert("로그인을 해주십시오");
	location.href="/aaa/mem/loginForm";
</script>
</c:when>
<c:otherwise>
	<h1 > <font color="#8B4F1D">신용카드 결제페이지</font></h1>

	<table style="text-align: center; margin: auto;" >

		<tr class="cardpopTRtd">
		<td  class="cardpopTRtd" >결제 은행</td>
		<td  class="cardpopTRtd" >${cardCbank}</td>
		<td class="cardpopTRtd">상품명</td>
			<c:forEach items="${info}" var="each">
			
			<td class="cardpopTRtd">${each.di_name}<br></td>
			</c:forEach>
		</tr>
		<tr class="cardpopTRtd">
			<td class="cardpopTRtd">결제금액</td>
			<td id="totalpriceView" class="cardpopTRtd"></td>
			<td class="cardpopTRtd">제공기간</td>
			<td class="cardpopTRtd">별도 제공기간 없음</td>
		</tr>
	</table>

	<div class="demo">
		<form class="payment-card">
			<div class="bank-card">
				<div class="bank-card__side bank-card__side_front">
					<div class="bank-card__inner">
						<label class="bank-card__label bank-card__label_holder"> <span
							class="bank-card__hint">Holder of card</span>
						<%-- pattern="[A-Za-z, ]{2,}" --%> <input type="text"
							class="bank-card__field" placeholder="Holder of card" id="cardInputOne"
							name="holder-card" required>
						</label>
					</div>
					<div class="bank-card__inner">
						<label class="bank-card__label bank-card__label_number"> <span
							class="bank-card__hint">Number of card</span>
						<%--pattern="[0-9]{16}" --%> <input type="text"
							class="bank-card__field" placeholder="Number of card" id="cardInputTwo"
							name="number-card" required>
						</label>
					</div>
					<div class="bank-card__inner">
						<span class="bank-card__caption">valid thru</span>
					</div>
					<div class="bank-card__inner bank-card__footer">
						<label class="bank-card__label bank-card__month"> <span
							class="bank-card__hint">Month</span>
						<%--pattern="[0-9]{2}"  --%> <input type="text"
							class="bank-card__field" placeholder="MM" maxlength="2"
							name="mm-card" required id="cardInputThree">
						</label> <span class="bank-card__separator">/</span> <label
							class="bank-card__label bank-card__year"> <span
							class="bank-card__hint">Year</span>
						<%--pattern="[0-9]{2}" --%> <input type="text"
							class="bank-card__field" placeholder="YY" maxlength="2"
							name="year-card" required id="cardInputFour">
						</label>
					</div>
				</div>
				<div class="bank-card__side bank-card__side_back">
					<div class="bank-card__inner">
						<label class="bank-card__label bank-card__cvc"> <span
							class="bank-card__hint">CVC</span>
						<%--pattern="[0-9]{3}" --%> <input type="text"
							class="bank-card__field" placeholder="CVC" maxlength="3"
							name="cvc-card" required id="cardInputFive">
						</label>
					</div>
				</div>
			</div>
			<div class="payment-card__footer">
				<button class="payment-card__button" onclick="closePop()">결제취소</button>
				<input type="button" value="결제하기" class="payment-card__button"
					onclick="payment_card('${totalprice}','${di_nums}','${cardCbank}','${discountpoint}','${point}')">
			</div>
		</form>
	</div>
	</c:otherwise></c:choose>
</body>
<script type="text/javascript">
	var totalpriceOne = "${totalprice}";
	var minerPoint = "${discountpoint}";
	var totalpriceTotal = parseInt(totalpriceOne) - parseInt(minerPoint)+ 2500;
	document.getElementById("totalpriceView").innerHTML = totalpriceTotal+"원";
	function payment_card(totalprice,di_nums,cardCbank,discountpoint,point) {
		
	
		if(document.getElementById("cardInputOne").value.length < 8){
			alert("Holder of card칸을  적어주십시오(8글자이상)");
			
		}
		if(document.getElementById("cardInputTwo").value.length < 8){
			alert("Number of card칸 를 적어주십시오(8글자이상)");
		}
		if(document.getElementById("cardInputThree").value.length < 2){
			alert("Month 칸을 정확히적어주십시오(2칸)");
		}
		if(document.getElementById("cardInputFour").value.length < 2){
			alert("Year 칸을 정확히적어주십시오(2칸)");
		}
		
		if(document.getElementById("cardInputFive").value.length < 3){
			alert("CVC 칸을 정확히적어주십시오(3칸)");
		}
		if(document.getElementById("cardInputOne").value.length >= 8
				&& document.getElementById("cardInputTwo").value.length >= 8
				&& document.getElementById("cardInputThree").value.length == 2
				&& document.getElementById("cardInputFour").value.length == 2
				&& document.getElementById("cardInputFive").value.length == 3){
			alert("구매되었습니다");
		window.opener.location.href=
		"/aaa/mem/cartBuyAllSuccess?totalprice="+totalprice+"&cardCbank="
				+cardCbank+"&discountpoint="+discountpoint+"&point="+point+"&di_nums="+di_nums;
	self.close();
		}
	}
	function closePop() {
		self.close();
	}
		

</script>
</html>

