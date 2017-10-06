<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/aaa/resources/js/yeob/httpRequest.js"></script>
</head>
<body>
<form name="qqq">
<table>
	<tr><th>거래 이름</th><th>${di.di_name }</th>
	<tr><th>질문 내용</th><td>${dq.dq_content }</td></tr>
	<tr><th>답변 </th>
		<td><textarea style="width: 200px;height: 200px;" name="answer"></textarea></td></tr>
	<tr><td colspan="2">
		<c:choose>
			<c:when test="${dq.dq_ans==null }">
				<input type="button" value="답변 등록하기" onclick="insertAns()">
			</c:when>
			<c:otherwise>
				<input type="button" value="답변 수정하기" onclick="insertAns()">
			</c:otherwise>
		</c:choose>
				</td></tr>
</table>
</form>
<script type="text/javascript">
	if("${dq.dq_ans}"!="")	document.getElementsByName("answer")[0].value="${dq.dq_ans}";
	
// 	alert("${dq.dq_ans}"!="");
	function insertAns() {
		var qaqa = document.qqq;
		var anan = qaqa.answer.value.replace(/\n/g, "<br>");
		var params = "dqnum="+"${dq.dq_num}"+"&answer="+anan;
		sendRequest("/aaa/idvCorp/DQAnsInsert",params,callQna,"post");
	}
	
	function callQna(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				var msg = httpRequest.responseText;
				if(msg=="답변 완료")
					self.close();
					opener.location.reload();
			}else{
				alert("*** 실패 : " + httpRequest.status);
			}
		}
	}
</script>
</body>
</html>
