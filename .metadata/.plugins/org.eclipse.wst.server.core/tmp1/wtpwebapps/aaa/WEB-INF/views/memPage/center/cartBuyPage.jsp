<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.AllBordersTrr {
 	padding: 15px; 
	text-align: center;
     border-color: red;
     font-size: 22px;
      font-weight: bold; 
}
.AllBordersTrrr {
 	padding: 15px; 
	text-align: center;
     border-color : red;
     font-size: 15px;
/*       font-weight: bold;  */
}

.AllBordersTtr {
	padding: 10px; 
	text-align: center;
     border-color: green;
     font-size: 15px;
      font-weight: bold; 
}

.AllBordersTttr {
 	padding: 15px; 
	text-align: center;
     border-color : grren;
     font-size: 15px;
/*       font-weight: bold;  */
}
.button-three-gogo {
    position: relative;
    background-color: red;
    border: none;
    padding-top: 15px;
    padding-bottom:30px;
     font-weight : bolder; 
    font-size : 17px;
    width: 200px;
    text-align: center;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    text-decoration: none;
    overflow: hidden;
} 

.button-three-gogo:hover{
   background:orange;
   box-shadow:0px 2px 10px 5px #97B1BF;
   color:#000;
}

.button-three-gogo:after {
    content: "";
    background: orange;
    display: block;
    position: absolute;
    padding-top: 300%;
    padding-left: 350%;
    margin-left: -20px !important;
    margin-top: -120%;
    opacity: 0;
    transition: all 0.8s;
}

.button-three-gogo:active:after {
    padding: 0;
    margin: 0;
    opacity: 1;
    transition: 0s;
}

.AllRedstrr {
padding: 15px; 
     border-bottom: 6px solid red;
    background-color: gray;
    font-weight: bolder;
}
.AllRedstrrr {
padding: 15px; 
     border-bottom: 6px solid green;
    background-color: gray;
    font-weight: bolder;
}
</style>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body style="text-align: left;" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-96" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/cartBuyPage.jsp">
<c:choose>
<c:when test="${mnum == null}">
<script type="text/javascript">
	alert("로그인을 해주십시오");
	location.href="/aaa/mem/loginForm";
