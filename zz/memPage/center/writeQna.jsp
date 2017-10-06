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
		<h2 class="title">1:1 문의하기</h2>
		<p class="must_txt_info"><span>*</span> 표시정보는 필수 입력 사항입니다.</p>
		<form action="/aaa/mem/insertQna" method="post" id="fff">
		<table border="1" class="tb_inquiry">
			<caption>1:1 문의하기</caption>
			<colgroup>
				<col style="width:160px"><col>
			</colgroup>
			<tbody>
			<tr>
				<th scope="row"><i>이름</i></th>
				<td>${member.m_name }</td>
			</tr>
			<tr>
				<th scope="row"><i>연락처</i></th>
				<td>${member.m_phone }</td>
			</tr>
			<tr>
				<th scope="row"><i><span>*</span>문의유형</i></th>
				<td>
					<select title="문의유형 선택" name="category1" id="selCategory1" style="width:176px">
						<option value="0">선택해주세요.</option>
						
							<option value="2">취소/환불/반품 문의</option>
						
							<option value="6">교환 문의</option>
						
							<option value="10">배송 문의</option>
						
							<option value="14">배송상품/티켓 문의</option>
						
							<option value="18">구매/결제문의</option>
						
							<option value="26">회원/보상제도/기타</option>
						
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row"><i><span>*</span>문의제목</i></th>
				<td><input type="text" name="title" id="inTitle" title="문의제목 입력" style="width:500px"></td>
			</tr>
			<tr>
				<th scope="row"><i>연관있는 <br>자주묻는 질문</i></th>
				<td class="relation_qna">
					<ul id="_relatedFAQList">
					
						<li class="faqlist"><a href="http://help.ticketmonster.co.kr/faq?no=4486" class="question" data-serial="4486"><span class="q">질문</span> 반품 상품의 송장(반송장)번호를 등록했는데, 환불이 되지 않는 경우는 무엇인가요?<span class="bu"></span></a>
							<div class="answer"></div>
						</li>
					
						<li class="faqlist"><a href="http://help.ticketmonster.co.kr/faq?no=4218" class="question" data-serial="4218"><span class="q">질문</span> 휴면 계정이란 무엇인가요?<span class="bu"></span></a>
							<div class="answer"></div>
						</li>
					
						<li class="faqlist"><a href="http://help.ticketmonster.co.kr/faq?no=3834" class="question" data-serial="3834"><span class="q">질문</span> 바로 환불제가 무엇인가요?<span class="bu"></span></a>
							<div class="answer"></div>
						</li>
					
						<li class="faqlist"><a href="http://help.ticketmonster.co.kr/faq?no=4430" class="question" data-serial="4430"><span class="q">질문</span> 상품을 반품했는데, 언제 환불되나요?<span class="bu"></span></a>
							<div class="answer"></div>
						</li>
					
						<li class="faqlist"><a href="http://help.ticketmonster.co.kr/faq?no=3098" class="question" data-serial="3098"><span class="q">질문</span> 환불계좌 등록 및 변경은 어디서 하나요?<span class="bu"></span></a>
							<div class="answer"></div>
						</li>
					
					</ul>
				</td>
			</tr>
			<tr>
				<th scope="row"><i><span>*</span>문의내용</i></th>
				<td><textarea cols="30" rows="5" name="content" id="inContent" title="문의내용 입력"></textarea></td>
			</tr>
			</tbody>
		</table>
		<div class="btn_section">
			<i class="btn_inquiry"><button type="button" onclick="javascript:insertqq()">문의하기</button></i>
			<i class="btn_cancel"><button type="button" id="_cancelWrite" onclick="javascript:location.href='/aaa/mem/memQnaList'">취소하기</button></i>
		</div>
		</form>
	</article>
</div>

<script type="text/javascript">
	function insertqq() {
		var f = document.getElementById("fff");
		if(document.getElementById("selCategory1").value==0){
			alert("문의 유형을 선택해 주세요");
			document.getElementById("selCategory1").focus();
			return;
		}
		var f = document.getElementById("fff");
		if(document.getElementById("inTitle").value==0){
			alert("문의 제목을 입력해 주세요");
			document.getElementById("inTitle").focus();
			return;
		}
		var f = document.getElementById("fff");
		if(document.getElementById("inContent").value==0){
			alert("문의 내용을 입력해 주세요");
			document.getElementById("inContent").focus();
			return;
		}
	document.getElementById("fff").submit();
	}
</script>

	
	
</body>
</html>
