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
		margin-left: 350px;
	}
	</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-6" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/dealManagement.jsp">
	<div class="counterBox" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-6" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/dealManagement.jsp">
		<div class="tit4">총 신청 딜 : </div>
		<div class="counter" data-count="${ TotaldealInfo }"></div>
		<span class="ss"> 개</span>
	</div>
	<div class="counterBox">
		<div class="tit4" style="<%-- border: 1px solid blue; --%> ">승인 대기 딜 : </div>
		<div class="counter" data-count="${ approveNullInfoTotal.size() }"></div>
		<span class="ss">개</span>
	</div>
	<div class="counterBox">
		<div class="tit4" style=" <%-- border: 1px solid blue; --%>">승인 딜 : </div>
		<div class="counter" data-count="${ dealApproveList.size() }"></div>
		<span class="ss">개</span>
	</div>
	<div class="counterBox">
		<div class="tit4" style=" <%-- border: 1px solid blue; --%>">승인취소 딜 : </div>
		<div class="counter" data-count="${ dealCancelList.size() }"></div>
		<span class="ss">개</span>
	</div>	
	<c:choose>
	<c:when test="${ !dealApprove.isEmpty() || !dealApproveList.isEmpty() || !dealCancelList.isEmpty() }">
		<div class="showTopTop1">
			<div class="showTopTop1_sub">
			<p>승인 대기중인 딜 목록</p>
			<div class="showTopTop1_sub_sub">
			<table class="waitApproveTable">
				<thead>
					<tr>
						<th>COUNT</th>
						<th>NUM</th><%-- 딜 번호 --%>
						<th>CORP_NAME</th><%-- 기업 회사이름 --%>
						<th>CORP_CEO</th><%-- 기업 대표이름 --%>
						<th>CATEGORY</th><%-- 딜 종류 --%>
						<th>EXPLAIN</th><%-- 딜 설명 --%>
						<th>DATE</th><%-- 승인 요청 날짜 --%>
						<%-- 승인/비승인 버튼 --%>
						<th colspan="3">
							&nbsp;&nbsp;&nbsp;&nbsp;APPROVE&nbsp;&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp;CANCEL
						</th>
					</tr>
				</thead>
				<tbody class="moreNullView">
				
				<c:forEach items="${ dealApprove }" var="i" begin="0" end="${ dealApprove.size()<10 ? dealApprove.size() : 9 }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getDi_num() }')">${ i.getDi_num() }</a></td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getC_name() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getC_ceo() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getDi_category() }</td>
						<td>${ i.getDi_exp_sub() }</td>
						<td>${ i.getDi_string_date() }</td>
						<td>
						<input type="button" value="APPROVE" onclick="upStatusDeal(${ i.getDi_num() }, 'YES')" 
							style="background-color:green; color:white; cursor: pointer; font-weight: bold;"></td>
						<td><input type="button" value="CANCEL" onclick="upStatusDeal(${ i.getDi_num() }, 'NO')"
							style="background-color:red; color:white; cursor: pointer; font-weight: bold;"></td>
					</tr>
				</c:forEach>
				</tbody>
				<c:if test="${ dealApprove.size() >= 11 }">
					<tbody class="hideMoreNullView">
					<c:forEach items="${ dealApprove }" var="i" begin="10" end="${ dealApprove.size() }" step="1" varStatus="status">
						<tr>
							<td>&nbsp;&nbsp;${ status.count+10 }</td>
							<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getDi_num() }')">${ i.getDi_num() }</a></td>
							<td>&nbsp;&nbsp;&nbsp;${ i.getC_name() }</td>
							<td>&nbsp;&nbsp;&nbsp;${ i.getC_ceo() }</td>
							<td>&nbsp;&nbsp;&nbsp;${ i.getDi_category() }</td>
							<td>${ i.getDi_exp_sub() }</td>
							<td>${ i.getDi_string_date() }</td>
							<td>
							<input type="button" value="APPROVE" onclick="upStatusDeal(${ i.getDi_num() }, 'YES')" 
								style="background-color:green; color:white; cursor: pointer; font-weight: bold;"></td>
							<td><input type="button" value="CANCEL" onclick="upStatusDeal(${ i.getDi_num() }, 'NO')" 
								style="background-color:red; color:white; cursor: pointer; font-weight: bold;"></td>
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
			</div>
				<div id="nullDeal" class="moreDiv" style="cursor: pointer;"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
		</div>
		
		<script type="text/javascript">
			function upStatusDeal(num, dealStatus) {
				if(dealStatus == "NO") {
					var url = "/aaa/admin/beforeCancelMsg?di_num=" + num;	
					var popname = num + "취소페이지";
					var size = "width=580px, height=540px, left=600px, top=300px";
					window.open(url, popname, size);
				} else {
					location.href="/aaa/admin/upStatusDeal?di_num="+num+"&di_approve="+dealStatus;
				}
			}
			function showDealDetail(num) {
				var url = "/aaa/admin/showDealDetail?di_num=" + num;
				var popname = num + "상세페이지";
				var size = "width=600px, height=820px, left=450px, top=100px";
				window.open(url, popname, size);
			}
		</script>
		<div class="showTopTop2">
			<div class="leftList">
			<p>승인 딜 목록</p>
			<div class="leftList_sub">
			<table class="listTable">
				<thead>
					<tr>
						<th>COUNT</th>
						<th>NUM</th><%-- 딜 번호 --%>
						<th>CATEGORY</th><%-- 딜 종류 --%>
						<th>EXPLAIN</th><%-- 딜 설명 --%>
						<th>DATE</th><%-- 승인 요청 날짜 --%>
					</tr>
				</thead>
				<tbody class="moreApproveView">
				<c:forEach items="${ dealApproveList }" var="i" begin="0" end="${ dealApproveList.size()<10 ? dealApproveList.size() : 9 }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getDi_num() }')">${ i.getDi_num() }</a></td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getDi_category() }</td>
						<td>${ i.getDi_exp_sub() }</td>
						<td>${ i.getDi_date_string() }</td>
					</tr>
				</c:forEach>
				</tbody>
				<c:if test="${ dealApproveList.size() >= 11}">
					<tbody class="hideMoreApproveView">
					<c:forEach items="${ dealApproveList }" var="i" begin="10" end="${ dealApproveList.size() }" step="1" varStatus="status">
						<tr>
							<td>&nbsp;&nbsp;${ status.count+10 }</td>
							<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getDi_num() }')">${ i.getDi_num() }</a></td>
							<td>&nbsp;&nbsp;&nbsp;${ i.getDi_category() }</td>
							<td>${ i.getDi_exp_sub() }</td>
							<td>${ i.getDi_date_string() }</td>
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
			</div>
				<div id="approveDeal" class="moreDiv"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
		</div>
		<div class="showTopTop2">
			<div class="rightList">
			<p>딜 취소 목록</p>
			<div class="rightList_sub">
			<table class="listTable">
				<thead>
					<tr>
						<th>COUNT</th>
						<th>NUM</th><%-- 딜 번호 --%>
						<th>CATEGORY</th><%-- 딜 종류 --%>
						<th>EXPLAIN</th><%-- 딜 설명 --%>
						<th>DATE</th><%-- 승인 요청 날짜 --%>
					</tr>
				</thead>
				<tbody class="moreCancelView">
				<c:forEach items="${ dealCancelList }" var="i" begin="0" end="${ dealCancelList.size()<10 ? dealCancelList.size() : 9 }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getDi_num() }')">${ i.getDi_num() }</a></td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getDi_category() }</td>
						<td>${ i.getDi_exp_sub() }</td>
						<td>${ i.getDi_date_string() }</td>
					</tr>
				</c:forEach>
				</tbody>
				<c:if test="${ dealCancelList.size() >= 11}">
					<tbody class="hideMoreCancelView">
					<c:forEach items="${ dealCancelList }" var="i" begin="10" end="${ dealCancelList.size() }" step="1" varStatus="status">
						<tr>
							<td>&nbsp;&nbsp;${ status.count+10 }</td>
							<td>&nbsp;&nbsp;<a onclick="showDealDetail('${ i.getDi_num() }')">${ i.getDi_num() }</a></td>
							<td>&nbsp;&nbsp;&nbsp;${ i.getDi_category() }</td>
							<td>${ i.getDi_exp_sub() }</td>
							<td>${ i.getDi_date_string() }</td>
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
			</div>
				<div id="cancelDeal" class="moreDiv"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<h2>현재 등록된 딜이 존재하지 않습니다</h2><br>
		<h2>열심히 활동 하셔야 겠네요</h2>
	</c:otherwise>
	</c:choose>
		
</body>
</html>