</script>
</c:when>
<c:otherwise>


	<i class="fa fa-cloud" style="font-size:48px;color:red;"></i><h1 class="AllRedstrr">주문 / 결제 </h1><br>
	<h2>
	<c:forEach var="each" items="${info}" >
		<font color="F57878" style="font-weight: bolder;" size="10"  >[ ${each.di_exp} -&nbsp; ${each.di_name} ] </font>상품을 주문합니다. <br>
	</c:forEach>
	</h2>
	<h2><br>
		<font>주문하신 상품의 자세한 옵션과 가격은 아래 상품정보에서 확인하실 수 있습니다.</font>
	</h2>&nbsp;<br>&nbsp;
	
	<i class="fa fa-cloud" style="font-size:48px;color:red;"></i><h1 class="AllRedstrr">구매자 정보</h1>
	<table border="1">
		<tr class="AllBordersTrr">
			<td class="AllBordersTrr">이름</td>
			<td class="AllBordersTrr">연락처</td>
		</tr>
		<tr class="AllBordersTrr">
			<td class="AllBordersTrrr">${mem.m_name}</td>
			<td class="AllBordersTrrr">${mem.m_phone}</td>
		</tr>
	</table>
	<%-- --%>&nbsp;<br>&nbsp;
	<i class="fa fa-cloud" style="font-size:48px;color:red;"></i><h1 class="AllRedstrr" >구매자</h1>
	<table border="1" class="AllBordersTrr">
		<tr>
			<td class="AllBordersTrr">이름</td>
			<td class="AllBordersTrr">연락처</td>
		</tr>
		<tr>
			<td class="AllBordersTrrr">${mem.m_name}</td>
			<td class="AllBordersTrrr">${mem.m_phone}</td>
		</tr>
	</table>&nbsp;<br>&nbsp;

	<i class="fa fa-cloud" style="font-size:48px;color:red;"></i>  <h1 class="AllRedstrr" >주문상품 정보</h1>
	<table border="1" class="AllBordersTrr">
		<tr class="AllBordersTrr">
			<td class="AllBordersTrr">상품정보</td>
			<td class="AllBordersTrr">상품금액</td>
			<td class="AllBordersTrr">할인금액</td>
			<td class="AllBordersTrr">배송비</td>
			<td class="AllBordersTrr">주문금액(배송비추가)</td>
		</tr>
		<tr class="AllBordersTrrr"><td class="AllBordersTrrr">
		<c:forEach items="${info}" var="each">
			[${each.di_name}]
		</c:forEach></td>
			<td class="AllBordersTrrr">${totalprice}</td>
			<td id="ii_price" class="AllBordersTrrr"></td>
			<td class="AllBordersTrrr">2,500</td>
			<td id="iii_pricee" class="AllBordersTrrr">원</td>
		</tr>
			
	</table>

	<br><br><br><br>
	
	<i class="fa fa-cloud" style="font-size:48px;color:green;"></i><font color="gray">
	등급할인과 별도로 택배비가 2,500원 추가됩니다</font>
	<h1 class="AllRedstrrr">결제정보입력</h1>
	<table border="1" >
		<tr class="AllBordersTtr">
			<td class="AllBordersTtr">티몬캐쉬 · 적립금</td>
			<td ><input type="text" id="plusMoney" style="border-color: red">원 <br> <div id="p_pricee"></div> </td>
			<td rowspan="6">상품금액 &nbsp;&nbsp;${totalprice}원<br> 
				배송비 &nbsp; 2500  원<br>등급별 할인 ${mem.m_name}님의 등급 : ${mem.m_grade} 등급<br>총 결제 금액<div id="iii_price"></div>
			</td>
		</tr>
		<tr class="AllBordersTtr">
			<td class="AllBordersTtr">결제수단 선택</td>
			<td class="AllBordersTtr"><button class="toggleone"><input type="radio" name="ex1" checked="checked">신용카드</button>
				<button class="toggletwo"><input type="radio" name="ex1" >휴대폰결제</button>
				<button class="togglethree"><input type="radio" name="ex1" >실시간 계좌이체</button> 
				<button class="toggleFour"><input type="radio" name="ex1" >무통장입금</button></td>
		</tr>
	</table>
	<table border="1" class="fourTable" style="display: none" >

		<tr class="AllBordersTtr" >
			<td class="AllBordersTtr">입금은행</td>
			<td class="AllBordersTttr"><select name="cbank" id="cbank">
					<option >농협</option>
					<option>국민</option>
					<option>신한</option>
					<option>우리</option>
					<option>KEB하나</option>
					<option>기업</option>
					<option>하나</option>
			</select></td>
		</tr>
		<tr>
			<td class="AllBordersTtr">예금주</td>
			<td class="AllBordersTttr"><input type="text" value="${mem.m_name}" name="bankName"></td>
		</tr>
		<tr>
			<td class="AllBordersTtr">입금기한</td>
			<td class="AllBordersTttr">2017/03/16까지</td>
		</tr>
		<tr>
			<td colspan="2" class="AllBordersTttr">소득공제용<br>
				<button class="soToggle" class="AllBordersTttr">소득공제용</button>|
				<button class="gyToggle" class="AllBordersTttr">지출증빙용</button>|
				<button class="miToggle" class="AllBordersTttr">미발행</button>
			</td>
		</tr>


	</table>
	<table class="oneTable" border="1">
		
		<tr>
			<td class="AllBordersTtr">카드종류</td>
			<td class="AllBordersTtr"><select name="cbank" id="cardCbank">
					<option>BC</option>
					<option>신한</option>
					<option>KB국민</option>
					<option>삼성</option>
					<option>현대</option>
					<option>롯데</option>
					<option>하나</option>
					<option>외환</option>
					<option>NH채움</option>
					<option>씨티</option>
					<option>우리</option>
					<option>IBK기업</option>
					<option>우체국카드</option>
			</select></td>
		</tr>
		<tr class="AllBordersTtr">
			<td class="AllBordersTtr">할부개월</td>
			<td class="AllBordersTtr"><select><option>일시불</option></select></td>
		</tr>

	</table>

	<table class="twoTable" style="display: none" border="1">

		<tr>
			<td colspan="2" class="AllBordersTtr">휴대폰 결제 취소는 결제 당월에만 가능합니다.</td>
		</tr>

	</table>
	<table class="threeTable" style="display: none;" border="1">
		
		<tr class="AllBordersTtr">
			<td colspan="2" >
				<button class="soToggle">소득공제용</button>|
				<button class="gyToggle">지출증빙용</button>|
				<button class="miToggle">미발행</button>
			</td>
		</tr>
	</table>

	<table border="1" class="toggleSo" style="display: none;">
		<tr class="AllBordersTtr">
			<td colspan="2" class="AllBordersTtr">현금영수증</td>
			<td class="AllBordersTtr">휴대폰번호 &nbsp; <input type="text" maxlength="11">(-숫자만적으세요) <br>-미발행을
				선택하신 경우에도 현금영수증이 자진발급 됩니다.
			</td>
		</tr>
	</table>
	<table border="1" class="toggleGy" style="display: none">
		<tr class="AllBordersTtr">
			<td class="AllBordersTtr">현금영수증</td>
			<td class="AllBordersTtr">사업자번호&nbsp;<input type="text">(-숫자만적으세요) <br>
			-미발행을 선택하신 경우에도 현금영수증이 자진발급 됩니다.
			</td>
		</tr>
	</table>

	<br>
	<i class="fa fa-cloud" style="font-size:48px;color:green;"></i><h1 class="AllRedstrrr">개인정보 제3자 제공 및 주의사항 동의</h1>
	<br>
	<button class="offerToggle">개인정보 제3자 제공</button>
	|
	<button class="mattersToggle">주의사항</button>

	<table border="1" style="text-align: center;" class="toggleOffer">
		<tr class="AllBordersTtr">
			<td colspan="4" class="AllBordersTtr">서비스 제공을 위해 아래 정보가 제공됩니다. <br> 고객님께서는 정보제공에
				동의하지 않을 수 있으며, 동의하지 않는 경우 서비스 이용이 제한될 수 있습니다.
			</td>
		</tr> <tr class="AllBordersTtr">
			<td class="AllBordersTtr">개인정보를 제공 받는자</td>
			<td class="AllBordersTtr">제공목적</td>
			<td class="AllBordersTtr">제공정보</td>
			<td class="AllBordersTtr">개인정보를 제공 받는 자의 개인정보 보유 및 이용기간</td>
		</tr> <tr class="AllBordersTtr">
			<td class="AllBordersTtr">아리양</td>
			<td class="AllBordersTtr">티켓 본인 확인 성명</td>
			<td class="AllBordersTtr">휴대폰 번호 서비스</td>
			<td class="AllBordersTtr">제공완료 6개월 후 삭제</td>
		</tr>
	</table>

	<table id="toggleMatters" style="display: none; " border="1"  >
		<tr>
			<td class="AllBordersTtr">1. 티켓 사용조건 : 고객은 사이트에 명시된 내용 및 “구매 전 주의사항”을 확인하여야 할 책임이 있으며,
				기재된 조건에 따라서만 티켓을 사용하실 수 있습니다.<br> 2. 취소 및 환불 규정<br> &nbsp;
				&nbsp; 가. 공동구매 목표인원 미달 시 본 공동구매는 취소될 수 있으며 이 경우 결제하신 금액은 전액 환불됩니다.<br>
				&nbsp; &nbsp; 나. 공동구매 목표인원이 충족되어 구매가 성사된 경우 본 공동구매의 특성상 사이트 “구매 전
				주의사항”에 기재된 환불기간 이후 또는 이용약관에 기재된 “상품 환불 특칙”이 적용되는 경우 환불이 불가합니다.<br>
				3. 유효기간 경과 후 공동구매 티켓 등의 사용 및 환불 : 본 공동구매의 특성상 고객의 사정으로 인하여 사이트 “구매 전
				주의사항”에 명시된 유효기간이 경과된 티켓은 사용할 수 없습니다. <br> &nbsp; &nbsp; 다만 이 경우
				회사의 환불정책에 따라 일부 서비스에 한하여 미사용금액의 70%를 티몬 적립금으로 환불할 수 있습니다.
			</td>
		</tr>
	</table>
	<br>
	<input type="checkbox" class="ccheckk">개인정보 제3자 제공에 동의 &nbsp;&nbsp;
	<input type="checkbox" class="ccheckk">주의 사항에 동의
	<br>
	<br>
	<br>
	
	<i class="fa fa-cloud" style="font-size:48px;color:green;"></i><h1 class="AllRedstrrr">결제대행서비스 이용약관</h1><br><br>
	<h1> <button class="personalOne">결제대행서비스 이용약관</button>|
		<button class="personalTwo">개인정보 수집 , 이용</button> |
		<button class="personalThree">개인정보 제공 , 위탁</button>
	</h1><br><br><h5>
		<textarea rows="5" cols="5" class="personal-Toggle-One" disabled="disabled" style="background-color: white; font-size: 15px;"> 제1조 (목적)
