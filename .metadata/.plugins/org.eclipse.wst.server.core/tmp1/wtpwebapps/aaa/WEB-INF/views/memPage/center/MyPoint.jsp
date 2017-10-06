<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Raleway);
nav {
  margin-top: 40px;
  padding: 24px;
  text-align: center;
  font-family: Raleway;
  box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
}
#nav-1 {
  background: #3fa46a;
}
.link-1 {
  transition: 0.3s ease;
  background: #3fa46a;
  color: #ffffff;
  font-size: 20px;
  text-decoration: none;
  border-top: 4px solid #3fa46a;
  border-bottom: 4px solid #3fa46a;
  padding: 20px 0;
  margin: 0 20px;
}
.link-1:hover {
  border-top: 4px solid #ffffff;
  border-bottom: 4px solid #ffffff;
  padding: 6px 0; 
}
.ccc {
background: #3fa46a;
  color: black;
  font-size: 30px;
  text-decoration: none;
  padding: 20px 0;
  margin: 0 20px;
}



/* .container { */
/*   text-align: center; */
/*   overflow: hidden; */
/*   width: 800px; */
/*   margin: 0 auto; */
/* } */

/* .containereer table { */
/*   width: 100%; */
/* } */

/* .containereer td, .containereer th { */
/*   padding: 15px; */
/* } */

/* .container td:first-child, .container th:first-child { */
/*   padding-left: 20px; */
/* } */

/* .container td:last-child, .container th:last-child { */
/*   padding-right: 20px; */
/* } */

/* .container th { */
/*   border-bottom: 1px solid #ddd; */
/*   position: relative; */
  
/* } */

</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-92" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/MyPoint.jsp">
<c:choose>
<c:when test="${mnum == null}">
<script type="text/javascript">
	alert("로그인을 해주십시오");
	location.href="/aaa/mem/loginForm";
</script>
</c:when>
<c:otherwise>
<nav id="nav-1">
  <a class="link-1" href="/aaa/mem/Myshipping">구매내역</a>
  <a class="link-1" href="/aaa/mem/MyCancel">취소/환불/교환</a>
     <a class="ccc">적립금</a>
  <a class="link-1" href="/aaa/cart/memCart">장바구니</a>
  <a class="link-1" href="/aaa/mem/memQnaList">문의/답변</a>
   <a class="link-1" href="/aaa/mem/memInfo">개인정보</a>
</nav>



<span class="counter pull-right"></span>

<section class="container">

	<h2><font color="red">적립금 페이지</font></h2>

	<input type="search" class="light-table-filter" data-table="order-table" placeholder="Filtrer" />
<br><br>
<table border="1" style="text-align: center;">
<tr><td>사용가능 금액</td><td>보유금액</td></tr>
<tr><td><font color="red">${mem.m_point}</font>&nbsp;POINT</td>
<td><font color="red">${mem.m_point}</font>&nbsp;POINT</td></tr>
</table><br><br><br>
	<table class="w3-table-all">
    <thead>
      <tr class="w3-red">
				<th>날짜</th>
				<th>내역</th>
				<th>가격</th>
				<th>내가쓴 포인트</th>
				<th>쌓인 포인트</th>
				<th>총 포인트</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="each" items="${buyList}" >
		<tr>
				<td>${each.b_date_string}</td>
				<td>${each.b_di_name}</td>
				<td ><input type="text" class="b_pcPlus" value="${each.b_price}" readonly="readonly"></td>
				<td><input type="text" class="b_dcPlus" name="b_dcPluss" value="${each.b_discount}"readonly="readonly"></td>
				<td ><input type="text" class="b_psPlus" value="${each.b_discount}"readonly="readonly"></td>
				<td><input type="text"  class="b_point" value="${mem.m_point}"readonly="readonly"></td>
			</tr>
		
		
		</c:forEach>
			
		</tbody>
	</table>

</section>
</c:otherwise>
</c:choose>
</body>
<script type="text/javascript">

		
 	var pcplus = document.getElementsByClassName("b_pcPlus");//가격
 	
	var dcplus = document.getElementsByClassName("b_dcPlus");//내가쓴 포인트

 	var psplus = document.getElementsByClassName("b_psPlus");//쌓인 포인트
 	
 	var pppoint = document.getElementsByClassName("b_point");//총 포인트

 	var b_dcPluss = document.getElementsByName("b_dcPluss");
