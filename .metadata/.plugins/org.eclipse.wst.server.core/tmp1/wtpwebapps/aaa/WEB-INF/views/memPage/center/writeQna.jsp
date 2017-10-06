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
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-125" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/writeQna.jsp">
<div data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-125" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/writeQna.jsp">
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