이 약관은 전자지급결제대행서비스 및 결제대금예치서비스를 제공하는 주식회사 LG유플러스(이하 '회사'라 합니다)과 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.

제2조 (용어의 정의)
이 약관에서 정하는 용어의 정의는 다음과 같습니다.
① 전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 구성원과 직접 대면하거나 의사소통을 하지 아니하고 전산화된 방식으로 이를 이용하는 거래를 말합니다.
② '전자지급결제대행 서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
③ '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
④ '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자지급결제대행 서비스를 이용하는 자를 말합니다.
⑤ '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
⑥ '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를 지시하는 것을 말합니다.
⑦ '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.

제3조 (약관의 명시 및 변경)
① 회사는 이용자가 전자지급결제대행 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
② 회사는 이용자의 요청이 있는 경우 서면제공 방식 또는 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 지급결제정보 입력화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.

제4조 (전자지급결제대행서비스의 종류)
회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
① 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통한 신용카드 지불정보의 송,수신 및 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
② 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
③ 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
④ 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'KT전화(ARS,폰빌)결제대행서비스', '상품권결제대행서비스'등이 있습니다.

제5조 (결제대금예치서비스의 내용)
① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.
② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보 받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.

제6조 (접근매체의 선정, 관리 등)
① 회사는 전자지급결제대행 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.

