<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2 {
	font-weight: bold;
}
</style>
</head>
<body>
	<h2>QnA List페이지</h2>

	<a href="/aaa/mem/insertQnaForm">QnA 작성하기</a>
	<h4 class="stit">
		<span class="qna">나의 1:1문의 내역</span>
	</h4>
	<div class="tb_type">
		<table cellspacing="0">
			<caption>나의 1:1문의 내역 리스트</caption>
			<colgroup>
				<col width="118">
				<col>
				<col width="76">
				<col width="136">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">답변여부</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!listc.isEmpty() }">
						<c:forEach var="each" items="${ listc }">
							<tr>
								<td>${each.q_num }</td>
								<c:choose>
									<c:when test="${each.q_ans!=null }">
										<td style="width: 350px;">
										<a class="answertd" style="cursor: pointer;" onclick="slidee(${ each.q_num })">${ each.q_title }</a></td>
									</c:when>
									<c:otherwise>
										<td style="width: 500px;">${each.q_title }</td>
									</c:otherwise>
								</c:choose>
								<td style="width: 200px;">${each.q_date }</td>
								<td>${each.q_ans!=null }</td>
								<td><button
										onclick="javascript:location='/aaa/mem/modifyQna?q_num=${each.q_num}'">수정</button>
									<button
										onclick="javascript:location='/aaa/mem/deleteQna?q_num=${each.q_num}'">삭제</button></td>
							</tr>
							<c:if test="${each.q_ans!=null }">
								<tr id="num${each.q_num }" class="nnnn">
									<td></td>
									<td colspan=3>${each.q_ans }</td>
									<td>${ each.q_ans_date }</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" style="padding: 30px">등록된 1:1문의가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

	<script>
		$(".nnnn").hide();
	
		function slidee(num) {
			$("#num" + num).slideToggle();
		}
	</script>
	
	<div class="date_control">
		<select title="리스트 정렬 방법" id="filter" style="width: 100px"
			onchange="changeFilter()">
			<option value="">전체 문의</option>
			<option value="N">미답변</option>
			<option value="Y">답변 완료</option>
		</select>
	</div>
	<div class="tb_qna">
		<table cellspacing="0" border="1">
			<caption>1:1 문의/답변</caption>
			<colgroup>
				<col width="150">
				<col width="215">
				<col>
				<col width="100">
				<col width="100">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">문의유형</th>
					<th scope="col">상품명</th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">답변여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" style="padding: 30px">등록된 1:1문의가 없습니다.</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>
