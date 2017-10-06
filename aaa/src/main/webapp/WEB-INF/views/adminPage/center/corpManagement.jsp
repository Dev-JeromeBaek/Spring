<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
		width:500px; 
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
		width: 900px;
		height: 50px;
		margin-left: 250px;
	}
	</style>
</head>
<body>
	<div class="counterBox">
		<div class="tit4">총 가입된 기업 수 : </div>
		<div class="counter" data-count="${ corpList.size() }"></div>
		<span class="ss"> 개</span>
	</div>
	<div class="counterBox">
		<div class="tit4" style="<%-- border: 1px solid blue; --%> ">오늘 가입한 기업 수 : </div>
		<div class="counter" data-count="${ todaysJoinCorp.size() }"></div>
		<span class="ss">개</span>
	</div>
	
	<c:choose>
	<c:when test="${ !corpList.isEmpty() }">
		<div class="showTopTop1">
			<div class="showTopTop1_sub">
			<p>우리화 함께하는 기업 목록</p>
			<div class="showTopTop1_sub_sub">
			<table class="corpListTable">
				<thead>
					<tr>
						<th>COUNT</th>
						<th>NUM</th><%-- 딜 번호 --%>
						<th>NAME</th><%-- 기업 회사이름 --%>
						<th>CEO</th><%-- 기업 대표이름 --%>
						<th>GRADE</th><%-- 기업 등급 --%>
						<th>DATE</th><%-- 기업 가입 날짜 --%>
					</tr>
				</thead>
				<tbody class="moreCorpListView">
				
				<c:forEach items="${ corpList }" var="i" begin="0" end="${ corpList.size()<10 ? corpList.size() : 9 }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td><a onclick="showDealDetail('${ i.getC_num() }')">${ i.getC_num() }</a></td>
						<td>${ i.getC_name() }</td>
						<td>&nbsp;${ i.getC_ceo() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getC_grade() }</td>
						<td>${ i.getC_string_date() }</td>
					</tr>
				</c:forEach>
				</tbody>
				<c:if test="${ corpList.size() >= 11 }">
					<tbody class="hideMoreCorpListView">
					<c:forEach items="${ corpList }" var="i" begin="10" end="${ corpList.size() }" step="1" varStatus="status">
						<tr>
						<td>&nbsp;${ status.count }</td>
						<td><a onclick="showDealDetail('${ i.getC_num() }')">${ i.getC_num() }</a></td>
						<td>${ i.getC_name() }</td>
						<td>&nbsp;${ i.getC_ceo() }</td>
						<td>&nbsp;&nbsp;${ i.getC_grade() }</td>
						<td>${ i.getC_string_date() }</td>
					</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
			</div>
				<div id="corpList" class="moreDiv" style="cursor: pointer;"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
		</div>
		<div class="showTopTop2">
			<div class="rankList">
			<p>인기 기업 Top 5</p>
			<div class="rankList_sub">
			<table class="rankTable">
				<thead>
					<tr>
						<th>COUNT</th>
						<th>NAME</th><%-- 기업 회사이름 --%>
						<th>CEO</th><%-- 기업 대표이름 --%>
						<th>SALES</th><%-- 총 판매 갯수 --%>
					</tr>
				</thead>
				<c:if test="${ salesTopCorp != null }">
				<tbody class="moreTopSalesView">
				<c:forEach items="${ salesTopCorp }" var="i" begin="0" end="${ salesTopCorp.size()<5 ? salesTopCorp.size() : 4 }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td><a onclick="showDealDetail('${ i.getInte1() }')">${ i.getStr1() }</a></td>
						<td>${ i.getStr2() }</td>
						<td>${ i.getInte2() }</td>
					</tr>
				</c:forEach>
				</tbody>
				</c:if>
			</table>
			</div>
			<div class="moreDiv">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
			<div class="rankList">
			<p>판매 딜 많은 기업 Top5</p>
			<div class="rankList_sub">
			<table class="rankTable">
				<thead>
					<tr>
						<th>COUNT</th>
						<th>NAME</th><%-- 기업 회사이름 --%>
						<th>CEO</th><%-- 기업 대표이름 --%>
						<th>DEAL</th><%-- 총 판매 갯수 --%>
					</tr>
				</thead>
				<tbody class="moreTopSalesView">
				<c:forEach items="${ topDealCorp }" var="i" begin="0" end="${ topDealCorp.size()<5 ? topDealCorp.size() : 4 }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td><a onclick="showDealDetail('${ i.getInte1() }')">${ i.getStr1() }</a></td>
						<td>${ i.getStr2() }</td>
						<td>${ i.getInte2() }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="moreDiv">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
			<div class="rankList">
			<p>위험 기업 리스트</p>
			<div class="rankList_sub">
			<table class="rankTable">
				<thead>
					<tr>
						<th>COUNT</th>
						<th>NAME</th><%-- 기업 회사이름 --%>
						<th>CEO</th><%-- 기업 대표이름 --%>
						<th>CANCEL</th><%-- 총 판매 갯수 --%>
					</tr>
				</thead>
				<tbody class="moreTopCancelView">
				<c:forEach items="${ topCancelCorp }" var="i" begin="0" end="${ topCancelCorp.size()<5 ? topCancelCorp.size() : 4 }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td><a onclick="showDealDetail('${ i.getInte1() }')">${ i.getStr1() }</a></td>
						<td>${ i.getStr2() }</td>
						<td>${ i.getInte2() }</td>
					</tr>
				</c:forEach>
				</tbody>
				<c:if test="${ topCancelCorp.size() >= 6 }">
					<tbody class="hideMoreTopCancelView">
					<c:forEach items="${ topCancelCorp }" var="i" begin="5" end="${ topCancelCorp.size() }" step="1" varStatus="status">
						<tr>
							<td>&nbsp;&nbsp;${ status.count }</td>
							<td><a onclick="showDealDetail('${ i.getInte1() }')">${ i.getStr1() }</a></td>
							<td>${ i.getStr2() }</td>
							<td>${ i.getInte2() }</td>
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
			</div>
				<div id="cancelCorp" class="moreDiv"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<h2>현재 등록된 기업회원이 존재하지 않습니다</h2><br>
		<h2>열심히 활동 하셔야 겠네요</h2>
	</c:otherwise>
	</c:choose>
		
		
		
	<script type="text/javascript">
		function showDealDetail(num) {
			var url = "/aaa/admin/showCorpDetail?c_num=" + num;
			var popname = num + "상세페이지";
			var size = "width=670px, height=580px, left=450px, top=100px";
			window.open(url, popname, size);
		}
		
		$('.hideMoreCorpListView').hide();
		$(document.getElementById("corpList").getElementsByTagName("span").item(1)).hide();
		$("#corpList").click(
			function() {
				$(".hideMoreCorpListView").slideToggle();
				
				var lll = document.getElementById("corpList").getElementsByTagName("span");
				$(lll.item(0)).slideToggle();
				$(lll.item(1)).slideToggle();
			}
		);
		
		$('.hideMoreTopCancelView').hide();
		$(document.getElementById("cancelCorp").getElementsByTagName("span").item(1)).hide();
		$("#cancelCorp").click(
			function() {
				$(".hideMoreTopCancelView").slideToggle();				
				var lll = document.getElementById("cancelCorp").getElementsByTagName("span");
				$(lll.item(0)).slideToggle();
				$(lll.item(1)).slideToggle();
			}
		);
		
	</script>
	
</body>
</html>
