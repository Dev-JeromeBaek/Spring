<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th, td {
     padding: 15px;
    text-align: left;
}
</style>
</head>
<body style="text-align: center;">

	<h1>주문이 정상적으로 접수되었습니다</h1>
	<table border="1" style="text-align: center;">
		<tr>
			<td>입금하실 금액</td>
			<td >
				${totalprice}원
			</td>
		<tr>
			<td>입금은행</td>
			<td>
			 	   ${cbank}은행<br>
			</td>
		</tr>
		<tr>
			<td>입금계좌</td>
			<td>69370-11-634919(예금주:티켓몬스터)</td>
		</tr>
	</table>
	<table border="1" style="text-align: center;">
		<tr>
			<td rowspan="3">주문번호<br> 16838</td>
			<td>총 결제금액  : ${totalprice}원
			</td>
		</tr>
		<tr>
			<td>무통장입금  : ${totalprice}원
			</td>
		</tr>
		<tr>
			<td>티몬캐쉬 적립금 사용 : 0원
			</td>
		</tr>
	</table>
	· 자세한 구매내역 확인 및 문자발송, 배송지 변경 등의 서비스는 사이트 우측 상단의 마이페이지>구매내역에서 이용 가능합니다.<br>

	· 입금하실 해당 은행을 확인하시고 입금해 주세요. 입금 확인되면 주문이 정상적으로 처리됩니다. <br>
	· 카드사 포인트 사용 내역은 카드사 페이지에서 확인 가능합니다.<br>
	

	<input type="button" value="쇼핑 계속하기" onclick="mainPage()">

</body>
<script type="text/javascript">
function mainPage() {
	alert("메인페이지로 돌아갑니다");
	location.href="/aaa/";
}
</script>
</html>

