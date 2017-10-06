<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
	.tit5 {
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
		font-size: large;
		margin-top: 10px;
	}
	</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-43" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/memBuyListManagement.jsp">
	<div class="counterBox" style="<%-- border: 1px solid green; --%>width: 800px; height: 50px; margin-left: 300px;" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-43" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/memBuyListManagement.jsp">
		<div class="tit5">총 거래 수 : </div>
		<div class="counter" data-count="${ buyList.size() }" style=" border: 1px solid orange;"></div>
		<span class="ss">${ buyList.size() } 개</span>
	</div>
	<div class="counterBox" style="<%-- border: 1px solid green; --%>width: 1300px; height: 50px; margin-left: 100px;">
		<div class="tit3" style="margin-left: 20px;">거래완료 : </div>
		<div class="counter" data-count="${ finishedDealingList.size() }" style=" border: 1px solid orange;"></div>
		<span class="ss">${ finishedDealingList.size() } 개</span>
		<div class="tit3">거래취소 : </div>
<%-- 		<div class="counter" data-count="${ canceledDealingList.size() }" style=" border: 1px solid orange;"></div> --%>
		<span class="ss">${ canceledDealingList.size() } 개</span>
		<div class="tit3">거래요청 : </div>
<%-- 		<div class="counter" data-count="${ waitingDealingList.size() }" style=" border: 1px solid orange;"></div> --%>
		<span class="ss">${ waitingDealingList.size() } 개</span>
		<div class="tit3">거래진행중 : </div>
<%-- 		<div class="counter" data-count="${ continueDealingList.size() }" style=" border: 1px solid orange;"></div> --%>
		<span class="ss">${ continueDealingList.size() } 개</span>
	</div>
	<c:choose>
	<c:when test="${ !memBuyList.isEmpty() }">
		<div class="showTopTop1">
			<div class="showTopTop1_sub">
			<p>구매 고객 리스트</p>
			<div class="showTopTop1_sub_sub">
			<table class="memBuyListTable" style="padding: 5px; width: 1250px; margin-left: 20px;">
				<thead>
					<tr style="border-bottom: 3px solid gray; font-size: 20px;">
						<th>(카운트)</th>
						<th>구매 번호</th>
						<th>상품 종류</th>
						<th>상품 이름</th> 
						<th>상세 이름</th>
						<th>상세 수량</th>
						<th>총 금액</th>
						<th>구매 현재상태</th>
						<th>거래신청일자</th>
						<th>거래완료/취소일자</th>
					</tr>
				</thead>
				<tbody class="moreCorpSelView">
				
				<c:forEach items="${ memBuyList }" var="i" begin="0" end="${ memBuyList.size()<10 ? memBuyList.size() : 9 }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getCs_b_num() }')">${ i.getCs_b_num() }</a></td>
						<td>${ i.getCs_di_category() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getCs_di_name() }</td>
						<td>
						<c:forEach var="each" items="${ i.getBuyDetail() }">
							<div> - ${ each.getBd_dd_name() }</div>
						</c:forEach>
						</td>
						<td>
						<c:forEach var="each" items="${ i.getBuyDetail() }">
							<div>${ each.getBd_dd_amount() }</div>
						</c:forEach>
						</td>
						<td>${ i.getCs_b_price() }</td>
						<c:choose>
							<c:when test="${ i.getCs_b_status().equals('YES') || i.getCs_b_status().equals('NO') }">
								<td>${ i.getCs_b_status() }</td>
							</c:when>
							<c:otherwise>
								<td><a onclick="changeStatus('${ i.getCs_b_num() }')">${ i.getCs_b_status() }</a></td>
							</c:otherwise>
						</c:choose>
						<td>${ i.getCs_b_date_string() }</td>
						<c:choose>
							<c:when test="${ i.getCs_b_status().equals('YES') || i.getCs_b_status().equals('NO')}">
								<td>${ i.getCs_final_date_string() }</td>
							</c:when>
							<c:when test="${ i.getCs_b_status().equals('ING') }">
								<td>배송중..</td>
							</c:when>
							<c:otherwise>
								<td>거래 진행중..</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
				</tbody>
				<c:if test="${ memBuyList.size() >= 11 }">
					<tbody class="hideMoreCorpSelView">
					<c:forEach items="${ memBuyList }" var="i" begin="10" end="${ memBuyList.size() }" step="1" varStatus="status">
						<tr>
							<td>&nbsp;&nbsp;${ status.count+10 }</td>
							<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getCs_b_num() }')">${ i.getCs_b_num() }</a></td>
						<td>${ i.getCs_di_category() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getCs_di_name() }</td>
						<td>
						<c:forEach var="each" items="${ i.getBuyDetail() }">
							<div> - ${ each.getBd_dd_name() }</div>
						</c:forEach>
						</td>
						<td>
						<c:forEach var="each" items="${ i.getBuyDetail() }">
							<div>${ each.getBd_dd_amount() }</div>
						</c:forEach>
						</td>
							
						<td>${ i.getCs_b_price() }</td>
						<c:choose>
							<c:when test="${ i.getCs_b_status().equals('YES') || i.getCs_b_status().equals('NO') }">
								<td>${ i.getCs_b_status() }</td>
							</c:when>
							<c:otherwise>
								<td><a onclick="changeStatus('${ i.getCs_b_num() }')">${ i.getCs_b_status() }</a></td>
							</c:otherwise>
						</c:choose>
						<td>${ i.getCs_b_date_string() }</td>
						<c:choose>
							<c:when test="${ i.getCs_b_status().equals('YES') || i.getCs_b_status().equals('NO')}">
								<td>${ i.getCs_final_date_string() }</td>
							</c:when>
							<c:when test="${ i.getCs_b_status().equals('ING') }">
								<td>배송중..</td>
							</c:when>
							<c:otherwise>
								<td>거래 진행중..</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
					</tbody>
				</c:if>
			</table>
			</div>
				<div id="corpSelList" class="moreDiv" style="cursor: pointer;"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
		</div>
		<script type="text/javascript">
		 
			$('.hideMoreCorpSelView').hide();
			$(document.getElementById("corpSelList").getElementsByTagName("span").item(1)).hide();
			$("#corpSelList").click(
				function() {
					$(".hideMoreCorpSelView").slideToggle();
					
					var lll = document.getElementById("corpSelList").getElementsByTagName("span");
					$(lll.item(0)).toggle();
					$(lll.item(1)).toggle();
				}
			);
			
			function showDealDetail(num) {
				var url = "/aaa/idvCorp/showDealBuyDetail?b_num=" + num;
				var popname = num + "상세페이지";
				var size = "width=820px, height=461px, left=450px, top=100px";
				window.open(url, popname, size);
			}
			
			function changeStatus(num) {
				var url = "/aaa/idvCorp/changeBuyStatus?b_num=" + num;
				var popname = num + "구매상태변경페이지";
				var size = "width=400px, height=300px, left=450px, top=100px";
				window.open(url, popname, size);
			}
			
		</script>
	</c:when>
	<c:otherwise>
		<h2>구매한 고객 리스트가 존재하지 않습니다!</h2><br>
		<h1><a href="/aaa/idvCorp/dealInsert">상품 등록하러 가기</a></h1>
	</c:otherwise>
	</c:choose>
</body>
</html>