제7조 (회사의 책임)
① 회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 없습니다.
② 회사가 접근매체의 발급주체이거나 사용, 관리주체인 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만, 이용자가 제6조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우에는 그러하지 아니합니다.
③ 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본조 제2항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외한다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다.
④ 회사는 이용자로부터의 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 정전, 화재, 통신장애 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서 이용자에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단 발행업체나 통신판매업자가 통지한 경우를 포함합니다)에는 이용자에 대하여 이로 인한 책임을 지지 아니합니다.
⑤ 회사는 본조 제4항의 경우 전자지급결제대행 서비스의 제공을 일시적으로 중단할 수 있습니다.

제8조 (거래내용의 확인)
① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 전자적양식, 모사전송, 서면 등의 방법으로 거래내용에 관한 서면을 교부합니다.
② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하되, 회사가 가맹점에 대한 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항은 제공하는 거래내용에서 제외됩니다.
③ 이용자가 본조 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다. 
- 주소: 서울특별시 중구 남대문로 5가 827번지 LG유플러스 타워 금융솔루션사업팀 
- 이메일 주소: ecredit@lguplus.co.kr 
- 전화번호: 1544-7772

제9조 (오류의 정정 등)
① 이용자는 전자지급결제대행 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.
③ 이용자는 다음의 주소 및 전화번호로 본 조항상의 정정 요구를 할 수 있습니다. 
- 주소: 서울특별시 중구 남대문로 5가 827번지 LG유플러스 타워 금융솔루션사업팀 
- 이메일 주소: ecredit@lguplus.co.kr 
- 전화번호: 1544 - 6640 

