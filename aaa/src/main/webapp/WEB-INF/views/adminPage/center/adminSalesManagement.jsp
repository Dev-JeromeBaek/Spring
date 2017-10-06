<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
		<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/aaa/resources/js/yeob/aa/jquery.rollingCounter.min.js"></script>
	<style type="text/css">
	td a {
		color: red;
		font-family: "배달의민족 한나는 열한살";
		font-size: 15px;
		cursor: help;
	}
	.tit3 {
		width: 250px ! important;
	}
	
	.tit4 {
		font-family:"RixVideoGame 3D"; 
		float:left; 
		width:250px; 
		height: 40px; 
		margin-left:200px; 
		font-size: xx-large;
		<%-- border: 1px solid blue; --%>
	}
	.ss {
		float: left;
		font-family: "스웨거 TTF";
		font-size: medium;
		margin-top: 15px;
		margin-left: 7px;
	}
	.counterBox {
		width: 800px;
		height: 50px;
		margin-left: 300px;
	}
	</style>
</head>
<body>
		
	<div class="counterBox">
		<div class="tit4">총 매출 : </div>
		<div class="counter" data-count="${ totalAdminSales }"></div>
		<span class="ss"> 원</span>
	</div>
	<div class="counterBox">
		<div class="tit4" style="<%-- border: 1px solid blue; --%> ">이번 년도 매출 : </div>
		<div class="counter" data-count="${ yearAdminSales }"></div>
		<span class="ss">원</span>
	</div>
	<div class="counterBox">
		<div class="tit4" style=" <%-- border: 1px solid blue; --%>">이번 달 매출 :</div>
		<div class="counter" data-count="${ monthAdminSales }"></div>
		<span class="ss">원</span>
	</div>
	<div class="counterBox">
		<div class="tit4" style=" <%-- border: 1px solid blue; --%>">금일 매출 :</div>
		<div class="counter" data-count="${ dayAdminSales }"></div>
		<span class="ss">원</span>
	</div>
	<br>
	<br>
	<c:choose>
	<c:when test="${ !buyList.isEmpty()}">
				<div class="showTopTop1" style="margin-left: 15px;">
					<div class="showTopTop1_sub">
						<p>거래 완료 리스트 (YES) </p>
						<div class="showTopTop1_sub_sub">
						<table class="memBuyListTable" style="padding: 5px; width: 1250px; margin-left: 20px;">
							<thead>
								<tr style="border-bottom: 3px solid gray; font-size: 20px;">
									<th>(카운트)</th>
									<th>구매 번호</th>
									<th>구매자 이름</th>
									<th>상품 종류</th>
									<th>상품 이름</th> 
									<th>상세 이름</th>
									<th>상세 수량</th>
									<th>총 금액</th>
									<th>구매 날짜</th>
								</tr>
							</thead>
							<tbody class="morebuyYesMemListView">
							
							<c:forEach items="${ buyYesMemList }" var="i" begin="0" end="${ buyYesMemList.size()<10 ? buyYesMemList.size() : 9 }" step="1" varStatus="status">
								<tr style="border-bottom: solid gray 1px; font-size: medium;">
									<td>&nbsp;&nbsp;${ status.count }</td>
									<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getMa_b_num() }')">${ i.getMa_b_num() }</a></td>
									<td>&nbsp;&nbsp;${ i.getMa_m_name() }
									<td>${ i.getMa_di_category() }</td>
									<td>&nbsp;&nbsp;&nbsp;${ i.getMa_di_name() }</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_name() }</div>
									</c:forEach>
									</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_amount() }</div>
									</c:forEach>
									</td>
									<td>${ i.getMa_b_price() }</td>
									<td>${ i.getMa_b_date_string() }</td>
								</tr>
							</c:forEach>
							</tbody>
							<c:if test="${ buyYesMemList.size() >= 11 }">
								<tbody class="hideMorebuyYesMemListView">
								<c:forEach items="${ buyYesMemList }" var="i" begin="10" end="${ buyYesMemList.size() }" step="1" varStatus="status">
									<tr style="border-bottom: solid gray 1px; font-size: medium;">
									<td>&nbsp;&nbsp;${ status.count }</td>
									<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getMa_b_num() }')">${ i.getMa_b_num() }</a></td>
									<td>&nbsp;&nbsp;${ i.getMa_m_name() }
									<td>${ i.getMa_di_category() }</td>
									<td>&nbsp;&nbsp;&nbsp;${ i.getMa_di_name() }</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_name() }}</div>
									</c:forEach>
									</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_amount() }</div>
									</c:forEach>
									</td>
									<td>${ i.getMa_b_price() }</td>
									<td>${ i.getMa_b_date_string() }</td>
								</tr>
							</c:forEach>
								</tbody>
							</c:if>
						</table>
						</div>
						<div id="buyYesMemList" class="moreDiv" style="cursor: pointer;"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
					</div>
				</div>
				<div class="showTopTop1" style="margin-left: 15px;">
					<div class="showTopTop1_sub">
						<p>결제 대기 리스트(WAIT) </p>
						<div class="showTopTop1_sub_sub">
						<table class="memBuyListTable" style="padding: 5px; width: 1250px; margin-left: 20px;">
							<thead>
								<tr style="border-bottom: 3px solid gray; font-size: 20px;">
									<th>(카운트)</th>
									<th>구매 번호</th>
									<th>구매자 이름</th>
									<th>상품 종류</th>
									<th>상품 이름</th> 
									<th>상세 이름</th>
									<th>상세 수량</th>
									<th>총 금액</th>
									<th>구매 날짜</th>
								</tr>
							</thead>
							<tbody class="morebuyWaitMemListView">
							
							<c:forEach items="${ buyWaitMemList }" var="i" begin="0" end="${ buyWaitMemList.size()<10 ? buyWaitMemList.size() : 9 }" step="1" varStatus="status">
								<tr style="border-bottom: solid gray 1px; font-size: medium;">
									<td>&nbsp;&nbsp;${ status.count }</td>
									<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getMa_b_num() }')">${ i.getMa_b_num() }</a></td>
									<td>&nbsp;&nbsp;${ i.getMa_m_name() }
									<td>${ i.getMa_di_category() }</td>
									<td>&nbsp;&nbsp;&nbsp;${ i.getMa_di_name() }</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_name() }</div>
									</c:forEach>
									</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_amount() }</div>
									</c:forEach>
									</td>
									<td>${ i.getMa_b_price() }</td>
									<td>${ i.getMa_b_date_string() }</td>
								</tr>
							</c:forEach>
							</tbody>
							<c:if test="${ buyWaitMemListe.size() >= 11 }">
								<tbody class="hideMorebuyWaitMemListView">
								<c:forEach items="${ buyWaitMemListe }" var="i" begin="10" end="${ buyWaitMemList.size() }" step="1" varStatus="status">
								<tr style="border-bottom: solid gray 1px; font-size: medium;">
									<td>&nbsp;&nbsp;${ status.count }</td>
									<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getMa_b_num() }')">${ i.getMa_b_num() }</a></td>
									<td>&nbsp;&nbsp;${ i.getMa_m_name() }
									<td>${ i.getMa_di_category() }</td>
									<td>&nbsp;&nbsp;&nbsp;${ i.getMa_di_name() }</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_name() }</div>
									</c:forEach>
									</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_amount() }</div>
									</c:forEach>
									</td>
									<td>${ i.getMa_b_price() }</td>
									<td>${ i.getMa_b_date_string() }</td>
								</tr>
							</c:forEach>
								</tbody>
							</c:if>
						</table>
						</div>
						<div id="buyWaitMemList" class="moreDiv" style="cursor: pointer;"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
					</div>
				</div>
				<div class="showTopTop1" style="margin-left: 15px;">
					<div class="showTopTop1_sub">
						<p>구매 진행중 리스트(ING) </p>
						<div class="showTopTop1_sub_sub">
						<table class="memBuyListTable" style="padding: 5px; width: 1250px; margin-left: 20px;">
							<thead>
								<tr style="border-bottom: 3px solid gray; font-size: 20px;">
									<th>(카운트)</th>
									<th>구매 번호</th>
									<th>구매자 이름</th>
									<th>상품 종류</th>
									<th>상품 이름</th> 
									<th>상세 이름</th>
									<th>상세 수량</th>
									<th>총 금액</th>
									<th>구매 날짜</th>
								</tr>
							</thead>
							<tbody class="morebuyIngMemListView">
							
							<c:forEach items="${ buyIngMemList }" var="i" begin="0" end="${ buyIngMemList.size()<10 ? buyIngMemList.size() : 9 }" step="1" varStatus="status">
								<tr style="border-bottom: solid gray 1px; font-size: medium;">
									<td>&nbsp;&nbsp;${ status.count }</td>
									<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getMa_b_num() }')">${ i.getMa_b_num() }</a></td>
									<td>&nbsp;&nbsp;${ i.getMa_m_name() }
									<td>${ i.getMa_di_category() }</td>
									<td>&nbsp;&nbsp;&nbsp;${ i.getMa_di_name() }</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_name() }</div>
									</c:forEach>
									</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_amount() }</div>
									</c:forEach>
									</td>
									<td>${ i.getMa_b_price() }</td>
									<td>${ i.getMa_b_date_string() }</td>
								</tr>
							</c:forEach>
							</tbody>
							<c:if test="${ buyIngMemList.size() >= 11 }">
								<tbody class="hideMorebuyIngMemListView">
								<c:forEach items="${ buyIngMemList }" var="i" begin="10" end="${ buyIngMemList.size() }" step="1" varStatus="status">
									<tr style="border-bottom: solid gray 1px; font-size: medium;">
									<td>&nbsp;&nbsp;${ status.count }</td>
									<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getMa_b_num() }')">${ i.getMa_b_num() }</a></td>
									<td>&nbsp;&nbsp;${ i.getMa_m_name() }
									<td>${ i.getMa_di_category() }</td>
									<td>&nbsp;&nbsp;&nbsp;${ i.getMa_di_name() }</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_name() }</div>
									</c:forEach>
									</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_amount() }</div>
									</c:forEach>
									</td>
									<td>${ i.getMa_b_price() }</td>
									<td>${ i.getMa_b_date_string() }</td>
								</tr>
							</c:forEach>
								</tbody>
							</c:if>
						</table>
						</div>
						<div id="buyIngMemList" class="moreDiv" style="cursor: pointer;"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
					</div>
				</div>
				<div class="showTopTop1" style="margin-left: 15px;">
					<div class="showTopTop1_sub">
						<p>구매 취소 리스트(NO) </p>
						<div class="showTopTop1_sub_sub">
						<table class="memBuyListTable" style="padding: 5px; width: 1250px; margin-left: 20px;">
							<thead>
								<tr style="border-bottom: 3px solid gray; font-size: 20px;">
									<th>(카운트)</th>
									<th>구매 번호</th>
									<th>구매자 이름</th>
									<th>상품 종류</th>
									<th>상품 이름</th> 
									<th>상세 이름</th>
									<th>상세 수량</th>
									<th>총 금액</th>
									<th>구매 날짜</th>
								</tr>
							</thead>
							<tbody class="morebuyNoMemListView">
							
							<c:forEach items="${ buyNoMemList }" var="i" begin="0" end="${ buyNoMemList.size()<10 ? buyNoMemList.size() : 9 }" step="1" varStatus="status">
								<tr style="border-bottom: solid gray 1px; font-size: medium;">
									<td>&nbsp;&nbsp;${ status.count }</td>
									<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getMa_b_num() }')">${ i.getMa_b_num() }</a></td>
									<td>&nbsp;&nbsp;${ i.getMa_m_name() }
									<td>&nbsp;&nbsp;&nbsp;${ i.getMa_di_category() }</td>
									<td>&nbsp;&nbsp;&nbsp;${ i.getMa_di_name() }</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_name() }</div>
									</c:forEach>
									</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_amount() }</div>
									</c:forEach>
									</td>
									<td>${ i.getMa_b_price() }</td>
									<td>${ i.getMa_b_date_string() }</td>
								</tr>
							</c:forEach>
							</tbody>
							<c:if test="${ buyNoMemList.size() >= 11 }">
								<tbody class="hideMorebuyNoMemListView">
								<c:forEach items="${ buyNoMemList }" var="i" begin="10" end="${ buyNoMemList.size() }" step="1" varStatus="status">
									<tr style="border-bottom: solid gray 1px; font-size: medium;">
									<td>&nbsp;&nbsp;${ status.count }</td>
									<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getMa_b_num() }')">${ i.getMa_b_num() }</a></td>
									<td>&nbsp;&nbsp;${ i.getMa_m_name() }
									<td>&nbsp;&nbsp;&nbsp;${ i.getMa_di_category() }</td>
									<td>&nbsp;&nbsp;&nbsp;${ i.getMa_di_name() }</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_name() }</div>
									</c:forEach>
									</td>
									<td>
									<c:forEach var="each" items="${ i.getBuyDetail() }">
										<div>${ each.getBd_dd_amount() }</div>
									</c:forEach>
									</td>
									<td>${ i.getMa_b_price() }</td>
									<td>${ i.getMa_b_date_string() }</td>
								</tr>
							</c:forEach>
								</tbody>
							</c:if>
						</table>
						</div>
						<div id="buyNoMemList" class="moreDiv" style="cursor: pointer;"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
					</div>
				</div>
	</c:when>
	<c:otherwise>
	<br>
	<h2>판매 내역이 존재하지 않습니다!</h2>
	<br>
	</c:otherwise>
	</c:choose>
		<script type="text/javascript">
			$('.hideMorebuyYesMemListView').hide();
			$(document.getElementById("buyYesMemList").getElementsByTagName("span").item(1)).hide();
			$("#buyYesMemList").click(
				function() {
					$(".hideMorebuyYesMemListeView").slideToggle();
					
					var lll = document.getElementById("buyYesMemList").getElementsByTagName("span");
					$(lll.item(0)).slideToggle();
					$(lll.item(1)).slideToggle(); 
				}
			);
		
			$('.hideMorebuyWaitMemListView').hide();
			$(document.getElementById("buyWaitMemList").getElementsByTagName("span").item(1)).hide();
			$("#buyWaitMemList").click(
				function() {
					$(".hideMorebuyWaitMemListView").slideToggle();
					
					var lll = document.getElementById("buyWaitMemList").getElementsByTagName("span");
					$(lll.item(0)).slideToggle();
					$(lll.item(1)).slideToggle(); 
				}
			);
		
			$('.hideMorebuyIngMemListView').hide();
			$(document.getElementById("buyIngMemList").getElementsByTagName("span").item(1)).hide();
			$("#buyIngMemList").click(
				function() {
					$(".hideMorebuyIngMemListView").slideToggle();
					
					var lll = document.getElementById("buyIngMemList").getElementsByTagName("span");
					$(lll.item(0)).slideToggle();
					$(lll.item(1)).slideToggle(); 
				}
			);
		
			$('.hideMorebuyNoMemListView').hide();
			$(document.getElementById("buyNoMemList").getElementsByTagName("span").item(1)).hide();
			$("#buyNoMemList").click(
				function() {
					$(".hideMorebuyNoMemListView").slideToggle();
					
					var lll = document.getElementById("buyNoMemList").getElementsByTagName("span");
					$(lll.item(0)).slideToggle();
					$(lll.item(1)).slideToggle(); 
				}
			);
			
			function showDealDetail(num) {
				var url = "/aaa/idvCorp/showDealBuyDetail?b_num=" + num;
				var popname = num + "상세페이지";
				var size = "width=820px, height=461px, left=450px, top=100px";
				window.open(url, popname, size);
			}
		</script>
</body>
</html>
