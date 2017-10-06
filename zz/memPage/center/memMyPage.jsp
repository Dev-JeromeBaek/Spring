<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="content">
			<a href="#footer" class="accessibility">하단 바로가기</a>
			<script src="/static/js/jquery.number_format.js?v=2011111915"
				type="text/javascript"></script>
			<script src="/static/js/jquery.popupWindow.js" type="text/javascript"></script>
			<script src="/static/js/jquery.placeholder.js" type="text/javascript"></script>
			<div class="mypage_header">
				<h2 class="blind">마이페이지</h2>
				<p class="user_welcome">
					<strong>백승엽</strong>님의 티몬멤버십 등급은 <em class="gold">SILVER</em>입니다. <a
						href="/user/memberShip" class="btn">혜택보기</a>
				</p>
				<ul class="use_lst">
					<li class="lst1"><a href="/user/buyInfo/coupon"><strong
							class="blind">할인쿠폰</strong><span class="num">0<span
								class="line"></span></span></a></li>
					<li class="lst2"><a href="/user/buyInfo/pointHistory"><strong
							class="blind">티몬캐쉬·적립금</strong><span class="num">0<span
								class="line"></span></span></a></li>
					<li class="lst3"><a
						href="/user/buyInfo/List?type=delivery&deliveryStatusType=D4&range=2"><strong
							class="blind">배송중</strong><span class="num">0<span
								class="line"></span></span></a></li>
					<li class="lst4"><a
						href="/user/buyInfo/List?type=ticket&ticketStatusType=AV&range=4"><strong
							class="blind">미사용 티켓</strong><span class="num">0<span
								class="line"></span></span></a></li>
					<li class="lst5"><a href="/user/buyInfo/Claim?claim_status=DN"><strong
							class="blind">환불완료</strong><span class="num">0<span
								class="line"></span></span></a></li>
				</ul>
			</div>
			<div class="mypage_container">
				<ul class="mypage_category">
					<li class="menu1"><a href="/user/buyInfo/List?type=all"><span
							class="name">구매내역</span></a></li>
					<li class="menu2 on"><a href="/user/buyInfo/claim"><span
							class="name">취소,환불 내역</span></a></li>
					<li class="menu3"><a href="/user/buyInfo/coupon"><span
							class="name">할인쿠폰</span></a></li>
					<li class="menu4"><a href="/user/buyInfo/pointHistory"><span
							class="name">티몬캐쉬·적립금</span></a></li>
					<li class="menu5"><a href="/user/wishlist"><span
							class="name">찜한 상품</span></a></li>
					<li class="menu6"><a href="/user/alimilist"><span
							class="name">재판매 알리미</span></a></li>
					<li class="menu7"><a href="/user/memberShip"><span
							class="new">NEW</span><span class="name">티몬 멤버십</span></a></li>
					<li class="menu8"><a href="/user/qna/talklist?type=talk"><span
							class="name">문의/답변</span></a></li>
					<li class="menu9"><a href="/user/info"><span class="name">개인정보</span></a>
					</li>
				</ul>
				<h3 class="blind">취소&middot;환불 내역</h3>
				<div class="date_control" style="margin-top: 20px">
					<ul class="date_lst">
						<li class="all"><a href="javascript:movePage(1, 1, 'DN');">전체</a></li>
						<li class="month3"><a href="javascript:movePage(1, 2, 'DN');"
							class="on">3개월</a></li>
						<li class="month6"><a href="javascript:movePage(1, 3, 'DN');">6개월</a></li>
						<li class="year1"><a href="javascript:movePage(1, 4, 'DN');">1년</a></li>
					</ul>
					<select title="취소/환불 상태" style="width: 100px" name="claim_status"
						id="claim_status" onchange="movePage(1, 2, this.value);">
						<option value="ALL">전체</option>
						<option value="AV">진행 중</option>
						<option value="DN" selected="selected">완료</option>
					</select>
				</div>
				<div class="buy_lst">
					<table cellspacing="0" border="1">
						<caption>취소&middot;환불내역</caption>
						<col width="170">
						<col>
						<col width="121">
						<col width="139">
						<thead>
							<tr>
								<th scope="colgroup" colspan="2">취소&middot;환불내역</th>
								<th scope="col">환불금액</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="4" class="none_lst"><strong>취소&middot;환불내역이
										없습니다.</strong></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!--/ #content -->
		</div>
		<!--/ #container -->
	</div>
		
</body>
</html>
