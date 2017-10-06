<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.eee {
background: #3fa46a;
  color: black;
  font-size: 30px;
  text-decoration: none;
  padding: 20px 0;
  margin: 0 20px;
}

<%-- -------------------------------- 구 분 선 --%>
h2 {
  margin-bottom: 30px;
}

.container {
  text-align: center;
  overflow: hidden;
  width: 800px;
  margin: 0 auto;
}

.container table {
  width: 100%;
}

.container td, .container th {
  padding: 30px;
}

.container td:first-child, .container th:first-child {
  padding-left: 30px;
}

.container td:last-child, .container th:last-child {
  padding-right: 30px;
}

.container th {
  border-bottom: 1px solid #ddd;
  position: relative;
}



</style>
</head>
<body>

<nav id="nav-1">
  <a class="link-1" href="/aaa/mem/aa">구매내역</a>
  <a class="link-1" href="/aaa/mem/bb">취소/환불/교환</a>
     <a class="link-1" href="/aaa/mem/cc">적립금</a>
  <a class="link-1" href="/aaa/mem/dd">장바구니</a>
  <a class="eee">문의/답변</a>
   <a class="link-1" href="/aaa/mem/ff">개인정보</a>
</nav>
<span class="counter pull-right"></span>

<section class="container">
	<h1><font color="red">취소/환불 페이지</font></h1>


	<input type="search" class="light-table-filter" data-table="order-table" placeholder="Filtrer" />

	<table class="order-table">
		<thead>
			<tr>
				<th>상품명</th>
				<th>문의명</th>
				<th>등록일</th>
				<th>답변여부</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>소시지세트</td>
				<td>소시지가 노맛입네다</td>
				<td>2017.3.9</td>
				<td>처리중</td>
			</tr>
			
			<tr>
				<td>생생귤</td>
				<td>귤이 안생생함</td>
				<td>2017.2.10</td>
				<td>답변완료</td>
			</tr>
		
		</tbody>
	</table>

</section>


<hr><hr><hr>
<h3> ·실시간 항공권 1:1 문의 내용에 대한 답변은 항공권 예약 페이지 내 ‘온라인 처리 내역’에서 확인하실 수 있습니다.</h3>
<h3> ·구매내역 페이지에서 문의하신 항공권을 선택하시고 예약 상세 페이지에서 문의 내역을 확인하세요.</h3>

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
</script>
</html>
