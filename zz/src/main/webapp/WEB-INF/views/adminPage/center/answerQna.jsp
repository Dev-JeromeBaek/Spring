<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<div>
	<article id="ct_cs">
		<h2 class="title">1:1 문의 답변하기</h2>
		<form action="/aaa/admin/answerQna" method="post" id="fff">
		<table border="1" class="tb_inquiry">
			<caption>1:1 문의 답변하기</caption>
			<colgroup>
				<col style="width:160px"><col>
			</colgroup>
			<tbody>
			<tr>
				<th scope="row"><i>회원 id</i></th>
				<td>${qna.q_m_id }</td>
			</tr>
			<tr>
				<th scope="row"><i><span></span>문의유형</i></th>
				<td>
					<c:choose>
						<c:when test="${qna.q_select==2 }">취소/환불/반품 문의</c:when>
						<c:when test="${qna.q_select==6 }">교환 문의</c:when>
						<c:when test="${qna.q_select==10 }">배송 문의</c:when>
						<c:when test="${qna.q_select==14 }">배송상품/티켓 문의</c:when>
						<c:when test="${qna.q_select==18 }">구매/결제문의</c:when>
						<c:when test="${qna.q_select==26 }">회원/보상제도/기타</c:when>
					</c:choose>
<!-- 						<option value="0">선택해주세요.</option> -->
				</td>
			</tr>
			<tr>
				<th scope="row"><i><span></span>문의제목</i></th>
				<td>${qna.q_title }</td>
			</tr>
			<tr>
				<th scope="row"><i><span></span>문의내용</i></th>
				<td><textarea cols="30" rows="5" name="content" id="inContent" title="문의내용" disabled="disabled">${qna.q_content}</textarea></td>
			</tr>
			<tr>
				<th scope="row"><i><span></span>답변</i></th>
				<td><textarea cols="30" rows="5" name="answer" id="inAnswer"title="답변">${qna.q_ans }</textarea></td>
			</tr>
			</tbody>
		</table>
		<div class="btn_section">
			<i class="btn_inquiry"><button type="button" onclick="javascript:answerQna()">답변 등록하기</button></i>
			<i class="btn_cancel"><button type="button" id="_cancelWrite" onclick="javascript:location.href='/aaa/admin/adminQnaList'">취소하기</button></i>
		</div>
		<input type="hidden" name="q_num" value="${qna.q_num }">
		</form>
	</article>
</div>
<script type="text/javascript">
	function answerQna() {
		if(document.getElementById("fff").value==""){
			alert("답변내용을 입력해 주세요");
			document.getElementById("inAnswer").focus();
			return;
		}
		document.getElementById("fff").submit();
	}
</script>

</body>
</html>