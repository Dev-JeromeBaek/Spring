<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Raleway);

body {
	margin: 0px;
}

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

.aaa {
	background: #3fa46a;
	color: black;
	font-size: 30px;
	text-decoration: none;
	padding: 20px 0;
	margin: 0 20px;
}

/* "con" 애들부터 */
body {
	font-size: 25px;
}

.aa1 {
	background-color: red;
	color: white;
}

.con {
	width: 1200px;
	margin: auto;
}

nav ul li {
	list-style: none;
	float: left;
	padding-right: 30px;
}

nav ul li a {
	text-decoration: none;
	color: white;
	background-color: black;
	padding: 4px 5px;
}


table { 
  color: #333;
  font-family: Helvetica, Arial, sans-serif;
  width: 1000px;
  border-collapse: collapse; border-spacing: 0; 
  margin: auto;
}
		
td { background: #FAFAFA; text-align: center; }

tr:nth-child(even) td { background: #EEE; } 
tr:nth-child(odd) td { background: #FDFDFD; }

tr:first-child th:nth-child(2) { 
  border-radius: 8px 0 0 0; 
  text-align: center;
} 

.h2{
	text-align: center;
}
tr:first-child th:last-child { 
  border-radius: 0 8px 0 0; 
}

</style>

</head>

<body>
<c:choose>
<c:when test="${mnum == null}">
<script type="text/javascript">
	alert("로그인을 해주십시오");
	location.href="/aaa/mem/loginForm";
</script>
</c:when>
<c:otherwise>
	<nav id="nav-1">
		<a class="aaa">구매내역</a> <a class="link-1" href="/aaa/mem/MyCancel">취소/환불/교환</a>
		<a class="link-1" href="/aaa/mem/MyPoint">적립금</a> <a class="link-1"
			href="/aaa/cart/memCart">장바구니</a> <a class="link-1" href="/aaa/mem/memQnaList">문의/답변</a>
		<a class="link-1" href="/aaa/mem/memInfo">개인정보</a>
	</nav>

	<div class="con">
		<nav class="navecation">
			<ul id="navi">
				<li><a class="aa1">배송상품</a></li>
				<li><a class="menu" href="/aaa/mem/MyTicket">티켓상품</a></li>
				<li><a class="menu" href="/aaa/mem/MyAll">전체상품</a></li>
			</ul>
		</nav>
	</div><hr>


<span class="counter pull-right"></span>

<section class="container">

	<h2><font color="red">배송상품</font></h2>

	<input type="search" class="light-table-filter" data-table="order-table" placeholder="Filtrer" />

	<table class="order-table">
		<thead>
			<tr>
			<td>상품명</td>
			<td>가격</td>
			<td>상태</td>
			<td>구입날짜</td>
			<td>후기쓰러가기</td>
		</tr>
		</thead>
		<tbody>
			<c:choose>
			<c:when test="${listc == null}">
			<tr><td colspan="4">구매내역없음</td></tr>
			</c:when>
			<c:otherwise>
		<c:forEach var="each" items="${listc}">
		<tr>
			<td>${each.b_di_name}</td>
			<td>${each.b_price}</td>

			<c:choose>

			<c:when test="${each.b_status == 'WAIT'}">
			<td>결제승인대기</td>
			</c:when>
			
			<c:when test="${each.b_status == 'YES'}">
			<td>구매완료</td>
			</c:when>
			
			<c:when test="${each.b_status == 'NO'}">
			<td>구매취소</td>
			</c:when>
			
			<c:when test="${each.b_status == 'ING'}">
			<td>배송중</td>
			</c:when>
			
			</c:choose>
			<td>${each.b_date_string}</td>
			<td><input type="button" value="후기버튼" onclick="reviewPop('${each.b_di_num}')"></td>
		</tr>
		</c:forEach>
		</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</section>
	<img alt="엑박" src="/aaa/resources/img/배송상태.png">
	<br>
	<h6>· 배송지 수정 및 구매취소는 주문하신 배송상품이 '결제완료' 상태일 때만 가능합니다.</h6>

	<h6>· 환불/교환 요청은 '배송완료 다음날부터 7일'까지 가능합니다. (환불은 '배송준비중', 교환은 '배송완료'
		상태일 때 부터 요청가능)</h6>

	<h6>· 환불/교환 요청 후 1~3일 내에 현대택배에서 상품을 수거하게 되니 잠시 기다려 주세요.</h6>

</c:otherwise>
</c:choose>
</body>
<script type="text/javascript">
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
	
	function reviewPop(dnum) {
		var m_num = "${memLogin.m_num}";
		var url = "/aaa/review/reviewPop?m_num="+m_num+"&di_num="+dnum;
		
		var popname = "상품구매후기";
		var size = "width=450px, height=710px";
		window.open(url, popname, size);
	}

</script>
</html>

