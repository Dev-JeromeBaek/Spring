<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
		font-size: large;
		margin-top: 10px;
	}
	</style>
</head>
<body>
		
	<div class="counterBox" style="<%-- border: 1px solid green; --%> width: 800px; height: 50px; margin-left: 300px;">
		<div class="tit4">총 매출 : </div>
		<div class="counter" data-count="${ totalSales }" style=" border: 1px solid orange;"></div>
		<span class="ss">${ totalSales } 원</span>
	</div>
	<div class="counterBox" style="<%-- border: 1px solid green; --%> width: 1150px; height: 50px; margin-left: 150px;">
		<div class="tit3" style="<%-- border: 1px solid blue; --%> margin-left: 50px;">이번 년도 매출 : </div>
     		<span class="ss">${ yearSales } 원</span>
		<div class="tit3" style=" <%-- border: 1px solid blue; --%>">이번 달 매출 :</div>
		<span class="ss">${ monthSales } 원</span>
		<div class="tit3" style=" <%-- border: 1px solid blue; --%>">금일 매출 :</div>
		<span class="ss">${ daySales } 원</span>
	</div>
	<c:choose>
	<c:when test="${ !corpSelList.isEmpty()}">
	<div class="showTopTop1" style="margin-left: -25px;">
			<div class="showTopTop1_sub">
			<p>딜 구매 리스트 </p>
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
					</tr>
				</thead>
				<tbody class="moreCorpSelView">
				
				<c:forEach items="${ corpSelList }" var="i" begin="0" end="${ corpSelList.size()<10 ? corpSelList.size() : 9 }" step="1" varStatus="status">
					<tr style="border-bottom: solid gray 1px; font-size: medium;">
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getCs_b_num() }')">${ i.getCs_b_num() }</a></td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getCs_di_category() }</td>
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
						<td>${ i.getCs_b_status() }</td>
					</tr>
				</c:forEach>
				</tbody>
				<c:if test="${ corpSelList.size() >= 11 }">
					<tbody class="hideMoreCorpSelView">
					<c:forEach items="${ corpSelList }" var="i" begin="10" end="${ corpSelList.size() }" step="1" varStatus="status">
						<tr style="border-bottom: solid gray 1px; font-size: medium;">
							<td>&nbsp;&nbsp;${ status.count+10 }</td>
							<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getCs_b_num() }')">${ i.getCs_b_num() }</a></td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getCs_di_category() }</td>
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
						<td>${ i.getCs_b_status() }</td>
					</tr>
				</c:forEach>
					</tbody>
				</c:if>
			</table>
			</div>
				<div id="corpSelList" class="moreDiv" style="cursor: pointer;"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
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
		 
			$('.hideMoreCorpSelView').hide();
			$(document.getElementById("corpSelList").getElementsByTagName("span").item(1)).hide();
			$("#corpSelList").click(
				function() {
					$(".hideMoreCorpSelView").slideToggle();
					
					var lll = document.getElementById("corpSelList").getElementsByTagName("span");
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
			
			
			;(function($, f) {
				if (!$) return f;
				var counterDefaults = {
					animate : true,
					oneMore : true,
					numbers : 9999999,
					rollingCount : 25,
					numHeight : 10,
					delayTime : 20,
					waitTime : 1,
					expect : 0,
					duration : 1000,
					attrCount : 'data-count',
					easing : 'linear',
					digit : 'digit'
				};
				var Counter = function(el, options) {
					this.container = $(el);
					this.opts = $.extend({}, counterDefaults, options);
					this.opts.numbers = this.container.attr(this.opts.attrCount);
					this.busy = false;this.init()
				};
				Counter.prototype = {
					init : function() {
						var ss = this;
						ss.makeDigit();ss.setComma();ss.rolling()
					},
					rolling : function() {
						var ss = this,
							numHeight = this.opts.numHeight,
							digigName = this.opts.digit;
						if (ss.busy) {
							return true
						}
						ss.busy = true;
						this.rollingCount = this.opts.rollingCount;this.container.find("." + digigName).each(function() {
							var $display = $(this),
								$digit = $display.find('span');
							$digit.css({
								top : '-' + (parseFloat($display.height()) * (numHeight)) + 'px'
							});
							if (ss.opts.animate) {
								ss.fastRolling($digit)
							} else {
								$digit.css({
									top : '-' + (parseInt($display.height(), 10) * (numHeight - parseInt($digit.attr('title')))) + 'px'
								})
							}
						})
					},
					fastRolling : function($digit) {
						var ss = this,
							numHeight = this.opts.numHeight,
							$display = $digit.parent();
						ss.rollingCount--;
						if (ss.rollingCount < 0) {
							ss.busy = false;
							if (ss.opts.oneMore) {
								var rnd = parseInt((Math.random() * numHeight) + 1, 10);
								$digit.css({
									top : '-' + (parseInt($display.height(), 10) * rnd) + 'px'
								});ss.transition($digit)
							} else {
								$digit.css({
									top : '-' + (parseInt($display.height(), 10) * (numHeight - parseInt($digit.attr('title')))) + 'px'
								})
							}
						} else {
							var delayValue = Math.random() * ss.opts.delayTime + ss.opts.waitTime;
							$digit.delay(delayValue);
							$digit.animate({
								top : '+=' + $display.height() + 'px'
							}, 10, function() {
								setTimeout(function() {
									ss.fastRolling($digit)
								}, 1);
								if (parseInt($digit.css('top')) > -1 * parseInt($display.height())) {
									$digit.css({
										top : '-' + (parseInt($display.height()) * 10) + 'px'
									})
								}
							})
						}
					},
					transition : function($digit) {
						var ss = this,
							numHeight = ss.opts.numHeight,
							$display = $digit.parent(),
							totalHeight = $display.height(),
							delayValue = Math.random() * ss.opts.delayTime + ss.opts.waitTime;
						$digit.delay(delayValue);
						$digit.animate({
							top : '-' + (parseFloat(totalHeight) * (numHeight - parseFloat($digit.attr('title')))) + 'px'
						}, {
							duration : ss.opts.duration,
							specialEasing : {
								top : ss.opts.easing
							}
						})
					},
					expectAnimate : function($digit) {},
					getCounter : function($counter) {
						var $total = '';
						$this.find('.digit').each(function() {
							var $display = $(this);
							var $digit = $display.find('span');
							$total = $total + $digit.attr('title')
						});return ($total * 1)
					},
					makeDigit : function() {
//						this.container.remove();
						var sHtml = "",
							sNum = this.opts.numbers.toString(),
							iNumLength = sNum.length - 1,
							rows = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 ].reverse().join('<br/>'),
							digigName = this.opts.digit;
						sHtml += '<div  class="counter-holder">';
						sHtml += '<span class="counter">';
						for (var i = 0; i <= iNumLength; i++) {
							sHtml += '<span class="' + digigName + '"><span title="' + sNum.charAt(i) + '" >' + rows + '</span><hr></span>'
						}
						;sHtml += '</span></div>';
//						this.container.remove( sHtml );
						this.container.append(sHtml);
//						this.container.attr(sHtml);
					},
					setComma : function() {
						var digigName = this.opts.digit;
						var digit = this.container.find("." + digigName).toArray().reverse();
						$.each(digit, function(i) {
							if (i != 0 && i % 3 == 0) {
								$('<span class="separator"><span title=",">,</span><hr></span>').insertAfter($(digit[i]))
							}
						})
					}
				};
				$.fn.rollingCounter = function(o) {
					var len = this.length;
					return this.each(function(index) {
						var $this = $(this),
							instance = new Counter($this, o);
						$this.data('rollingCounter' + (len > 1 ? '-' + (index + 1) : ''), instance)
					})
				}
			})(window.jQuery, false);
			
			
		</script>
	
</body>
</html>