제10조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
① 회사는 이용자가 전자지급결제대행 서비스 이용거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.

제11조 (거래지시의 철회 제한)
① 이용자가 전자지급거래를 한 경우, 지급의 효력은 '전자금융거래법' 제13조 각호의 규정에 따릅니다.
② 이용자는 '전자금융거래법' 제13조 각호의 규정에 따라 지급의 효력이 발생하기전까지 거래지시를 철회할 수 있습니다. 단, 금융기관, 이동통신사 등의 규정에 의거 거래지시의 철회가 제한될 수 있습니다.
③ 전자지급수단별 거래지시의 철회 방법 및 제한 등은 다음 각호와 같습니다. 
가. 신용카드결제, 계좌이체결제, 가상계좌결제 : 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령에서 정한 바에 따라 재화의 구입 또는 용역의 이용 거래에서의 청약의 철회 등을 한 경우에 한하여 철회가 가능합니다. 
나. 휴대폰결제, KT전화(ARS,폰빌)결제: 전 가호의 방법에 따른 청약철회 요청건 중 이동통신사의 규정에 의거 결제일 해당월 말일까지 발생한 거래건에 한하여 철회가 가능합니다.
다. 상품권결제: 전 가호의 방법에 따른 청약철회 요청 건 중 시스템 장애 등으로 정상적인 서비스를 이용하지 못한 경우에 한하여 결제일로부터 10일 이내 청약 철회가 가능합니다.

제12조 (전자금융거래정보의 제공금지)
회사는 전자지급결제대행서비스 및 결제대금예치서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공,누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, '금융실명 거래 및 비밀 보장에 관한 법률' 제4조 제1항 단서의 규정에 따른 경우 그 밖의 다른 법률에서 정하는 바에 따른 경우에는 그러하지 아니합니다.

제13조 (분쟁처리 및 분쟁조정)
① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자지급결제대행 서비스 및 결제대금예치서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다. 
- 담당자: LG유플러스 금융솔루션사업팀 
- 연락처: 전화번호 02-2089-6757, 팩스 02-2089-0760 
- 이메일: jhpapa@lguplus.co.kr
 ② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
③ 이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제35조 제1항의 규정에 따른 소비자원에 회사의 전자지급결제대행서비스 및 결제대금예치서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.

제14조 (회사의 안정성 확보 의무)
회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융감독위원회가 정하는 기준을 준수합니다.

제15조 (이용시간)
① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 변경될 수 있습니다.
② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애보국, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시없이 서비스를 중단할 수 있습니다.