//  	alert("가격");//가격
	for(var i =0; i<pcplus.length;i++){
		pcplus.item(i).value = pcplus.item(i).value - dcplus.item(i).value + 2500;
// 		alert("후  가격: " +pcplus.item(i).value);
		pcplus.item(i).innerHTML = pcplus.item(i).value;
 	}
 	
	var memgrade = ${mem.m_grade};
//  	alert("내가쓴 포인트");
 	for(var i =0;i<dcplus.length;i++){
 		if(pcplus.item(i).value == 0){
// 	 	
 		}else{
 			var b_pcPlus = parseInt(pcplus.item(i).value) + parseInt(dcplus.item(i).value) - 2500;
//  			var ii =  b_pcPlus * 0.05;
 		 	if(parseInt(memgrade) == 1){
 		 		dcplus.item(i).value = dcplus.item(i).value - (b_pcPlus * 0.05);
 		 	}else if(parseInt(memgrade) == 2){
 		 		dcplus.item(i).value = dcplus.item(i).value - (b_pcPlus * 0.04);
 		 	}else if(parseInt(memgrade) == 3){
 		 		dcplus.item(i).value = dcplus.item(i).value - (b_pcPlus * 0.03);
 		 	}else if(parseInt(memgrade) == 4){
 		 		dcplus.item(i).value = dcplus.item(i).value - (b_pcPlus * 0.02);
 		 	}else if(parseInt(memgrade) == 5){
 		 		dcplus.item(i).value = dcplus.item(i).value - (b_pcPlus * 0.01);
 		 	}else if(parseInt(memgrade) == 6){
 		 		dcplus.item(i).value = dcplus.item(i).value - (b_pcPlus * 0.00);
 		 	}
 		}
	 		dcplus.item(i).innerHTML = dcplus.item(i).value;
	}
	
	for(var i =0;i<psplus.length;i++){//쌓인 포인트
		var bbbbb = parseInt(pcplus.item(i).value) - parseInt(dcplus.item(i).value) + 2500
	 	if(parseInt(memgrade) == 1){
// 	 		alert("if문 돌음");
	 		psplus.item(i).value = parseInt(parseInt(bbbbb) * 0.005);
	 	}else if(parseInt(memgrade) == 2){
	 		psplus.item(i).value = parseInt(parseInt(pcplus.item(i).value) * 0.004);
	 	}else if(parseInt(memgrade) == 3){
	 		psplus.item(i).value = parseInt(parseInt(pcplus.item(i).value) * 0.003);
	 	}else if(parseInt(memgrade) == 4){
	 		psplus.item(i).value = parseInt(parseInt(pcplus.item(i).value) * 0.002);
	 	}else if(parseInt(memgrade) == 5){
	 		psplus.item(i).value = parseInt(parseInt(pcplus.item(i).value) * 0.001);
	 	}else if(parseInt(memgrade) == 6){
	 		psplus.item(i).value = 0;
	 	}
// 		alert("내가 쌓인 포인트"+i+" : "+psplus.item(i).value);
	 	psplus.item(i).innerHTML = psplus.item(i).value;
	}
	
// 	alert("ㄱ가가ㅏ");
	for(var i =0;i<pppoint.length;i++){//총,사용,누적
		pppoint.item(i+1).value = parseInt(pppoint.item(i).value) + (parseInt(dcplus.item(i).value) - parseInt(psplus.item(i).value));
		
// 		alert("for문안 : "+dcplus.item(i).value);
		
		pppoint.item(i).innerHTML = pppoint.item(i).value;
	}
(function(document) {
	'use strict';

	var LightTableFilter = (function(Arr) {

		var _input;

		function _onInputEvent(e) {
			_input = e.target;
			var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
			Arr.forEach.call(tables, function(table) {
				Arr.forEach.call(table.tBodies, function(tbody) {
					Arr.forEach.call(tbody.rows, _filter);
				});
			});
		}

		function _filter(row) {
			var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
			row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
		}

		return {
			init: function() {
				var inputs = document.getElementsByClassName('light-table-filter');
				Arr.forEach.call(inputs, function(input) {
					input.oninput = _onInputEvent;
				});
			}
		};
	})(Array.prototype);

	document.addEventListener('readystatechange', function() {
		if (document.readyState === 'complete') {
			LightTableFilter.init();
		}
	});

})(document);
</script>
</html>

