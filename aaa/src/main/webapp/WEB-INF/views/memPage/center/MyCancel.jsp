<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.bbb {
	background: #3fa46a;
	color: black;
	font-size: 30px;
	text-decoration: none;
	padding: 20px 0;
	margin: 0 20px;
}



</style>

<!-- <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap.no-icons.min.css" rel="stylesheet"> -->
</head>
<body>
	<c:choose>
		<c:when test="${mnum == null}">
			<script type="text/javascript">
				alert("로그인을 해주십시오");
				location.href = "/aaa/mem/loginForm";
			</script>
		</c:when>
		<c:otherwise>
			<nav id="nav-1">
				<a class="link-1" href="/aaa/mem/Myshipping">구매내역</a> <a class="bbb">취소/환불/교환</a>
				<a class="link-1" href="/aaa/mem/MyPoint">적립금</a> <a class="link-1"
					href="/aaa/cart/memCart">장바구니</a> <a class="link-1" href="/aaa/mem/memQnaList">문의/답변</a>
				<a class="link-1" href="/aaa/mem/memInfo">개인정보</a>
			</nav>


			<span class="counter pull-right"></span>

			<section class="con">

				<h2>
					<font color="red" size="20">취소/환불 페이지</font>
				</h2>

				<input type="search" class="light-table-filter"
					data-table="order-table" placeholder="Filtrer" />

				<table class="w3-table-all">
   							 <thead>
      				<tr class="w3-red">
							<th>날짜</th>
							<th>내역</th>
							<th>환불가격</th>
							<th>상태</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="each" items="${buyList}">
							<tr>
								<td>${each.b_date_string}</td>
								<td>${each.b_di_name}
								</td>
								<td><input type="text" readonly="readonly" value="${each.b_price}"
									class="pricetotoal" ></td>
							
								<c:choose>
								
									<c:when test="${each.b_status == 'REFUND'}">
										<td>환불완료</td>
									</c:when>
									
									<c:when test="${each.b_status == 'CANCEL'}">
										<td>취소완료</td>
									</c:when>
									
									<c:when test="${each.b_status == 'EXCHANGE'}">
										<td>교환완료</td>
									</c:when>
									
									<c:when test="${each.b_status == 'HANDLING'}">
										<td>처리중</td>
									</c:when>
									
									
								</c:choose>

							</tr>
							<input type="hidden" value="${each.b_discount}" class="discountValue">
						</c:forEach>
					</tbody>
					
				</table>

			</section>
		</c:otherwise>
	</c:choose>
</body>
<script type="text/javascript">

	var pricepp = document.getElementsByClassName("pricetotoal");
	var discountpp = document.getElementsByClassName("discountValue");
	for(var i =0;i<pricepp.length ;i++){
		pricepp.item(i).value = parseInt(pricepp.item(i).value) + 2500 + parseInt(discountpp.item(i).value);
		discountpp.item(i).innerHTML = pricepp.item(i).value;
		
	}
	
	(function(document) {
		'use strict';

		var LightTableFilter = (function(Arr) {

			var _input;

			function _onInputEvent(e) {
				_input = e.target;
				var tables = document.getElementsByClassName(_input
						.getAttribute('data-table'));
				Arr.forEach.call(tables, function(table) {
					Arr.forEach.call(table.tBodies, function(tbody) {
						Arr.forEach.call(tbody.rows, _filter);
					});
				});
			}

			function _filter(row) {
				var text = row.textContent.toLowerCase(), val = _input.value
						.toLowerCase();
				row.style.display = text.indexOf(val) === -1 ? 'none'
						: 'table-row';
			}

			return {
				init : function() {
					var inputs = document
							.getElementsByClassName('light-table-filter');
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

