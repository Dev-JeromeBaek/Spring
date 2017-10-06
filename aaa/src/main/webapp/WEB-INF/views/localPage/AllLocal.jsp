<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	/* Demo purposes only */
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>
</head>
<body style="text-align: center;">
<!-- <form name="frm"> -->
	
	<table>
	<tr><td>			
			${info.di_name}</td></tr>
			<tr><td>${info.di_exp}</td></tr>
			<tr><td>${info.di_price}</td></tr>
			 <c:forEach var="i" items="${info.di_sysName.split(',')}">
			<tr><td><img src="/aaa/resources/files/${i}" alt="sq-sample4"/></td></tr>
		</c:forEach> 
		
		</table>
<%--  <c:choose>
<%-- 	<c:when test="${info != null}"> --%> 
 		<table>
 		<c:forEach var="i" items="${detail}"> 
		
		<script type="text/javascript">
		</script> 
		<tr> 
		<td>상품 ${i.dd_name}</td></tr> 
 		<tr><td>가격{i.dd_price}</td></tr> 
 		<tr><td>종류${i.dd_kind}</td></tr>
		<tr><td>수량${i.dd_amount}</td></tr> 
 		</c:forEach>

	<select>
 		<c:forEach var="i" items="${detail}">
 		<option>${i.dd_price}</option>
	</c:forEach> 
	</select>
	
	
	
	<tr><td>상품선택</td><td>
	<select>
 		<c:forEach var="i" items="${detail}">
 		<option>${i.dd_name}</option>
	</c:forEach> 
	</td></tr>
	
 		</select>
 		</table>
 		<script type="text/javascript">
 		</script>
			<input type="button" value="구매하기" onclick="buyBotton('${info.di_num}','${detail.dd_price}')">
			
<!-- 			</form> -->
<%-- 	</c:when>
	<c:otherwise>
		등록된 상품이 없습니다 <br>
		등록후 이용해주십시오
	</c:otherwise>
</c:choose> 
	 --%>
	
</body>
<script type="text/javascript">
var mnum=1;
//  function buyBotton(num,price) {
// 	alert(price);
// 	alert("구매버튼");
// 	location.href="/aaa/mem/buyPage?num="+num+"&mnum="+mnum+"&price="+price;
// 	alert(num);alert(mnum);
	 
// } 
 var mnum=1;
 function buyBotton(num,price) {
	location.href="/aaa/mem/buyPage?num="+num+"&mnum="+mnum+"&price="+price;
	 
} 
// function frmSubmit() {
// 	var frm = document.frm;
// // 	frm.cnt.value = b-1;
// 	location.href="/aaa/mem/buyPage";
// 	frm.submit();
// }
</script>
</html>