제16조 (약관외 준칙 및 관할)
① 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
② 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
</textarea>
	</h5>
	
	<table border="1" class="personal-Toggle-Two"  style="display: none;">
		<tr class="AllBordersTtr"> <td colspan="3" class="AllBordersTtr">※ 개인정보 수집 및 이용동의는 개인정보의 수집 및 이용목적, 수집항목 및 수집방법
				개인정보의 보유 및 이용기간으로 별도 구분하여 표시됩니다.</td>
		</tr >
		<tr class="AllBordersTtr">
			<td class="AllBordersTtr">개인정보의 수집 및 이용목적</td>
			<td class="AllBordersTtr">수집항목 및 수집방법</td>
			<td class="AllBordersTtr">개인정보의 보유 및 이용 기간</td>
		</tr>
		<tr class="AllBordersTtr">
			<td class="AllBordersTtr">1) 전자금융거래서비스 제공에 관한 결제 정보 등 개인정보 수집 - 이용자가 구매한 재화나 용역의 대금 결제
				- 결제 과정 중 본인 식별, 인증, 실명확인 및 이용자가 결제한 거래의 내역을 요청하는 경우 응대 및 확인 - 이용자가
				결제한 거래의 취소 또는 환불, 상품 배송 등 전자상거래 관련 서비스 제공 - 이용자가 결제한 대금의 청구 및 수납 -
				전자금융거래 및 통신과금 서비스 이용 불가능한 이용자(미성년자 등)와 불량, 불법 이용자의 부정 이용 방지 - 서비스 제공
				및 관련 업무 처리에 필요한 동의 또는 철회 등 의사확인 - 회사가 제공하는 소비자보호법 메일 발송 - 고객 불만 및
				민원처리 2) 신규 서비스 개발 및 마케팅 광고에의 활용 - 이용 빈도 파악 및 마케팅 특성에 따른 서비스 제공 및 CRM
				용도 - 신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인,
				이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계</td>
			<td class="AllBordersTtr">1) 수집항목 가. 전자금융거래서비스 이행과 관련 수집 정보 - 이용자의 고유식별번호 - 이용자의 신용카드
				정보 또는 지불하고자 하는 금융기관 계좌 정보 - 이용자의 휴대폰 또는 유선 전화 번호 및 가입 통신사 - 이용자의 상품권
				번호 및 상품권 회원 아이디, 비밀번호 등 - 이용자의 결제하고자 하는 포인트 카드 정보 - 이용자의 전자지갑 이용자번호
				등 결제 정보 - 이용자의 접속 IP - 이용자의 이메일 - 이용자의 상품 또는 용역 거래 정보 나. 회원가입과 관련한
				수집 정보 - 성명, 생년월일, 성별, 아이디, 비밀번호, 연락처(메일주소, 휴대폰 번호), 가입인증정보 - 만 14세
				미만은 법정대리인 정보, 가입인증정보 - 외국인의 경우 외국인등록번호 다. "서비스" 이용 또는 처리 과정에서 자동 혹은
				수동으로 생성되어 수집되는 정보 - 이용자 IP Address, 쿠키, 서비스 접속 일시, 서비스 이용기록, 불량 혹은
				비정상 이용기록, 결제기록 2) 수집방법 가. 회사가 운영하는 웹사이트 혹은 회사가 제공하는 결제창에 이용자가 직접 입력
				나. 회사가 제공하는 정보통신서비스의 이용 혹은 처리 과정에서 쿠키, 서비스 접속 log등이 자동으로 생성 및 수집되는
				경우</td>
			<td class="AllBordersTtr">이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기 합니다. 단,
				전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법령에 의하여 보존할 필요가 있는 경우 관련 법령에서
				정한 일정한 기간 동안 개인정보를 보존합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은
				아래와 같습니다. - 건당 1만원 초과 전자금융거래에 관한 기록 보존이유: 전자금융거래법 보존기간: 5년 - 건당 1만원
				이하 전자금융거래에 관한 기록 보존이유: 전자금융거래법 보존기간: 1년 - 계약 또는 청약 철회 등에 관한 기록 보존이유:
				전자상거래 등에서의 소비자보호에 관한 법률 보존기간: 5년 - 대금결제 및 재화 등의 공급에 관한 기록 보존이유:
				전자상거래 등에서의 소비자보호에 관한 법률 보존기간: 5년 - 소비자의 불만 또는 분쟁 처리에 관한 기록 보존이유:
				전자상거래 등에서의 소비자보호에 관한 법률 보존기간: 3년 - 본인확인에 관한 기록 보존이유: 정보통신 이용촉진 및
				정보보호 등에 관한 법률 보존기간: 6개월</td>
		</tr>
	</table>
	
		<table border="1" class="personal-Toggle-Three" style="display: none;">
		<tr class="AllBordersTtr"> <td colspan="4" class="AllBordersTtr">1. 회사는 이용자의 개인정보를 본 개인정보취급방침에서 고지한 범위 내에서 사용하며,<br> 
		이용자의 사전 동의 없이 동 범위를 초과하여 이용하거나 이용자의 개인 정보를 제3자에게 제공하지 않습니다.<br> 
		 다만, 관련 법령에 의하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관 등에 개인정보를 제공하여야 하는 경우는 예외로 합니다.<br> 
		  회사의 서비스 이행을 위하여 개인정보를 제3자에게 제공하고 있는 경우는 다음과 같습니다.</td>
		</tr>
		<tr class="AllBordersTtr">
			<td class="AllBordersTtr">제공목적</td>
			<td class="AllBordersTtr">제공받는 자</td>
			<td class="AllBordersTtr">제공 정보</td>
			<td class="AllBordersTtr">보유 및 이용기간</td>
		</tr>
		<tr class="AllBordersTtr">
			<td class="AllBordersTtr">신용카드 결제</td>
			<td class="AllBordersTtr">- 국민, 비씨, 롯데, 삼성, NH농협, 현대, 외환, 신한, 하나SK<br>
