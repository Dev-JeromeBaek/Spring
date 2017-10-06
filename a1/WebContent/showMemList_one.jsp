<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="refresh" content="30" url="#">
	<title>Insert title here</title>
	<script src="js/yeob/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/yeob/jquery.sortelements.js" type="text/javascript"></script>
	<script src="js/yeob/jquery.bdt.min.js" type="text/javascript"></script>
	
	<style type="text/css">
	.container {
		margin-top: 5px;
		margin-bottom: 5px;
	}
	.table {
		width:1430px; margin-left: 30px; margin-right: 30px;
	}
	</style>
	
</head>
<body>
	<div class="memListTable" style="padding-bottom: 5px; padding-top: 5px;">
		<p style="text-align: center; font-size: xx-large;">회원 정보 전체 리스트 Page</p>
		<div class="container">
		<h2>일반회원목록</h2>
		<div style="right: 200px;">총 가입된 회원 수 [ <a href="#">${ memTotal }</a> ]</div>
		<div style="right: 100px;">현재 접속중인 회원 수 [ <a href="#">${ nowMemOxCount }</a> ]</div>
		<div>
		</div>
		<a href="#"></a>
	    <div class="row">
			<table class="table">
				<thead style="border-bottom: solid gray 2px; font-size: large;">
					<tr>
						<th>번호</th>
						<th>회원번호</th>
						<th>이름</th>
						<th>성별</th>
						<th>등급</th>
						<th>접속여부</th>
						<th>접속횟수</th>
						<th>가입날짜</th>
						<th>등급변경</th>
						<th>블랙리스트추가</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ memList }" var="each" varStatus="status">
						<tr style="border-bottom: solid gray 1px; font-size: medium;">
							<td>${ status.count }</td>
							<td>${ each.getM_num() }</td>
							<td>
								<a href="">${ each.getM_name() }</a>
							</td>
							<td>${ each.getM_gender() }</td>
							<td>${ each.getM_grade() }</td>
							<td>${ each.getM_ox() }</td>
							<td>${ each.getM_logcount() }</td>
							<td>${ each.getM_date() }</td>
							<td>${ each.getM_grade() }</td>
							<%-- 현재는 현재의 등급만 넣어놓음 --%>
<!-- 							<td><select> -->
<!-- 									<option>1</option> -->
<!-- 									<option>2</option> -->
<!-- 									<option>3</option> -->
<!-- 									<option>4</option> -->
<!-- 									<option>5</option> -->
<!-- 									<option>6</option> -->
<!-- 								</select> -->
<!-- 							</td> -->
							<td><input type="button" value="블랙리스트추가하기"
								style="background-color: red;"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container">
		<h2>접속중인 회원목록</h2>
		<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>회원번호</th>
						<th>이름</th>
						<th>성별</th>
						<th>등급</th>
						<th>접속여부</th>
						<th>접속횟수</th>
						<th>가입날짜</th>
						<th>등급</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ nowMemOx }" var="each" varStatus="status">
						<tr>
							<td>${ status.count }</td>
							<td>${ each.getM_num() }</td>
							<td>
								<a href="">${ each.getM_name() }</a>
							</td>
							<td>${ each.getM_gender() }</td>
							<td>${ each.getM_grade() }</td>
							<td>${ each.getM_ox() }</td>
							<td>${ each.getM_logcount() }</td>
							<td>${ each.getM_date() }</td>
							<td>${ each.getM_grade() }</td>
							<%-- 현재는 현재의 등급만 넣어놓음 --%>
<!-- 							<td><select> -->
<!-- 									<option>1</option> -->
<!-- 									<option>2</option> -->
<!-- 									<option>3</option> -->
<!-- 									<option>4</option> -->
<!-- 									<option>5</option> -->
<!-- 									<option>6</option> -->
<!-- 								</select> -->
<!-- 							</td> -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
	<script>
	    $(document).ready( function () {
	        $('#bootstrap-table').bdt({
	            showSearchForm: 0,
	            showEntriesPerPageField: 0
	        });
	    });
	</script>
</body>
</html>
