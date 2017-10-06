<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.pphoneBuootoon {
	background-color: black;
	transition: background-color .4s ease-out;
	border-radius: 5px;
	border: 3px solid transparent;
	cursor: pointer;
	padding: 1rem 6.5rem;
	font-size: 15px;
	font-family: inherit;
	color: #fff;
}

.pphoneBuootoon:focus {
	outline: none;
	border-color: red; 
}

.pphoneBuootoon:hover, .payment-card__button:focus {
	background-color: gray;
	font: black;
}
</style>
</head>
<body style="text-align: center;">
<c:choose>
<c:when test="${mnum == null}">
<script type="text/javascript">
	alert("로그인을 해주십시오");
	window.opener.location.href="/aaa/mem/loginForm";
	self.close();
</script>
</c:when>
<c:otherwise>

<h1>휴대폰 간소화 결제 이용약관 동의</h1>
<textarea rows="20" cols="65" style="text-align: center; font-size: 15px;" >
휴대폰 간소화결제 서비스 이용 안내 

 휴대폰 간소화결제 서비스란 본 휴대폰 간소화결제 서비스 이용 안내에 동의한 후 휴대폰 결제 PG사가 제공하는 결제창에 최초 1회 결제정보를 등록하여 결제가 된 이후에는 
 결제정보 입력 없이 인증만으로 간편하게 계속적으로 결제를 할 수 있는 서비스입니다. 

• 등록방법 : 휴대폰 간소화결제 서비스 이용 안내에 대한 동의 버튼을 클릭하면 결제창이 바로 노출되며, 
해당 결제창에 이동통신사, 휴대폰 번호 등 결제정보를 입력하여 최초 1회 결제가 이루어지면 등록이 완료됩니다. 
• 대상 결제대행사 : ㈜다날, 갤럭시아커뮤니케이션즈㈜, 에스케이플래닛㈜, ㈜케이지모빌리언스 
 휴대폰 간소화결제 서비스를 신청하여 정보가 등록된 후에는 최초 입력한 대상 결제대행사 외 
 제휴 PG사의 결제창에서도 자동으로 정보가 노출됩니다.(휴대폰 결제 선택한 경우에 한함) 
• 결제정보입력(인증)방식 : 휴대폰 SMS 인증 방식 
• 개인정보수집 및 이용 관련 사항 : 개인정보의 수집 및 이용의 주체는 ㈜티켓몬스터가 아닌 대상 결제대행사이며,
 대상 결제대행사의 이용약관 및 개인정보 수집 및 이용 동의에 따라 처리됩니다. 
• 결제정보 변경방법 : 서비스 등록이 된 휴대폰 번호 및 통신사를 변경하고자 하는 경우에는 결제창에서 변경하고자 하는 정보를 입력한 후 재인증하여야 하며, 
인증 후에는 새로운 결제정보를 저장하셔야 이후에도 변경된 정보로 휴대폰 간소화결제 서비스를 이용하실 수 있습니다. 
• 해지방법 : 당사 홈페이지 내 마이페이지를 통해 서비스 해지요청을 하실 수 있습니다. 

휴대폰 간소화결제 서비스 이용을 원하시는 경우 아래 동의 버튼을 클릭해주시기 바랍니다. 동의 이후 입력한 휴대폰 정보는 자동 등록되며, 
이후 휴대폰 결제방식 선택 시 인증번호 입력만으로 결제가 이루어집니다. 

</textarea> &nbsp; <br><br>
<br>
<input type="button" value="취소" onclick="successno" class="pphoneBuootoon"> 
<input type="button" value="확인" class="pphoneBuootoon" 
			onclick="success('${totalprice}','${mnum}','${infonum}','${coco}','${discountpoint}','${point}')"> 
</c:otherwise></c:choose>
</body>
<script type="text/javascript">
function success(totalprice,mnum,infonum,coco,discountpoint,point) {
	location.href=
		"/aaa/mem/directPhonePopupTwo?totalprice="+totalprice+"&mnum="+mnum+"&infonum="+infonum+"&coco="+coco+"&discountpoint="+discountpoint+"&point="+point;
}

function successno() {
	self.close();
}
</script>
</html>

