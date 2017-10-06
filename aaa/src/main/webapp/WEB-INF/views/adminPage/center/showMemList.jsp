<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	
	<br>
	<br>
	<div class="counterBox">
		<div class="tit1">총 가입된 회원 수 : </div>
		<div class="counter" data-count="${ memList.size() }" style="margin-top: 0px ! important;"></div>
		<div class="tit2">현재 접속중인 회원 수 : </div>
		<div class="counter" data-count="${ nowMemOx.size() }" style="margin-top: 0px ! important;"></div>
	</div>
	<c:choose>
	<c:when test="${ !memList.isEmpty() }">
		<div class="showTopTop2">
			<div class="leftList">
			<p>일반회원목록</p>
			<div class="leftList_sub">
			<table class="listTable">
				<thead>
					<tr>
						<th>COUNT</th>
						<th>MEMNUM</th>
						<th>ID</th>
						<th>GRADE</th>
						<th>NOW</th>
					</tr>
				</thead>
				<tbody class="moreMemListView">
				<c:forEach items="${ memList }" var="i" begin="0" end="${ memList.size()<10 ? memList.size() : 9 }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/aaa/mem/showMemDetail?m_num=${ i.getM_num() }"></a>${ i.getM_num() }</td>
						<td>${ i.getM_id() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getM_grade() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getM_ox() }</td>
					</tr>
				</c:forEach>
				</tbody>
				<c:if test="${ memList.size() >= 11}">
				<tbody class="hideMoreMemListView">
				<c:forEach items="${ memList }" var="i" begin="10" end="${ memList.size() }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count+10 }</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/aaa/mem/showMemDetail?m_num=${ i.getM_num() }"></a>${ i.getM_num() }</td>
						<td>${ i.getM_id() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getM_grade() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getM_ox() }</td>
					</tr>
				</c:forEach>
				</tbody>
				</c:if>
			</table>
			</div>
			<div id="moreMemList" class="moreDiv"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
			
			<div class="rightList">
			<p>접속회원목록</p>
			<div class="rightList_sub">
			<table class="listTable">
				<thead>
					<tr>
						<th>COUNT</th>
						<th>MEMNUM</th>
						<th>ID</th>
						<th>GRADE</th>
						<th>NOW</th>
					</tr>
				</thead>
				<tbody class="moreOxListView">
				<c:forEach items="${ nowMemOx }" var="i" begin="0" end="${ nowMemOx.size()<10 ? nowMemOx.size() : 9 }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count }</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/aaa/mem/showMemDetail?m_num=${ i.getM_num() }"></a>${ i.getM_num() }</td>
						<td>${ i.getM_id() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getM_grade() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getM_ox() }</td>
					</tr>
				</c:forEach>
				</tbody>
				<c:if test="${ nowMemOx.size() >= 11}">
				<tbody class="hideMoreOxListView">
				<c:forEach items="${ nowMemOx }" var="i" begin="10" end="${ nowMemOx.size() }" step="1" varStatus="status">
					<tr>
						<td>&nbsp;&nbsp;${ status.count+10 }</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/aaa/mem/showMemDetail?m_num=${ i.getM_num() }"></a>${ i.getM_num() }</td>
						<td>${ i.getM_id() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getM_grade() }</td>
						<td>&nbsp;&nbsp;&nbsp;${ i.getM_ox() }</td>
					</tr>
				</c:forEach>
				</tbody>
				</c:if>
			</table>
			</div>
			<div id="moreOxList" class="moreDiv"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
			
		</div>
<!-- 		<div class="showTopTop2"> -->
			
<!-- 			<div class="leftList"> -->
<!-- 			<p>일반회원날짜별 가입 그래프</p> -->
<!-- 			<div class="leftList_sub"> -->
<!-- 			</div> -->
<!-- 			</div> -->
			
		
<!-- 			<div class="rightList"> -->
<!-- 			<p>접속회원 일자별 그래프</p> -->
<!-- 			<div class="rightList_sub"> -->
<!-- 			</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="showTopTop2"> -->
<!-- 			<div class="leftList"> -->
<!-- 			<p>[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]그래프</p> -->
<!-- 			<div class="leftList_sub"> -->
<!-- 			</div> -->
<!-- 			</div> -->
<!-- 			<div class="rightList"> -->
<!-- 			<p>[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]그래프</p> -->
<!-- 			<div class="rightList_sub"> -->
<!-- 			</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
	</c:when>
	<c:otherwise>
		<h2>현재 가입한 회원이 존재하지 않습니다</h2><br>
		<h2>열심히 활동 하셔야 겠네요</h2>
	</c:otherwise>
	</c:choose>
	
	 <script type="text/javascript">
	 
		$('.hideMoreMemListView').hide();
		$(document.getElementById("moreMemList").getElementsByTagName("span").item(1)).hide();
		$("#moreMemList").click(
			function() {
				$(".hideMoreMemListView").slideToggle();
				
				var lll = document.getElementById("moreMemList").getElementsByTagName("span");
				$(lll.item(0)).toggle();
				$(lll.item(1)).toggle();
			}
		);
		
		$('.hideMoreOxListView').hide();
		$(document.getElementById("moreOxList").getElementsByTagName("span").item(1)).hide();
		$("#moreOxList").click(
			function() {
				$(".hideMoreOxListView").slideToggle();				
				var lll = document.getElementById("moreOxList").getElementsByTagName("span");
				$(lll.item(0)).toggle();
				$(lll.item(1)).toggle();
			}
		);
	</script>
</body>
</html>
