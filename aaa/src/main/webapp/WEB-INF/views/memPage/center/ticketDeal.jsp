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
.aaa {
background: #3fa46a;
  color: black;
  font-size: 30px;
  text-decoration: none;
  padding: 20px 0;
  margin: 0 20px;
}

/* "con" 애들부터 */
body{
  font-size:25px;
}

.aa1{
	background-color: red;
	color: white;
}
.con{
 width:1200px;
  margin:auto;
}
nav ul li{
  list-style:none;
  float:left;
  padding-right:30px;
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
} 

.h2{
	text-align: center;
}
tr:first-child th:last-child { 
  border-radius: 0 8px 0 0; 
}
.ho{
	background-color: orange;
}
</style>

</head>

<body>

<nav id="nav-1">
  <a class="aaa">구매내역</a>
  <a class="link-1" href="/aaa/mem/memAs">취소/환불/교환</a>
    <a class="link-1" href="/aaa/mem/memPoint">적립금</a>
  <a class="link-1" href="#">장바구니</a>
  <a class="link-1" href="/aaa/mem/memQnaList">문의/답변</a>
   <a class="link-1" href="/aaa/mem/memInfo">개인정보</a>
</nav>

  <div class="con">
      <nav class="navecation">
       <ul id="navi">
    <li><a class="menu" href="/aaa/mem/memMyPage">배송상품</a></li>
       <li><a class="aa1">티켓상품</a></li>
    <li><a class="menu" href="/aaa/mem/reviewDeal">후기상품</a></li>          
  </ul>
    </nav>
  </div>
<span class="counter pull-right"></span>

<section class="container">

	<h2><font color="red">티켓상품</font></h2>

	<input type="search" class="light-table-filter" data-table="order-table" placeholder="Filtrer" />

	<table class="order-table">
		<thead>
			<tr>
				<th>구매내역 </th>
				<th>유효기간</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<td>오페라</td>
				<td>2017.1.8</td>
				<td><a href="#">후기쓰러가기</a></td>
			</tr>
			<tr>
				<td>미술관</td>
				<td>2017.10.8</td>
				<td><a href="#">후기쓰러가기</a></td>
			</tr>
			<tr>
				<td>란란루</td>
				<td>2018.3.16</td>
				<td><a href="#">후기쓰러가기</a></td>
			</tr>
		</tbody>
	</table>

</section>

</body><script type="text/javascript">
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