- 4개 시중은행:신한, SC제일, 씨티, 하나<br>
- 8개 특수은행 농협, 기업, 국민, 저축, 수협, 신협, 우체국, 새마을금고<br>
- 7개 지방은행 대구, 부산, 경남, 광주, 전북, 조흥, 제주<br>
- 1개 전업카드사:우리<br>
- 8개 VAN사:(주)코밴, KIS정보통신, NICE정보통신, 브이피㈜, 한국신용카드결제(주), 퍼스트데이터코리아, ㈜케이에스넷, 스타VAN </td>
			<td class="AllBordersTtr">거래정보 (비씨카드:IP포함)</td>
			<td class="AllBordersTtr">건당 1만원 초과 : 5년 건당 1만원 이하 : 1년</td>
		</tr>
	</table>
	<input type="checkbox" class="ccheckk"> 본인은 위의 내용을 모두 읽어보았으며 이에 전체 동의합니다.
	<br>
	<center>
	<input type="button" name="no" value="쇼핑 계속하기" onclick="nono()"  class="button-three-gogo"> &nbsp; &nbsp; &nbsp; &nbsp; 
	<input type="button" name="yes" value="구매하기" onclick="yesyes('${totalprice}','${di_nums}')"  class="button-three-gogo"></center>
	<br>
	<br>

	<h4>
		- 꼭 확인해주세요! BC카드 무이자할부 우리비자, 광주, 전북, 수협, 저축은행, 우체국, 새마을금고, 산업, 제주, 신협,
		현대증권카드는 제외됩니다.<br> - “상품권 및 현금성 상품” 에 대하여 카드 할인혜택이 제외 될 수 있습니다<br>
		- 이벤트 종료일 23시 59분 59초까지 결제 요청된 경우에 할인이 적용됩니다.(서버시간은 컴퓨터마다 상이하니, 10분
		전까지 결제완료 부탁드립니다.
	</h4>
	</c:otherwise>
</c:choose>
</body>
<script type="text/javascript">
	var i ="${totalprice}";
	var p = parseInt("${mem.m_point}");
	document.getElementById("p_pricee").innerHTML = p+"원"; 
	var ii = 0;
	if("${mem.m_grade}" == "1"){
		ii = ${totalprice * 0.05}
		i = i - ii;
	}else if("${mem.m_grade}" == "2"){
		ii = ${totalprice * 0.04}
		i = i - ii;s
	}else if("${mem.m_grade}" == "3"){
		ii = ${totalprice * 0.03}
		i = i - ii;
	}else if("${mem.m_grade}" == "4"){
		ii = ${totalprice * 0.02}
		i = i - ii;
	}else if("${mem.m_grade}" == "5"){
		ii = ${totalprice * 0.01}
		i = i - ii;
	}
		var iii = parseInt(i)+2500;
		 document.getElementById("ii_price").innerHTML = ii; 
		 document.getElementById("iii_price").innerHTML = iii+"원"; 
	 	document.getElementById("iii_pricee").innerHTML = iii+"원"; 
	
	function nono() {
		location.href = "/aaa/";
	}

	function yesyes(totalprice,di_nums) {
		var plusmm = document.getElementById("plusMoney").value;
		
		if(plusmm == ""){
			plusmm = 0;			
		}
		
		var totalpriceChange = totalprice - parseInt(plusmm);
		
		var salePoint = parseInt(ii) + parseInt(plusmm);
		 
		if(document.getElementById("plusMoney").value > p){
	 		alert("쓰실수 있는 적립금 가격을 초과하셨습니다");	
	 	}else{
	 		var toPoint = p - parseInt(plusmm);
		

		var cbank =document.getElementById("cbank").value;
		var cardCbank =document.getElementById("cardCbank").value;
		ack = document.getElementsByClassName("ccheckk");
		if(ack[0].checked && ack[1].checked && ack[2].checked){
		var pluspage = "?totalprice="+totalprice+"&cbank="+cbank+"&cardCbank="+cardCbank+"&discountpoint="+salePoint+"&point="+toPoint+"&di_nums="+di_nums;
		obj = document.getElementsByName('ex1');
		if(obj[0].checked){
			window.open("/aaa/mem/cartCardPopup"+pluspage,"","width=500, height=400,left=550 ,top=180");
 		}else if(obj[1].checked){
 			window.open("/aaa/mem/cartPhonePopup"+pluspage,"","width=500, height=400,left=550 ,top=180");
 		}else if(obj[2].checked){
 			window.open("/aaa/mem/cartAccountPopup"+pluspage,"","width=500, height=400,left=550 ,top=180");
 		}else if(obj[3].checked){
 			location.href ="/aaa/mem/cartBuySecess"+pluspage;
 		}
		
	 }else if(ack[0].checked == false){
		 alert("개인정보 제3자 제공에 동의를 체크해 주십시오");
	 }else if(ack[1].checked == false){
		 alert("주의 사항에 동의를체크해 주십시오");
	 }else if(ack[2].checked == false){
		 alert("결제대행서비스 이용약관 동의를 체크해 주십시오");
	 }
	 	}
		
// 		location.href = "/aaa/mem/BuySecess?totalprice="+totalprice+"&cbank="+cbank+"&cardCbank="+cardCbank;
	}

	$(".toggleone").click(
			function() {
				
		$(".oneTable").show();
		$(".twoTable").hide();
		$(".threeTable").hide();
		$(".fourTable").hide();
		$(".toggleSo").hide();
		$(".toggleGy").hide();

	});

	$(".toggletwo").click(function() {
		$(".oneTable").hide();
		$(".twoTable").show();
		$(".threeTable").hide();
		$(".fourTable").hide();
		$(".toggleSo").hide();
		$(".toggleGy").hide();
	});

	$(".togglethree").click(function() {
		$(".oneTable").hide();
		$(".twoTable").hide();
		$(".threeTable").show();
		$(".fourTable").hide();
		$(".toggleSo").show();
		$(".toggleGy").hide();
	});

	$(".toggleFour").click(function() {
		$(".oneTable").hide();
		$(".twoTable").hide();
		$(".threeTable").hide();
		$(".fourTable").show();
		$(".toggleSo").show();
		$(".toggleGy").hide();
	});

	$(".soToggle").click(function() {
		$(".toggleSo").show();
		$(".toggleGy").hide();

	});
	$(".gyToggle").click(function() {
		$(".toggleSo").hide();
		$(".toggleGy").show();

	});
	
	$(".miToggle").click(function() {
		$(".toggleSo").hide();
		$(".toggleGy").hide();

	});
	$(".offerToggle").click(function() {
		$(".toggleOffer").show();
		$("#toggleMatters").hide();
	});
	$(".mattersToggle").click(function() {
		$(".toggleOffer").hide();
		$("#toggleMatters").show();

	});
	
	$(".personalOne").click(function() {
		$(".personal-Toggle-One").show();
		$(".personal-Toggle-Two").hide();
		$(".personal-Toggle-Three").hide();

	});
	
	$(".personalTwo").click(function() {
		$(".personal-Toggle-One").hide();
		$(".personal-Toggle-Two").show();
		$(".personal-Toggle-Three").hide();

	});
	
	$(".personalThree").click(function() {
		$(".personal-Toggle-One").hide();
		$(".personal-Toggle-Two").hide();
		$(".personal-Toggle-Three").show();

	});
	
		
</script>
</html>

